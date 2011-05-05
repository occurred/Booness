package fr.booness

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class CompteController {
	def scaffold=true
	def springSecurityService
	

	static navigation = [
		title: 'Accounts',
		group: 'user',
		order: 10,
		action:'list'
	]
	
	def slide={
		[compteInstance:Compte.get(Long.parseLong(params.id))]
		}

	def print={
		[compteInstance:Compte.get(Long.parseLong(params.id))]
	}

	def list = {
		params.max = Math.min(params.max ? params.max.toInteger() : 10,  100)
		def results
		int total=0
		if(!params.full){
			if(!params.userid) params.userid=""+springSecurityService.principal.id
		}
		if(params.userid){
			println params.userid
			def c = Compte.createCriteria()
			results=c.list (params) {
				or {
					Departement.findAllByUser(User.get(Long.parseLong(params.userid))).each{d->
						like("zip",d.numero+"%")
					}
				}
			}
			total=results.totalCount
		}
		else if(params.departementid){
			def d=Departement.get(Long.parseLong(params.departementid))
			def c = Compte.createCriteria()
			results=c.list (params){
				like("zip",d.numero+"%")
			}
			total=results.totalCount
		}
		else{
			results = Compte.list(params)
			total=Compte.count()
		}
		[compteInstanceList:results, compteInstanceTotal: total]
	}
}
