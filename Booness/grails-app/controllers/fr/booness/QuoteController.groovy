package fr.booness

class QuoteController {

    def scaffold = true

    static navigation = [
        tilte: 'Quote',
        group: 'user',
        order: 40
    ]

    def index={
        redirect(action:list)
    }
}
