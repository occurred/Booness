<html lang="fr">
<head>
<title><g:layoutTitle default="Booness" />
</title>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:layoutHead />
<g:javascript library="application" />
<nav:resources override="true" />
</head>
<body>
	<g:if test="${flash.message}">
  
 <div class="message" style="position:fixed; top:20px; left:500px;"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
	<div id="wrapper">
		<table>
			<tbody>
				<tr>
					<td><sec:ifLoggedIn>
							<a href="${createLink(controller:'profile',action:'index')}"><sec:loggedInUserInfo
									field="username" /> </a> | <g:link controller='logout'>sortie</g:link>
							<sec:ifSwitched>
								<style>
								body {
									background-color: #ffaaaa;
								}
								</style>
								<br />
								<a href='${request.contextPath}/j_spring_security_exit_user'>
									Revenir &agrave; <sec:switchedUserOriginalUsername /> </a>
							</sec:ifSwitched>
						</sec:ifLoggedIn>
						</td>
					<td>
						<sec:ifLoggedIn>
								<div style="text-align: right">
									<g:form url="[controller:'dashboard',action:'search']"
										method="get" id="searchableForm" name="searchableForm" update="">
										<input style="width: 200px; bottom: 0" type="text" name="q"
											value="${params.q}" size="50" id="q"
											x-webkit-speech="x-webkit-speech" speech="speech" />
									</g:form>
								</div>
							</sec:ifLoggedIn>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="menu">
			<ul class="navigation" id="navigation_all">
				<li class="navigation_first">
					<sec:ifLoggedIn>
						<a href="${createLink(uri: '/dashboard?lang=fr')}">
							<g:message code="navigation.user.dashboard" />
						</a>
					</sec:ifLoggedIn>
				</li>
			</ul>
			<sec:ifAllGranted roles="ROLE_USER">
				<nav:render group="user" />
			</sec:ifAllGranted>
		</div>

		<sec:ifAllGranted roles="ROLE_ADMIN">
			<div id="menuLeft">
				<nav:render group="admin" />
			</div>
		</sec:ifAllGranted>
			
			
			<br/>
		
			<g:layoutBody />

		<div id="footer">
			Une Production de Francois-Xavier Thoorens<br />
		</div>

	</div>
</body>
</html>