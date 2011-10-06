package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class QuoteController {

	def scaffold = true
	
	def springSecurity

	static navigation = [
		title: 'Quotes',
		group: 'user',
		order: 50
	]

	def index={ redirect(action:list) }
	
	def show = {
		def quote=Quote.get(params.id)
		[quoteInstance:quote]
	}

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

	def addProduct = {
		def code=params.product.split(" -- ")[0]
		def updated=false
		if(params.product.size()>0){
			session.quote.products.each{
				if(it.product.code==code){
					it.quantity+=Integer.parseInt(params.quantity)
					updated=true
				}
			}
			if(!updated){
				ProductInsert pi=new ProductInsert()
				pi.product=Product.findByCode(code)
				pi.quantity=Integer.parseInt(params.quantity)
				pi.price=pi.product.priceCaleffiFrance
				session.quote.addToProducts(pi)
			}
		}
		
		render(template:'productList', collection:session.quote.products, var:'product')
		render(template:'total', model:[total:session.quote.total])
	}

	def removeProduct = {
		println params.code
		if(params.code){
			def toremove
			session.quote.products.each{
				if(it.product.code==params.code){
					toremove=it
				}
				
				
			}
			if(toremove){
				session.quote.removeFromProducts(toremove)
			}
		}
		render(template:'productList', collection:session.quote.products, var:'product')
		render(template:'total', model:[total:session.quote.total])
	}

	def create= {
		session.quote=new Quote()
		[productList:session.quote.products]
	}
	
	def edit={
		session.quote=Quote.get(params.id)
		[productList:session.quote.products]
	}
	
	def print={
		def quote=Quote.get(params.id)
		[quoteInstance:quote]
	}
	
	def printPdf={
		def quote=Quote.get(params.id)
		renderPdf(template: "/quote/print", model: [quoteInstance:quote], filename: "Devis.pdf")
	}
	
	def update={
		def quote=session.quote
		quote.properties=params
		quote.dateCreated=new Date()
		quote.products.each {
			it.price=it.product.priceCaleffiFrance*0.0001*(100 - (it.product.section=="12"?quote.remise1Section12:quote.remise1))*(100 - (it.product.section=="12"?quote.remise2Section12:quote.remise2))
		}
		quote.save(failOnError:true)
		session.quote==null
		flash.defaultMessage="Devis mis &agrave; jour avec ${quote.products.size()} articles"
		flash.message="quote.updated"
		redirect(action:'show', id:quote.id)
	}
	
	def save={
		def quote=session.quote
		quote.properties=params
		quote.dateCreated=new Date()
		println quote
		def affaire=Affaire.get(Long.parseLong(params.affaire.id))
		affaire.addToQuotes(quote)
		quote.save(failOnError:true)
		session.quote=null;
		flash.message="${quote.type} a bien ete cr&eacute;&eacute;"
		flash.defaultMessage=flash.message
		redirect(action:'show', id:quote.id)
	}
	
}
