package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class LogController{

    def scaffold=true

    def springSecurityService

    static navigation = [
        title: 'Activités',
        group: 'user',
        order: 30
    ]

    def index={
        redirect(action:list)
    }

     @Secured(['ROLE_USER'])
    def save={
        //System.out.println params
        def log = new Log(params)
        User principal = User.get(springSecurityService.principal.id)
        principal.addToLogs(log)
        if (log.save(flush: true)) {
            flash.message = "Nouvelle Activite ${log.title} creee"
            redirect(action: "show", id: log.id)
        }
        else {
            render(view: "create", model: [logInstance: Log])
        }
    }


}
