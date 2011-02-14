package fr.booness

import grails.plugins.springsecurity.Secured
import org.compass.core.engine.SearchEngineQueryParseException

@Secured(['ROLE_USER'])
class DashboardController {

    def springSecurityService
    def searchableService

    @Secured(['ROLE_USER'])
    def index = {
        User principal = User.get(springSecurityService.principal.id)
        if(principal){
            [user:principal]
        }
    }
    
    @Secured(['ROLE_USER'])
    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            return [searchResult:searchableService.search(params.q, params) ]
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }

}
