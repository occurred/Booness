<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <div style="float:right">
    <sec:ifLoggedIn>
      <g:set var="num"><sec:loggedInUserInfo field="id"/></g:set>
      <g:link controller="user" action="show" id='${num}'><sec:username/></g:link>|<g:link controller='logout'>Logout</g:link>
    </sec:ifLoggedIn>
    <sec:ifNotLoggedIn>
      <g:link controller='login' action='auth'>Login</g:link>
    </sec:ifNotLoggedIn>
  </div>
<g:layoutBody />
</body>
</html>