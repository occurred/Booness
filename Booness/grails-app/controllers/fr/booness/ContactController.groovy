package fr.booness

import grails.converters.*
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ContactController {

	def GeocoderService

	static navigation = [
		title: 'Contacts',
		group: 'user',
		order: 20
	]

	def scaffold=true

	def index={ redirect(action:list) }

	def getCities={
		def cit= geocoderService.getCities(params.zip,params.country)
		render cit as JSON
	}

	def linkToCompte={
		if(params.compteid){
			Contact contact=Contact.get(params.id)
			Compte compte=Compte.get(Long.parseLong(params.compteid))
			
			println compte
			println contact
			contact.compte=compte
			contact.save(flush:true)
			redirect(action:'show', id:params.id)
		}
		else{
			[contactInstance:Contact.get(params.id)]
		}
	}
}
