package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ParametersController {
	
	static navigation = [
        title: 'Parametres',
        group: 'admin',
        order: 1000
    ]
	
	
    def scaffold=true
}
