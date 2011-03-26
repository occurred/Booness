package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class QuoteController {

    def scaffold = true

    static navigation = [
        title: 'Quotes',
        group: 'nuser',
        order: 90
    ]

    def index={
        redirect(action:list)
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
