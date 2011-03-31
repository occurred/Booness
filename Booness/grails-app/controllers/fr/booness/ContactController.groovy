package fr.booness

import grails.converters.*

class ContactController {

    def GeocoderService

    static navigation = [
        title: 'Contacts',
        group: 'user',
        order: 20
    ]

    def scaffold=true

    def index={
        redirect(action:list)
        
    }

    def getCities={
        def cit= geocoderService.getCities(params.zip,params.country)
        render cit as JSON
    }

    def getCompteId={
        def c = Compte.createCriteria()
        def results = c.list {
            contacts {
                eq('id',Long.parseLong(params.id))
            }
        }
        render results[0].id
    }
}
