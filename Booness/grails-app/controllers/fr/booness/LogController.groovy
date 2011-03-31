package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class LogController{

    def scaffold=true

    def springSecurityService

    static navigation = [
        title: 'Logs',
        group: 'user',
        order: 30
    ]

    def index={
        redirect(action:list)
    }

}
