package fr.booness

class Product {
    String code
	String codeThermador
    String description
	String section
	String page
    Float priceCaleffiFrance
	Float priceGrossiste

    static constraints = {
        code(unique:true, nullable:false, blank:false)
		codeThermador(blankable:true)
        description(maxSize:2048)
        priceCaleffiFrance(min:0f)
		section(nullable:true, blankable:true)
		page(nullable:true, blankable:true)
		priceGrossiste(min:0f)
    }

    static searchable=[only: ['code', 'description']]

    String toString(){
        return code
    }
}
