package fr.booness

import java.sql.RowId;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import booness.ProductListUploadService

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_USER'])
class ProductController {

	def scaffold=true

	def productListUploadService

	static navigation = [
		title: 'Products',
		group: 'user',
		order: 60
	]

	def index={ redirect(action:list) }

	@Secured(['ROLE_ADMIN'])
	def uploadNew={
	}

	
	@Secured(['ROLE_ADMIN'])
	def upload = {
		def file = request.getFile('file')
		productListUploadService.upload(file.inputStream)
		redirect(action:'list')
	}
	
	@Secured(['ROLE_ADMIN'])
	def edit = {
		[productInstance:Product.get(params.id)]
	}
	
	def show = {
		def product=Product.get(params.id)
		[productInstance:product]	
	}
	
	def imageUrl={
		response.outputStream << getImageUrl(Product.get(params.id).code).toURL().getBytes()
	}
	
	private getImageUrl(String code){
		def urlImage="http://www.caleffi.fr/Resources/cale_immagini/"
		if(code.startsWith("0")){
			return "http://www.caleffi.fr/Resources/cale_immagini/CARTUCCE_th.jpg"
		}
		try{
			(urlImage+code.split(" ")[0]+"_th.jpg").toURL().getBytes()
			urlImage+=code.split(" ")[0]+"_th.jpg"
			println urlImage
		}
		catch(Exception e){
			try{
				(urlImage+code[0..-1]+"_th.jpg").toURL().getBytes()
				urlImage+=code[0..-1]+"_th.jpg"
				println urlImage
			}
			catch(Exception e2){
				try{
					(urlImage+code[0..2]+"AUT_th.jpg").toURL().getBytes()
					urlImage+=code[0..2]+"AUT_th.jpg"
					println urlImage
				}
				catch(Exception e3){
					try{
						(urlImage+code[0..3]+"_th.jpg").toURL().getBytes()
						urlImage+=code[0..3]+"_th.jpg"
						println urlImage
					}
					catch(Exception e4){
						try{
							(urlImage+code[0..3]+"fil_th.jpg").toURL().getBytes()
							urlImage+=code[0..3]+"fil_th.jpg"
							println urlImage
						}
						catch(Exception e5){
							try{
								(urlImage+code[0..2]+"_th.jpg").toURL().getBytes()
								urlImage+=code[0..2]+"_th.jpg"
								println urlImage
							}
							catch(Exception e6){
								
							}
						}
					}
				}
			}
		}
		
		urlImage
		
	}
}
