package fr.booness

class ProfileController {

    def scaffold=true

    static navigation = [
        tilte: 'Profile',
        group: 'user',
        order: 1000
    ]

    def index={
        redirect(action:list)
    }
}
