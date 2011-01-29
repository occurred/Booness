package booness

class GeocoderService {

    static transactional = false

    def getCities(String zip, String country) {
      def base = "http://api.geonames.org/postalCodeSearch?username=test&"
      def qs = []
      qs << "postalcode=" + zip
      qs << "country=" + country
      def url = new URL(base + qs.join("&"))
      def connection = url.openConnection()
      def results=[]
      if(connection.responseCode == 200){
        def xml = connection.content.text
        def geonames = new XmlSlurper().parseText(xml)
        geonames.code.each{ code->
            results << code.name.toString()
        }
        //println results
      }

      else{
        log.error("GeocoderService.getCities FAILED")
        log.error(url)
        log.error(connection.responseCode)
        log.error(connection.responseMessage)
      }
      return results
    }

}
