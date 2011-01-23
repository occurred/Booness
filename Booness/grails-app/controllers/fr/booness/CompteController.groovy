package fr.booness

import grails.converters.deep.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])class CompteController {
    def scaffold=true

     static navigation = [
        title: 'Accounts',
        group: 'user',
        order: 10
    ]

    def ajaxGetComptes ={
        render Compte.list() as JSON
    }
}
