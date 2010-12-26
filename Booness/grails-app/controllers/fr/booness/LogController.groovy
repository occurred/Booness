package fr.booness

class LogController {

    def scaffold=true

    def springSecurityService

    static navigation = [
        tilte: 'Affaire',
        group: 'debug',
        order: 25
    ]

    def index={
        redirect(action:list)
    }

}
