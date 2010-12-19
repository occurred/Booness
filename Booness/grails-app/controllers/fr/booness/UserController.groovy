package fr.booness


class UserController {

    def scaffold = true
    static navigation = [
        tilte: 'Affaire',
        group: 'admin'
    ]

    def index={
        redirect(action:list)
    }
}
