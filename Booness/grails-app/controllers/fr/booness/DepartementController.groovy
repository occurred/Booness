package fr.booness
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class DepartementController {

    def scaffold=true
	
	static navigation = [
		title: 'Departements',
		group: 'user',
		action: 'list',
                order: 1000
	]

    def getCompteCount = {
        def d=Departement.get(params.id)
        Compte.withCriteria{
            projections {
                count('id')
            }
            like("zip",d.numero+"%")
        }
    }
}
