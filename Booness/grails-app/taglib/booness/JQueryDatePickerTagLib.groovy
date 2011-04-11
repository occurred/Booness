package booness

class JQueryDatePickerTagLib {
	
	def jqDatePicker = {attrs, body ->
		def name=attrs.name
		def value=attrs.value
		def id= attrs.id?:name
		
		out.println "<input style=\"width=100px;\" type=\"text\" name=\"${name}\" id=\"${id}\" value=\"${attrs.value?.format('MM/dd/yyyy')}\" />"
		out.println "<input type=\"hidden\" name=\"${name}_day\" id=\"${id}_day\" />"
		out.println "<input type=\"hidden\" name=\"${name}_month\" id=\"${id}_month\" />"
		out.println "<input type=\"hidden\" name=\"${name}_year\" id=\"${id}_year\" />"
		out.println "<select style=\"width=30px;\" type=\"select\" name=\"${name}_hour\" id=\"${id}_hour\">"
		[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23].each {
			out.println "<option value=\"${it}\"${value?.getHours()==it?' selected':''}>${it<10?'0':''}${it}</option>"
		}
		out.println "</select>:"
		
		out.println "<select style=\"width=30px;\" class=\"time\" type=\"select\" name=\"${name}_minute\" id=\"${id}_minute\"/>"
		[0,15,30,45].each {
			out.println "<option value=\"${it}\"${it==value?.getMinutes()?' selected':''}>${it<10?'0':''}${it}</option>"
		}
		out.println "</select>"
		
		out.println '''
		<script type="text/javascript">
		\$(document).ready(function(){
		   \$("#'''+name+'''").datepicker({
		   	  onClose: function(dateText, inst) {
                 \$("#'''+name+'''_month").attr("value",new Date(dateText).getMonth() +1);
                 \$("#'''+name+'''_day").attr("value",new Date(dateText).getDate());
                 \$("#'''+name+'''_year").attr("value",new Date(dateText).getFullYear());
              }
		   });
		})
		</script>
		'''
		
	}
	

}
