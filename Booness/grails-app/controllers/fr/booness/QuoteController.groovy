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
		def total=0
		quote.products.each{
			total+=it.quantity*it.price
		}
		[quoteInstance:quote, total:total]
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
		def total=0
		if(params.product.size()>0){
			session.quote.products.each{
				if(it.product.code==code){
					it.quantity+=Integer.parseInt(params.quantity)
					updated=true
				}
				total+=it.quantity*it.price
			}
			if(!updated){
				ProductInsert pi=new ProductInsert()
				pi.product=Product.findByCode(code)
				pi.quantity=Integer.parseInt(params.quantity)
				pi.price=pi.product.priceCaleffiFrance
				total+=pi.quantity*pi.price
				session.quote.addToProducts(pi)
			}
		}
		else{
			session.quote.products.each{
				total+=it.quantity*it.price
			}
		}
		render(template:'productList', collection:session.quote.products, var:'product')
		render(template:'total', model:[total:total])
	}

	def removeProduct = {
		println params.code
		def total=0
		if(params.code){
			def toremove
			session.quote.products.each{
				if(it.product.code==params.code){
					toremove=it
				}
				else{
					total+=it.quantity*it.price
				}
				
			}
			if(toremove){
				println toremove
				session.quote.removeFromProducts(toremove)
			}
		}
		render(template:'productList', collection:session.quote.products, var:'product')
		render(template:'total', model:[total:total])
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
		def total=0
		quote.products.each{
			total+=it.quantity*it.price
		}
		[quoteInstance:quote, total:total]
	} 
	
	def update={
		println params
		def quote=session.quote
		quote.dateCreated=new Date()
		quote.contact=Contact.get(params.'contact.id')
		quote.save()
		session.quote==null
		redirect(action:'show', id:quote.id)
	}
	
	def save={
		def quote=session.quote
		quote.title=params.title
		quote.contact=Contact.get(params.'contact.id')
		println quote
		def affaire=Affaire.get(Long.parseLong(params.affaire.id))
		affaire.addToQuotes(quote)
		quote.save(failOnError:true)
		session.quote=null;
		redirect(action:'show', id:quote.id)
	}
	
}
