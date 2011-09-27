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
			<input type="file" name="file" />
			<input type="submit" />
		</g:form>
	</div>
</body>
</html>