package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

    def springSecurityService


    static navigation = [
        title: 'profile',
        group: 'user',
        order: 70
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



}
