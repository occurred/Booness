package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

    def springSecurityService

    def index={
        redirect(action:show)
    }

    def show={
        User principal = User.get(springSecurityService.principal.id)
        println principal
        [userInstance:principal]
    }

    def edit = {
        def userInstance = User.get(springSecurityService.principal.id)
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

    def update = {
        def userInstance = User.get(springSecurityService.principal.id)
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
                flash.args = [springSecurityService.principal.id]
                flash.defaultMessage = "User ${userInstance.name} updated"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }
        else {
            flash.message = "user.not.found"
            flash.args = [springSecurityService.principal.id]
            flash.defaultMessage = "User not found with id ${springSecurityService.principal.id}"
            redirect(action: "edit", id: springSecurityService.principal.id)
        }
    }



}
