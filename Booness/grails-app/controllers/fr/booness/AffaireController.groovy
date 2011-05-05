package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class AffaireController {

	def springSecurityService

	static navigation = [
		title: 'Affaire',
		group: 'user',
		order: 40,
		action:'list'
	]

	def index = { redirect(action: "list", params: params) }

	// the delete, save and update actions only accept POST requests
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def list = {
		params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
		[affaireInstanceList: Affaire.list(params), affaireInstanceTotal: Affaire.count()]
	}

	def create = {
		def affaireInstance = new Affaire()
		affaireInstance.properties = params
		return [affaireInstance: affaireInstance]
	}

	def save = {
		def affaireInstance = new Affaire(params)
		User.get(springSecurityService.principal.id).addToAffaires(affaireInstance)
		if (!affaireInstance.hasErrors() && affaireInstance.save()) {
			flash.message = "affaire.created"
			flash.args = [affaireInstance.id]
			flash.defaultMessage = "Affaire ${affaireInstance.id} created"
			redirect(action: "show", id: affaireInstance.id)
		}
		else {
			render(view: "create", model: [affaireInstance: affaireInstance])
		}
	}

	def show = {
		def affaireInstance = Affaire.get(params.id)
		if (!affaireInstance) {
			flash.message = "affaire.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Affaire not found with id ${params.id}"
			redirect(action: "list")
		}
		else {
			return [affaireInstance: affaireInstance]
		}
	}

	def edit = {
		def affaireInstance = Affaire.get(params.id)
		if(affaireInstance?.owner.id==springSecurityService?.principal?.id){
			if (!affaireInstance) {
				flash.message = "affaire.not.found"
				flash.args = [params.id]
				flash.defaultMessage = "Affaire not found with id ${params.id}"
				redirect(action: "list")
			}
			else {
				return [affaireInstance: affaireInstance]
			}
		}
		else {
			redirect(action: "show", id:params.id)
		}
	}

	def update = {
		def affaireInstance = Affaire.get(params.id)
		if (affaireInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (affaireInstance.version > version) {

					affaireInstance.errors.rejectValue("version", "affaire.optimistic.locking.failure", "Another user has updated this Affaire while you were editing")
					render(view: "edit", model: [affaireInstance: affaireInstance])
					return
				}
			}
			affaireInstance.properties = params
			if (!affaireInstance.hasErrors() && affaireInstance.save()) {
				flash.message = "affaire.updated"
				flash.args = [params.id]
				flash.defaultMessage = "Affaire ${params.id} updated"
				redirect(action: "show", id: affaireInstance.id)
			}
			else {
				render(view: "edit", model: [affaireInstance: affaireInstance])
			}
		}
		else {
			flash.message = "affaire.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "Affaire not found with id ${params.id}"
			redirect(action: "edit", id: params.id)
		}
	}

	def delete = {
		def affaireInstance = Affaire.get(params.id)
		if(affaireInstance?.owner.id==springSecurityService?.principal?.id){
			if (affaireInstance) {
				try {
					affaireInstance.delete()
					flash.message = "affaire.deleted"
					flash.args = [params.id]
					flash.defaultMessage = "Affaire ${params.id} deleted"
					redirect(action: "list")
				}
				catch (org.springframework.dao.DataIntegrityViolationException e) {
					flash.message = "affaire.not.deleted"
					flash.args = [params.id]
					flash.defaultMessage = "Affaire ${params.id} could not be deleted"
					redirect(action: "show", id: params.id)
				}
			}
			else {
				flash.message = "affaire.not.found"
				flash.args = [params.id]
				flash.defaultMessage = "Affaire not found with id ${params.id}"
				redirect(action: "list")
			}
		}
		else {
			flash.message = "affaire.not.deleted"
			flash.args = [params.id]
			flash.defaultMessage = "Affaire ${params.id} could not be deleted"
			redirect(action: "show", id: params.id)
		}
	}
}
