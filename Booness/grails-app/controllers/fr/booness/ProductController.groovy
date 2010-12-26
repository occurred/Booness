package fr.booness

class ProductController {

    def scaffold=true

    static navigation = [
        tilte: 'Product',
        group: 'user',
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
