package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class AffaireController {

    def scaffold=true
    def springSecurityService

    static navigation = [
        title: 'Affaires',
        group: 'user',
        order: 20
    ]
    
    @Secured(['ROLE_USER'])
    def save={
        //System.out.println params
        def affaire = new Affaire(params)
        User principal = User.get(springSecurityService.principal.id)
        principal.addToAffaires(affaire)
        if (affaire.save(flush: true)) {
            flash.message = "new affaire ${affaire.name} created"
            redirect(action: "show", id: affaire.id)
        }
        else {
            render(view: "create", model: [affaire: affaire])
        }
    }

    @Secured(['ROLE_USER'])
    def delete={
        def affaire=Affaire.get(params.id)
        System.out.println affaire.compte
        if (affaire.delete(flush: true)) {
            flash.message = "affaire ${affaire.name} deleted"
        }
        else {
            flash.error = "Could not delete affaire ${affaire.name}"
        }
        redirect(action: "list")
    }

    @Secured(['ROLE_USER'])
    def create={
        redirect(action:'wizard')
    }

    @Secured(['ROLE_USER'])
    def wizardFlow={
        chooseCompte {
            on("next"){
                flow.compte=Compte.findByName(params.compte)
            }.to("createAffaire")
            on("new").to("createCompte")
        }

        createAffaire {
            on("finish"){
                System.out.println params
                def affaire=new Affaire(params)
                System.out.println affaire
                User principal = User.get(springSecurityService.principal.id)
                principal.addToAffaires(affaire)
                System.out.println flow.compte
                flow.compte.addToAffaires(affaire)
                //affaire.save(flush:true)
            }.to("finish")
            on("previous").to("chooseCompte")
        }

        createCompte {
            on("save"){
                flow.compte=new Compte(params)
                flow.compte.save(flush:true)
                System.out.println flow.compte
            }.to("createAffaire")
            on("previous").to("chooseCompte")
        }

        finish {
            redirect(controller:"affaire", action: "index")
        }
    }
}
