package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])class ProductController {

    def scaffold=true

    static navigation = [
        title: 'Products',
        group: 'nuser',
        order: 100
    ]

    def index={
        redirect(action:list)
    }
    
    def renderImage = {
       Product p=Product.get(params.id)
       response.setContentLength(p.photo.length)
       response.outputStream.write(p.photo)
    }

}
