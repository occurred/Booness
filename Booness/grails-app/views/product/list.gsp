<%@ page import="fr.booness.Compte" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title><g:message code="compte.list" default="Compte List" /></title>
    </head>
    <body>
    	
        
        <div class="body">
        <div id="navigation">
        	<div id="address" style="display: inline-block;"><a href="${createLink(controller:'compte', action:'create')}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}'/> Nouveau Compte</a></div>
			<div id="action">
				Trier par 
				<div id="address" style="display: inline-block;"><g:sortableColumn property="name" title="Name" titleKey="compte.name" /><g:if test="${params.sort=='name'}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'arrow_'+(params.order=='asc'?'up':'down')+'.png', plugin: 'famfamfam')}'/></g:if></div>
        		<div id="address" style="display: inline-block;"><g:sortableColumn property="zip" title="Zip" titleKey="compte.zip" /><g:if test="${params.sort=='zip'}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'arrow_'+(params.order=='asc'?'up':'down')+'.png', plugin: 'famfamfam')}'/></g:if></div>
        	</div>
        </div>
        
        <g:render template="comptecard" collection="${compteInstanceList}" var="compte"/>
        
        <div class="paginateButtons">
            <%def aaa=params.clone()
				aaa.remove("alphabet")%>
            	<a href="${createLink(action:'list', params:aaa)}">Tous</a>
            	<%for(def c:'A'..'Z'){
				def temp=params.clone()
				temp.put("alphabet",c)%>
					<g:if test="${params.alphabet==c}">
						<span class="currentStep">${c}</span>
					</g:if>
					<g:else>
					
						<a href="${createLink(action:'list', params:temp)}">${c}</a>
					</g:else>
				<%}%>
				<br/><br/>
                <g:paginate total="${compteInstanceTotal}" params="${params}" />
            </div>
        </div>
    </body>
</html>

