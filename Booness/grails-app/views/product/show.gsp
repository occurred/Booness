<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Article ${productInstance.code}
</title>
</head>
<body>
	<div class="body">
		<div id="header">
			${productInstance.code}
			<sec:ifAllGranted roles="ROLE_ADMIN">
				<div id="action">
					<a href="${createLink(action:'edit', id:productInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
				</div>
			</sec:ifAllGranted>
			
		</div>
		<div id="leftCol">
			<div id="address">
				<h2>${productInstance.description}</h2>
				<br />
				Prix Caleffi France ${productInstance.priceCaleffiFrance?productInstance.priceCaleffiFrance+" &euro;":"sur demande"}
				<br/>
				Prix Grossiste ${productInstance.priceGrossiste?productInstance.priceGrossiste+" &euro;":"sur demande"} 
				<br/>
				<sec:ifAllGranted roles="ROLE_ADMIN">
					Prix pour Thermador ${productInstance.priceToThermador?productInstance.priceToThermador+" &euro;":"sur demande"}
				</sec:ifAllGranted>
			</div>
			<br/>
		</div>

		<div id="rightCol">
			<img title="image non disponible" alt="image non disponible" src="${createLink(action:'imageUrl', id:productInstance.id)}" />
		</div>
	</div>
</body>
</html>