package fr.booness

import grails.converters.deep.JSON

class CompteController {
    def scaffold=true

     static navigation = [
        tilte: 'Compte',
        group: 'user',
        order: 10
    ]

    def ajaxGetComptes ={
        render Compte.list() as JSON
    }
}
