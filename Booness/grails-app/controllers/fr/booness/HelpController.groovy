package fr.booness

import grails.converters.JSON;

class HelpController {
	
	static navigation = [
		title: 'Support',
		group: 'admin',
		order: 1500
	]

    def index = { 
		def closedIssues=JSON.parse(new URL("https://api.github.com/repos/fix/Booness/issues?state=closed").text)
		def openIssues=JSON.parse(new URL("https://api.github.com/repos/fix/Booness/issues?state=open").text)
		return [openIssues:openIssues,closedIssues:closedIssues]	
	}
	
	
}


