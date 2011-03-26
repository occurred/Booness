package fr.booness


class UserController {

    def scaffold = true
    def springSecurityService

    static navigation = [
        title: 'Users',
        group: 'admin'
    ]

    def index={
        redirect(action:list)
    }

    def changePassword = {
        if(params.password){
            if(params.password==params.repassword){
                def user = User.get(springSecurityService.principal.id)
                def password=springSecurityService.encodePassword(params.password)
                def oldpassword=springSecurityService.encodePassword(params.oldpassword)
                if(oldpassword==user.password && password!=user.password){
                    user.password=password
                }
                user.save(flush:true)
            }
        }
    }
}
