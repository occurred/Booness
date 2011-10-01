package booness

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import fr.booness.Product;

class ProductListUploadService {

	static transactional = false

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
				return cell.cellFormula
			default:
				return null
		}
	}

	def upload(InputStream is) {
		Workbook wb = new XSSFWorkbook(is)
		Sheet sheet = wb.getSheetAt(1)
		boolean start=true
		int newP=0
		int updatedP=0
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
				println code
				if(code && code.size()>0){
					try{
						Product p = Product.findByCode(""+code)

						if(!p){
							print "new "
							
							def price=getValue(r.getCell(3))
							if(price instanceof String || price==null) price=0
							
							def description=""+getValue(r.getCell(2))
							
							def codeThermador=""+getValue(r.getCell(1))
							
							def section=""+getValue(r.getCell(4))
							
							def page=""+getValue(r.getCell(5))
							
							new Product(code:code,
										codeThermador:codeThermador,
										description:description,
										priceGrossiste:0f,
										section:section,
										page:page,
										priceCaleffiFrance:price
								).save(failOnError:true)
							newP++
						}
						else{
							def price=Float.parseFloat(""+getValue(r.getCell(3)))
							if(p.priceCaleffiFrance!=price){
								p.priceCaleffiFrance=price
								p.save(failOnError:true)
								updatedP++
							}
						}
					}
					catch(Exception e){
						e.printStackTrace()
					}
				}
			}
		}
	}
}
