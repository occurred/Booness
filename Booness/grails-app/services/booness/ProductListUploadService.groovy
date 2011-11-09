package booness

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.FormulaEvaluator;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import fr.booness.Product;
import fr.booness.ProductLog;

class ProductListUploadService {

	static transactional = false

	FormulaEvaluator evaluator = null;
	private String getValue(Cell cell){
		switch(cell.cellType) {
			case Cell.CELL_TYPE_STRING:
				return cell.richStringCellValue.string
			case Cell.CELL_TYPE_NUMERIC:
				if(DateUtil.isCellDateFormatted(cell)) {
					return cell.dateCellValue
				} else {
					return cell.numericCellValue
				}
			case Cell.CELL_TYPE_BOOLEAN:
				return cell.booleanCellValue
			case Cell.CELL_TYPE_FORMULA:
				return getValue(evaluator.evaluate(cell))
			default:
				return "0"
		}
	}
	
	private String getValue(CellValue cell){
		switch(cell.cellType) {
			case Cell.CELL_TYPE_STRING:
				return cell.stringValue
			case Cell.CELL_TYPE_NUMERIC:
				return cell.numberValue
			case Cell.CELL_TYPE_BOOLEAN:
				return cell.booleanValue
			default:
				return "0"
		}
	}

	def upload(InputStream is, String version) {
		Workbook wb = new XSSFWorkbook(is)
		evaluator=wb.creationHelper.createFormulaEvaluator();
		
		Sheet sheet = wb.getSheetAt(0)
		boolean start=true
		int newP=0
		int updatedP=0
		def codes = []
		ProductLog pl=new ProductLog()
		pl.description="Mise &agrave; jour de la liste des articles<br/><br/>"
		for(Row r:sheet){
			if(start){
				start=false
				continue;
			}
			else{
				def cell= r.getCell(0);
				if(!cell){
					return
				}
				String code = getValue(cell)
				
				if(code && code.size()>0){
					codes << code
					try{
						Product p = Product.findByCode(""+code)
						def price=getValue(r.getCell(3))
						if(price instanceof String && !price.toLowerCase().equals("sur demande"))
							price=price.toFloat()
						else if(price instanceof String){
							price=0
						}
						else if(price==null){
							price=0
						}
						
						def description=""+getValue(r.getCell(2))
						
						def codeThermador=""+getValue(r.getCell(1))
						
						def section=""+getValue(r.getCell(4))
						
						def page=""+getValue(r.getCell(5))
						
						def temp=getValue(r.getCell(6))
						if("sur demande".equals(temp)){
							temp=0
						}
						def prixGrossiste=(""+temp).toFloat()
						
						temp=getValue(r.getCell(7))
						if("sur demande".equals(temp)){
							temp=0
						}
						def prixConfidentiel=(""+temp).toFloat()
						
						
						if(p){
							if(p.priceCaleffiFrance!=price){
								pl.description+="* article ${p.code} prix caleffi france ${p.priceCaleffiFrance} -> ${price}<br/>"
								p.priceCaleffiFrance=price
								updatedP++
							}
							if(p.priceToThermador!=prixConfidentiel){
								pl.description+="* article ${p.code} prix confidentiel ${p.priceToThermador} -> ${prixConfidentiel}<br/>"
								p.priceToThermador=prixConfidentiel
								updatedP++
							}
							if(p.priceGrossiste!=prixGrossiste){
								pl.description+="* article ${p.code} prix grossite ${p.priceGrossiste} -> ${prixGrossiste}<br/>"
								p.priceGrossiste=prixGrossiste
								updatedP++
							}
							p.save(failOnError:true)
						}
						
						else{
							def np=new Product(code:code,
										codeThermador:codeThermador,
										description:description,
										priceGrossiste:prixGrossiste,
										priceToThermador:prixConfidentiel,
										section:section,
										page:page,
										priceCaleffiFrance:price,
										deprecated:false
								).save(failOnError:true)
								
							pl.description+="* creation article r&eacute;f&eacute;rence ${np.code}<br/>"
							newP++
						}
					}
					catch(Exception e){
						println code+" -> error = "+e.message
					}
				}
			}
		}
		def c = Product.createCriteria()
		def deletedProducts=[]
		def results=c.list {
			not{
				'in'("code",codes)
			}
		}.each{
			pl.description+="* article ${it.code} (${it.description}) supprimm&eacute;<br/>"
			deletedProducts << it.code
		}
		
		pl.save()
		
		println deletedProducts
		deletedProducts.each{
			Product.findByCode(it).delete()
			println "deleted "+it
		}
	}
}
