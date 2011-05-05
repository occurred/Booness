package fr.booness

class Product {
    String code
	String codeThermador
    String description
	Integer section
	Integer page
    Float priceCaleffiFrance
	Float priceGrossiste

    static constraints = {
        code(unique:true, nullable:false, blank:false)
        description(maxSize:2048)
        priceCaleffiFrance(min:0f)
		section(min:0)
		page(min:0)
		priceGrossiste(min:0f)
    }

    static searchable=[only: ['code', 'description']]

    String toString(){
        return name
    }
}
