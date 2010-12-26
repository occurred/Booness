<html>
  <head>
    <title><g:layoutTitle default="Grails" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
    <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:layoutHead />
  <g:javascript library="application" />
  <nav:resources override="true"/>
</head>
<body>

  <div id="spinner" class="spinner" style="display:none;">
    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
  </div>
  <table>
    <tr><td></td><td><h1 id="pageBody">BOONESS</h1></td></tr>
      <td width="200px;">
        <div class="homePagePanel">
          <div class="panelTop"></div>
          <div class="panelBody">
            <ul class="navigation" id="navigation_all"><li class="navigation_first"><a href="${createLink(uri: '/')}">Home</a></li></ul>
            <nav:render group="public"/>
            <sec:ifAllGranted roles="ROLE_USER"><nav:render group="user"/></sec:ifAllGranted>
            <sec:ifAllGranted roles="ROLE_ADMIN"><nav:render group="admin"/></sec:ifAllGranted>
            <ul class="navigation" id="navigation_all">
              <sec:ifNotLoggedIn>
                <li class="navigation_first">
                <g:link controller='login' action='auth'>Login</g:link>
                </li>
              </sec:ifNotLoggedIn>

              <sec:ifLoggedIn>
                <li class="navigation_first">
                <g:link controller='logout'>Logout</g:link>
                </li>
              </sec:ifLoggedIn>
            </ul>
          </div>
          <div class="panelBtm"></div>
        </div>
      </td>
      <td>
        <div id="nav">
        </div>

    <g:layoutBody />
  </td>
</tr>
</table>
</body>
</html>