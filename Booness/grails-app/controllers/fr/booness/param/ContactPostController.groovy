package fr.booness.param

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ContactPostController {


	static navigation = [
		title: 'Type de Fonction',
		group: 'admin',
		order: 1000
	]

	def scaffold=true

	def index={ redirect(action:'list') }

	def merge={}
	
	def mergeit={
			def tomerge=ContactPost.get(params.post1)
			def todelete=ContactPost.get(params.post2)
			def c1 = fr.booness.Contact.createCriteria()
			def results=c1.list(){
				eq('post',todelete)
			}

			results.each{contact->
				contact.post=tomerge
				contact.save()
			}

			todelete.delete()
			
			redirect(action:'merge')
	}
}
