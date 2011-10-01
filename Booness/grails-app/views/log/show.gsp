<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
<title>
	${logInstance.type} ${logInstance.compte.name}
</title>
<meta content="main" name="layout" />
</head>
<body>
	<div id="header">
		<h3>
			${logInstance.title.capitalize()}
			<span class="small">par
			${logInstance.user.name}</span>
		</h3>
	</div>
	<div id="rightCol">
		<g:render template="/compte/compte"
			model="${[compte:logInstance.compte] }"></g:render>
	</div>
	<div id="leftCol">
		<div id="address" style="padding:20px;">
			<h2>
				${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(logInstance.startDate).capitalize()}
				<%if(!logInstance.allday){%> de ${logInstance.startDate.toString().split(" ")[1].substring(0,5)} a ${logInstance.endDate.toString().split(" ")[1].substring(0,5)}<%}%>
			</h2>
			<div class="objectif">
				<b><u>Objectif</u>
				</b><br />
				${logInstance.objectif?.decodeHTML()}
			</div>
			<br />
			<div class="description">
				<b><u>Compte-Rendu</u>
				</b><br />
				${logInstance.description?.decodeHTML()}
			</div>

			<p>
				Kilometres Parcourus :
				${logInstance.kilometres}
			</p>
			<br /> [<a
				href="${createLink(controller:'compte', action:'slide', id:logInstance.compte.id)}#log${logInstance.id}-slide">Voir
				en Contexte</a>] [<a
				href="${createLink(action:'edit', id:logInstance.id)}">Editer</a>]
		</div>

	</div>

</body>
</html>
