
<%@ page import="fr.booness.Event" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>${eventInstance.title}</title>
    </head>
    <body>
    <div id="header">
	    ${eventInstance.title} <span class="small">${eventInstance.user}</span>
	    <div id="action">
	    	<a href="${createLink(action:'edit', id:eventInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
	    </div>
    </div>
    <div id="leftCol">
	    <div id="address">
		    <h2>
		    	${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(eventInstance.startDate).capitalize()}
				<%if(!eventInstance.allday){%> de ${eventInstance.startDate.toString().split(" ")[1].substring(0,5)} a ${eventInstance.endDate.toString().split(" ")[1].substring(0,5)}<%}%>
			</h2>
			<g:if test="${eventInstance.restricted}"><p>Cet &eacute;v&eacute;nement est <b>priv&eacute;</b></p></g:if>
			<div class="description">
		      	${eventInstance.description.decodeHTML()}
		    </div>
	    </div>
    </div>
    </body>
</html>
