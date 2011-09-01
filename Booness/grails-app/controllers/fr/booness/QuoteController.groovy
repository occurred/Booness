package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class QuoteController {

	def scaffold = true

	static navigation = [
		title: 'Quotes',
		group: 'user',
		order: 50
	]

	def index={ redirect(action:list) }

	def searchAjax = {
		def products = Product.findAllByCodeLike("${params.query}%",[max:10])

		//Create XML response
		render(contentType: "text/xml") {
			results() {
				products.each { product ->
					result(){
						name(product.code + " -- "+product.description)
						//Optional id which will be available in onItemSelect
						id(product.id)
					}
				}
			}
		}
	}


	@Secured(['ROLE_USER'])
	def wizardFlow={
		chooseAffaire {
			on("next"){
				flow.affaire=Affaire.findByName(params.affaire)
			}.to("createQuote")
		}

		createQuote {
			on("finish"){
				def quote=new Quote(params)
				quote.save()
				flow.affaire.addToQuotes(quote)
				flow.quote=quote
			}.to("finish")
			on("previous").to("chooseAffaire")
		}

		finish {
			def params=[id:flow.quote.id]
			redirect(controller:"quote", action: "edit", params: params)
		}
	}
}
