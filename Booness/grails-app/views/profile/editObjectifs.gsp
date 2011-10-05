<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta name="layout" content="main"/>
<title>Objectifs</title>
<g:javascript library="prototype" />
</head>
<body>
  <div class="login">
		<g:formRemote name="addObjectifForm" url="[action:'addObjectif']" update="objectifList">
	  			<label>Ajouter un Objectif</label>
	  			<br/><br/>
	  			Annee <g:textField style="width:100px;" name="year" value="${new Date().year+1900}"/>
	  			CA <g:textField style="width:100px;" name="ca" value="0"/>
	  			Visites <g:textField style="width:100px;" name="visites" value="0"/>
	  			Affaires <g:textField style="width:100px;" name="affaires" value="0"/>
	  			<g:hiddenField name="userid" value="${userInstance.id}"/>
				<button style="padding: 10px;"  title="Ajouter" name="ajouter">Ajouter</button>
			</g:formRemote>
		</div>

		<br/>
		<div id="objectifList">
			<g:render template="objectifList" collection="${userInstance.objectifs}" var="objectif"></g:render>
		</div>
		
		<br/>
		<div class="menu">
            <span class="menubutton"><g:link action="show" id="${userInstance.id}">Retour</g:link></span>
        </div>
</body>
</html>