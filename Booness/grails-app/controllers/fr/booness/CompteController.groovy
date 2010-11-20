package fr.booness

import grails.converters.deep.JSON

class CompteController {
    def scaffold=true

    def ajaxGetComptes ={
        render Compte.list() as JSON
    }
}
