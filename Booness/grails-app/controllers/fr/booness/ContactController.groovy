package fr.booness

import grails.converters.*

class ContactController {

    def GeocoderService

    static navigation = [
        title: 'Contacts',
        group: 'user',
        order: 50
    ]

    def scaffold=true

    def index={
        redirect(action:list)
        
    }

    def getCities={
        def cit= geocoderService.getCities(params.zip,params.country)
        render cit as JSON
    }
}
