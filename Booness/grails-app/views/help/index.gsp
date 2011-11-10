<%@ page contentType="text/html;charset=UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>
			Aide
		</title>
	</head>
	<body>
	
	<h1>
		Tickets en cours
	</h1>
	<div id="address" style="display: inline-block;">
	<a target="_blank" href="https://github.com/fix/Booness/issues/new"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}'/>Nouveau Ticket</a>
	</div>
	
	<g:each in="${openIssues}" var="issue">
	<div id="address">
		<img id="famfamfam" src="${issue.user.avatar_url}"/>
		<b><a target="_blank" href="${issue.html_url}">${issue.title}</a></b>
		<br/>
		${issue.body}
		<br/>
		${issue.comments} commentaires
	</div>
	</g:each>
	
	<h1>
		Tickets ferm&eacute;s
	</h1>
	<g:each in="${closedIssues}" var="issue">
	<div id="address">
		<img id="famfamfam" src="${issue.user.avatar_url}"/>
		<b><a target="_blank" href="${issue.html_url}">${issue.title}</a></b>
		<br/>
		${issue.body}
		<br/>
		${issue.comments} commentaires
	</div>
	</g:each>
	
	</body>
</html>