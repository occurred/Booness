package fr.booness


class UserController {

    def scaffold = true

    static navigation = [
        title: 'Users',
        group: 'admin'
    ]

    def index={
        redirect(action:list)
    }
}
