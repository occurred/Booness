<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="layout" content="main" />

<title>
	${userInstance.name}
</title>
</head>
<body>
	<g:if test="${flash.message}">
		<div class="message">
			<g:message code="${flash.message}" args="${flash.args}"
				default="${flash.defaultMessage}" />
		</div>
	</g:if>

	<g:if test="${flash.error}">
		<div class="errors">
			<g:message code="${flash.error}" args="${flash.args}"
				default="${flash.defaultMessage}" />
		</div>
	</g:if>

	<sec:ifNotSwitched>
		<sec:ifAllGranted roles='ROLE_ADMIN'>
			<form action='${request.contextPath}/j_spring_security_switch_user' method='POST'>
				Echanger d'utilisateur : <input type='text' name='j_username' /><br /> <input
					type='submit' value='Echanger' />
			</form>

		</sec:ifAllGranted>
	</sec:ifNotSwitched>


	<g:message code="user.username" />
	:
	${userInstance.username}<br />
	<g:message code="user.name" />
	:
	${userInstance.name}<br />
	<g:message code="user.email" />
	:
	${userInstance.email}<br /> [
	<a
		href="${createLink(controller:'event', action:'ical', params:['token':userInstance.token]).replaceAll("http","webcal")}">Integrer
		Le calendrier a Outlook</a>]
	<br />

	<g:message code="user.bio" />
	<blockquote>
		${userInstance.bio}
	</blockquote>

	Comptes : [
	<a
		href="${createLink(controller:'compte', action:'list', params:[userid:userInstance.id])}">Voir</a>]
	<h2>
		[<a
			href="${createLink(controller:'profile',action:'edit', id:params.id)}" />
		<g:message code="edit" />
		</a>]
		<g:if test="${sameUser}">[<a
				href="${createLink(controller:'user',action:'changePassword')}" />Changer de mot de passe</a>]</g:if>
	</h2>

</body>
</html>
