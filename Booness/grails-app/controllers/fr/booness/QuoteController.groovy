package fr.booness

import grails.plugins.springsecurity.Secured

class QuoteController {

    def scaffold = true

    static navigation = [
        title: 'Quotes',
        group: 'user',
        order: 40
    ]

    def index={
        redirect(action:list)
    }

    @Secured(['ROLE_USER'])
    def create={
        redirect(action:'wizard')
    }

    @Secured(['ROLE_USER'])
    def wizardFlow={
        chooseAffaire {
            on("next"){
                flow.affaire=Affaire.findByName(params.affaire)
            }.to("createQuote")
        }

        createQuote {
            on("finish"){
                def quote=new Quote(params)
                quote.save()
                flow.affaire.addToQuotes(quote)
                flow.quote=quote
            }.to("finish")
            on("previous").to("chooseAffaire")
        }

        finish {
            def params=[id:flow.quote.id]
            redirect(controller:"quote", action: "edit", params: params)
        }
    }
}
