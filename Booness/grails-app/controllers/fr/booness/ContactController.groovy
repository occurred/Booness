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
			if(!compte.type){
			compte.type=fr.booness.param.CompteType.get(1)
				}
			if(!contact.post){
				contact.post=fr.booness.param.ContactPost.get(1)
			}
			println compte.type
			println contact.post
			contact.compte=compte
			compte.save(flush:true, failOnError:true)
			redirect(action:'show', id:params.id)
		}
		else{
			[contactInstance:Contact.get(params.id)]
		}
	}
}
