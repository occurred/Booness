package fr.booness


class UserController {

    def scaffold = true

    static navigation = [
        title: 'Affaires',
        group: 'admin'
    ]

    def index={
        redirect(action:list)
    }
}
