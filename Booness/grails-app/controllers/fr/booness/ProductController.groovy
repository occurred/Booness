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

	def uploadNew={
	}

	def upload = {
		def file = request.getFile('file')
		productListUploadService.upload(file.inputStream)
		redirect(action:'list')
	}
}
