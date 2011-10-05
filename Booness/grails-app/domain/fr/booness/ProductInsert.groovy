package fr.booness

class ProductInsert {
	Product product
	Integer quantity
	Float price
	

    static constraints = {
		quantity(min:1)
		price(nullable:true, blankable:true)
		
    }
}
