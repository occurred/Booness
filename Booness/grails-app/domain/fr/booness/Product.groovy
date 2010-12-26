package fr.booness

class Product {
    String name
    String description
    byte[] photo
    Integer price

    static constraints = {
        name(blank:false)
        description(maxSize:2048)
        photo()
        price(min:0)
    }

    String toString(){
        return name
    }
}
