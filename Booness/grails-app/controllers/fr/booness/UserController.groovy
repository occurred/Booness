package fr.booness

import grails.plugins.springsecurity.Secured


class UserController {

   
    def scaffold = true
    def springSecurityService

    static navigation = [
        title: 'Users',
        group: 'admin'
    ]

    @Secured(['ROLE_USER'])
    def changePassword = {
        if(params.password){
            if(params.password==params.repassword){
                def user = User.get(springSecurityService.principal.id)
                def password=springSecurityService.encodePassword(params.password)
                def oldpassword=springSecurityService.encodePassword(params.oldpassword)
                if(oldpassword==user.password && password!=user.password){
                    user.password=password
                }
                user.save(flush:true)
                flash.message='password.changed.successful'
                flash.defaultMessage='Le nouveau mot de passe est change avec succes'
            }
            else{
                flash.error='password.changed.fail'
                flash.defaultMessage='Le mot de passe est inchange'
            }
            redirect(controller:'profile', action:'show')
        }

    }

    @Secured(['ROLE_ADMIN'])
    def index = { redirect(action: "list", params: params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    @Secured(['ROLE_ADMIN'])
    def list = {
        params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }

    @Secured(['ROLE_ADMIN'])
    def create = {
        def userInstance = new User()
        userInstance.properties = params
        return [userInstance: userInstance]
    }

    @Secured(['ROLE_ADMIN'])
    def save = {
        def userInstance = new User(params)
        if (!userInstance.hasErrors() && userInstance.save()) {
            flash.message = "user.created"
            flash.args = [userInstance.id]
            flash.defaultMessage = "User ${userInstance.id} created"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
		if(!("ROLE_ADMIN" in springSecurityService.currentUser.authorities.collect{ it.authority})){
			redirect(controller:'profile', action:'show', id:params.id)
		}
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def edit = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance]
        }
    }

    @Secured(['ROLE_ADMIN'])
    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    
                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
            userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save()) {
                flash.message = "user.updated"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} updated"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "edit", id: params.id)
        }
    }

    @Secured(['ROLE_ADMIN'])
    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
                userInstance.delete()
                flash.message = "user.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} deleted"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "user.not.deleted"
                flash.args = [params.id]
                flash.defaultMessage = "User ${params.id} could not be deleted"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [params.id]
            flash.defaultMessage = "User not found with id ${params.id}"
            redirect(action: "list")
        }
    }
}
