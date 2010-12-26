package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

    def springSecurityService

    static navigation = [
        tilte: 'Profile',
        group: 'user',
        order: 1000
    ]

    def index={
        redirect(action:show)
    }

    def show={
        User principal = User.get(springSecurityService.principal.id)
        [profileInstance:principal.profile]
    }

    def edit={
        User principal = User.get(springSecurityService.principal.id)
        [profileInstance:principal.profile]
    }

    def update={
        User principal = User.get(springSecurityService.principal.id)
        principal.profile.properties = params
        if(principal.profile.validate()){
            flash.message = "Update Successful"
            redirect(action:show)
        }
        else{
            principal.profile.save(flush:true)
            redirect(action: "edit", model: [profileInstance: principal.profile])
        }
        
    }


}
