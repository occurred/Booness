package fr.booness

class ContactController {

    static navigation = [
        title: 'Contacts',
        group: 'user',
        order: 50
    ]

    def scaffold=true

    def index={
        redirect(action:list)
    }
}
