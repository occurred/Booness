package fr.booness.param

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class LogTypeController {

    static navigation = [
        title: 'Type d\'Activite',
        group: 'admin',
        order: 1000
    ]

    def scaffold = true

    def index={
        redirect(action:'list')
    }

}
