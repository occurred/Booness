package fr.booness

class ContactController {

     static navigation = [
        tilte: 'Contact',
        group: 'user',
        order: 50
    ]
    
    def index={
        redirect(action:list)
    }
    
    def scaffold=true
}
