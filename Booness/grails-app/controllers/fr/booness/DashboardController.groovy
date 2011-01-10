package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class DashboardController {

    def springSecurityService

    @Secured(['ROLE_USER'])
    def index = {
        User principal = User.get(springSecurityService.principal.id)
        if(principal){
            [user:principal]
        }
    }
}
