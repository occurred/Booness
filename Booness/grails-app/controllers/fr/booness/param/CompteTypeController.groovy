package fr.booness.param

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class CompteTypeController {


    static navigation = [
        title: 'Type de Compte',
        group: 'admin',
        order: 1000
    ]

    def scaffold = true

    def index={
        redirect(action:'list')
    }
}
