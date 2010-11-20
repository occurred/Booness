package fr.booness

class ProductController {

    def scaffold=true

    def renderImage = {
       Product p=Product.get(params.id)
       response.setContentLength(p.photo.length)
       response.outputStream.write(p.photo)
    }

}
