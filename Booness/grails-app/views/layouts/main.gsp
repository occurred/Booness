<html lang="fr">
<head>
<title><g:layoutTitle default="Grails" /></title>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<g:layoutHead />
<g:javascript library="application" />
<nav:resources override="true" />
</head>
<body>

	<div id="spinner" class="spinner" style="display: none;">
		<img src="${resource(dir:'images',file:'spinner.gif')}"
			alt="${message(code:'spinner.alt',default:'Loading...')}" />
	</div>
	<table>
		<tr>
			<td><sec:ifLoggedIn>
					<a href="${createLink(controller:'profile',action:'index')}"><sec:loggedInUserInfo
							field="username" /> </a> | <g:link controller='logout'>sortie</g:link>
					<sec:ifSwitched>
						<style>
.homePagePanel .panelBody {
	background-color: #eb8b85;
}
						</style>
						<br />
						<a href='${request.contextPath}/j_spring_security_exit_user'>
							Revenir &agrave; <sec:switchedUserOriginalUsername /> </a>
					</sec:ifSwitched>
				</sec:ifLoggedIn>
			</td>
			<td><sec:ifLoggedIn>
					<div style="text-align: right">
						<g:form url="[controller:'dashboard',action:'search']"
							method="get" id="searchableForm" name="searchableForm" update="">
							<input style="width: 200px; bottom: 0" type="text" name="q"
								value="${params.q}" size="50" id="q"
								x-webkit-speech="x-webkit-speech" speech="speech" />
						</g:form>
					</div>
				</sec:ifLoggedIn></td>
		</tr>
		<tr>
			<td class="rounded-corners" width="150px;">
				<div class="homePagePanel">
					<div class="panelBody">
						<ul class="navigation" id="navigation_all">
							<li class="navigation_first"><sec:ifLoggedIn>
									<a href="${createLink(uri: '/dashboard?lang=fr')}"><g:message
											code="navigation.user.dashboard" /> </a>
								</sec:ifLoggedIn>
							</li>
						</ul>
						<nav:render group="public" />
						<sec:ifAllGranted roles="ROLE_USER">
							<nav:render group="user" />
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<nav:render group="admin" />
						</sec:ifAllGranted>
						<ul class="navigation" id="navigation_all">
							<sec:ifNotLoggedIn>
								<li class="navigation_first"><g:link controller='login'
										action='auth'>Login</g:link>
								</li>
							</sec:ifNotLoggedIn>

						</ul>
					</div>
				</div>
			</td>
			<td class="rounded-corners"><g:layoutBody />
			</td>
		</tr>
	</table>
</body>
</html>