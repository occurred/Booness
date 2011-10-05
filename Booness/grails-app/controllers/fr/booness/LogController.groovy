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
	
	def create = {
		def logInstance=new Log(params)
		logInstance.startDate=new Date()
		logInstance.endDate=new Date()
		[logInstance:logInstance]	
    }

     @Secured(['ROLE_USER'])
    def save={
        //System.out.println params
        def log = new Log(params)
		if(!log.title) log.title=log.type.toString()
		if(log.startDate==log.endDate) log.allday=true
        User principal = User.get(springSecurityService.principal.id)
        principal.addToLogs(log)
        if (log.save(flush: true)) {
            flash.message = "Nouvelle Activité ${log.title} créée"
            redirect(action: "show", id: log.id)
        }
        else {
            render(view: "create", model: [logInstance: Log])
        }
    }


}

