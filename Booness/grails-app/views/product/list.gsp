
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <title>Articles</title>
    </head>
    <body>
    	
        
        <div class="body">
        <div id="navigation">
        	<sec:ifAllGranted roles="ROLE_ADMIN">
				<div id="address" style="display: inline-block;"><a href="${createLink(controller:'product', action:'create')}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}'/>Nouvel Article</a></div>
				<div id="address" style="display: inline-block;"><a href="${createLink(controller:'product', action:'uploadNew')}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'page_excel.png', plugin: 'famfamfam')}'/>Televerser une nouvelle liste</a></div>
			</sec:ifAllGranted>
			<div id="action">
				Trier par 
				<div id="address" style="display: inline-block;"><g:sortableColumn property="priceCaleffiFrance" title="Prix" titleKey="product.priceCaleffiFrance" /><g:if test="${params.sort=='priceCaleffiFrance'}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'arrow_'+(params.order=='asc'?'up':'down')+'.png', plugin: 'famfamfam')}'/></g:if></div>
        		<div id="address" style="display: inline-block;"><g:sortableColumn property="code" title="Code" titleKey="product.code" /><g:if test="${params.sort=='code'}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'arrow_'+(params.order=='asc'?'up':'down')+'.png', plugin: 'famfamfam')}'/></g:if></div>
        	</div>
        </div>
        
        <g:each in="${productInstanceList}" var="product">
        <div id="address">
	        <g:link action="show" id="${product.id}">${product.code}</g:link> ${product.description}
	        <br/>
	        ${product.priceCaleffiFrance?product.priceCaleffiFrance+" &euro;":"sur demande"} 
        </div>
        
        
        </g:each>
        <div class="paginateButtons">
                <g:paginate total="${productInstanceTotal}" params="${params}" />
            </div>
        </div>
    </body>
</html>

