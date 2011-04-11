package fr.booness

class Product {
    String name
    String description
    byte[] photo
    Integer price

    static constraints = {
        name(nullable:false, blank:false)
        description(maxSize:2048)
        photo(maxSize:1048567)
        price(min:0)
    }

    static searchable=[only: ['name', 'description']]

    String toString(){
        return name
    }
}
