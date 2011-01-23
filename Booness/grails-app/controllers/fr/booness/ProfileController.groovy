package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

    def springSecurityService

    def scaffold=User

    static navigation = [
        title: 'profile',
        group: 'user',
        order: 1000
    ]

    def index={
        redirect(action:show)
    }

    @Secured(['ROLE_ADMIN'])
    def list

    def show={
        User principal = User.get(springSecurityService.principal.id)
        println principal
        [userInstance:principal]
    }

    def edit={
        User principal = User.get(springSecurityService.principal.id)
        [userInstance:principal]
    }

    def update={
        User principal = User.get(springSecurityService.principal.id)
        principal.properties = params
        if(principal.validate()){
            flash.message = "Update Successful"
            redirect(action:show)
        }
        else{
            principal.save(flush:true)
            redirect(action: "edit", model: [profileInstance: principal])
        }
        
    }


}
