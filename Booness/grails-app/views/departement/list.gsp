<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Departements</title>
    </head>
    <body>
    	<g:each in="${departementInstanceList}" var="d">
		    <div id="address" style="width:250px;display: inline-block;">
		    	${d.numero} <g:link action="show" id="${d.id}">${d.name}</g:link>
		    	<%
    			def count=fr.booness.Compte.withCriteria{
			            projections {
			                count('id')
			            }
			            like("zip",d.numero+"%")
			        }[0]
			    %>
    <br/>
    Commercial referent : ${d.user?.name}
    <br/>

    Il y a <a href="${createLink(controller:'compte', action:'list', params:['departementid':d.numero])}">${count} compte(s)</a> dans ce departement
    
		    </div>
    	</g:each>
        <div class="paginateButtons">
            <g:paginate total="${departementInstanceTotal}" params="${params}" />
        </div>
    </body>
</html>

