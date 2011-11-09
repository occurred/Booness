<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title>Televerser une nouvelle version du catalogue</title>
</head>
<body>
	<div class="body">
		<g:form action="upload" method="post" enctype="multipart/form-data">
			<input type="file" name="file"  value="Choisir un Fichier"/>
			<input type="submit" value="Envoyer"/>
		</g:form>
		
		Derni&egrave;res versions<br>
		
		<g:each in="${fr.booness.ProductLog.list(order:'desc', sort:'dateCreated', max:10)}" var="log">
		<div id="address">
			${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(log.dateCreated).capitalize()}
				<br/>
			${log.description}
		</div>
				
		
		</g:each>
	</div>
	
	
</body>
</html>