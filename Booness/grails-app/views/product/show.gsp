<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>${productInstance.code}</title>
</head>
<body>
  <div class="body">
  <div id="header">${productInstance.code}</div>
  <div id="leftCol">
  ${productInstance.description }
  <br/>
  <img src="${createLink(action:'imageUrl', id:productInstance.id)}"/>
  </div>
  
  </div>
</body>
</html>