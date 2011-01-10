package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

    def springSecurityService

    static navigation = [
        title: 'Profile',
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
        [profileInstance:principal]
    }

    def edit={
        User principal = User.get(springSecurityService.principal.id)
        [profileInstance:principal]
    }

    def update={
        User principal = User.get(springSecurityService.principal.id)
        principal.properties = params
        if(principal.validate()){
            flash.message = "Update Successful"
            redirect(action:show)
        }
        else{
            principal.profile.save(flush:true)
            redirect(action: "edit", model: [profileInstance: principal])
        }
        
    }


}
