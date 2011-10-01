package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProfileController {

	def springSecurityService

	def index={ redirect(action:show) }

	def show={
		User principal
		boolean same=true
		if(params.id){
			principal=User.get(Long.parseLong(params.id))
			same=params.id.equals(""+springSecurityService.principal.id)
		}
		else {
			principal = User.get(springSecurityService.principal.id)
		}
		
		def activites=[:]
		def affaires=[:]
		(2008..(new Date().year+1900)).each{ year->
			(1..9).each{month->
				activites[year+"/0"+month]=0
				affaires[year+"/0"+month]=0
			}
			activites[year+"/10"]=0
			activites[year+"/11"]=0
			activites[year+"/12"]=0
			
			affaires[year+"/10"]=0
			affaires[year+"/11"]=0
			affaires[year+"/12"]=0
		}
		
		
		principal.logs.each{
			def date=it.startDate.format("yyyy/MM")
			if(activites[date]!=null) {
				activites[date]+=1
			}
		}
		
		principal.affaires.each{
			if(!it.dateCreated){
				it.dateCreated=new Date()
				it.save(flush:true)
			}
			if(!it.description){
				it.description=new Date()
				it.save(flush:true)
			}
			def date=it.dateCreated?.format("yyyy/MM")
			if(affaires[date]!=null) {
				affaires[date]+=1
			}
		}

		[userInstance:principal,sameUser:same,activites:activites, affaires:affaires]
	}

	def edit = {
		def userInstance = getUser()
		if (!userInstance) {
			flash.message = "user.not.found"
			flash.args = [params.id]
			flash.defaultMessage = "User not found with id ${params.id}"
			redirect(action: "list")
		}
		else {
			return [userInstance: userInstance]
		}
	}
	
	private User getUser(){
		if(""+springSecurityService.principal.id!=params.id){
			if(!("ROLE_ADMIN" in springSecurityService.currentUser.authorities.collect{ it.authority})){
				if(params.id) redirect(action:'show', id:params.id)
			}
		}
		return User.get(params.id?Long.parseLong(params.id):springSecurityService.principal.id)
		
	}

	def update = {
		def userInstance = getUser()
		if (userInstance) {
			if (params.version) {
				def version = params.version.toLong()
				if (userInstance.version > version) {

					userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing")
					render(view: "edit", model: [userInstance: userInstance])
					return
				}
			}
			userInstance.properties = params
			if (!userInstance.hasErrors() && userInstance.save()) {
				flash.message = "user.updated"
				flash.args = [
					springSecurityService.principal.id
				]
				flash.defaultMessage = "User ${userInstance.name} updated"
				redirect(action: "show", id: userInstance.id)
			}
			else {
				render(view: "edit", model: [userInstance: userInstance])
			}
		}
		else {
			flash.message = "user.not.found"
			flash.args = [
				springSecurityService.principal.id
			]
			flash.defaultMessage = "User not found with id ${springSecurityService.principal.id}"
			redirect(action: "edit", id: springSecurityService.principal.id)
		}
	}
}
