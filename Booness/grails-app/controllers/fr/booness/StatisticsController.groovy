package fr.booness

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class StatisticsController {

	static navigation = [
		title: 'Statistiques',
		group: 'admin',
		order: 1005
	]

	def index = {
		def stats=[:]
		Parameters.findByName("Statistiques Utilisateurs").value.split(",").each{
			def principal=User.findByUsername(it)
			def chart=[:]
			if(!params.start){
				params.start="2008"
			}
			if(!params.end){
				params.end=new Date().format("yyyy")
			}
			(params.start.toInteger()..params.end.toInteger()).each{ year->
				println year
				(1..9).each{month->
					chart[year+"/0"+month]=0
				}
				chart[year+"/10"]=0
				chart[year+"/11"]=0
				chart[year+"/12"]=0
			}
			principal.logs.each{
				if(it.type.toString()==params.logType && it.startDate.year+1901>params.start.toInteger() && it.startDate.year+1899<params.end.toInteger() ){
					def date=it.startDate.format("yyyy/MM")
					if(chart[date]) {
						chart[date]+=1
					}
					else{
						chart[date]=1
					}
				}
			}

			stats[principal.name]=chart
		}

		[stats:stats, logType:params.logType]
	}
}
