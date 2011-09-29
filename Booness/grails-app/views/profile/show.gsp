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
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Year');
        data.addColumn('number', 'Activites');
        <g:each in="${new TreeSet(chart.keySet())}" var="date">data.addRow(['${date}',${chart[date]}]);
        </g:each>
        var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
        chart.draw(data, {hAxis:{showTextEvery:12}, width: 1200, height: 300, title: 'Statistiques'});
      }
    </script>
</head>
<body>

	

<div id="profile" style="font-size: x-large;">
<div id="action">
	<a href="${createLink(controller:'profile', action:'edit', id:userInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
	<a href="${createLink(controller:'event', action:'ical', params:['token':userInstance.token]).replaceAll("http","webcal")}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'calendar.png', plugin: 'famfamfam')}'/></a>
	<a href="${createLink(controller:'compte', action:'list', params:[userid:userInstance.id])}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'application.png', plugin: 'famfamfam')}'/></a>
	<g:if test="${sameUser}"><a href="${createLink(controller:'user',action:'changePassword')}" /><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'key.png', plugin: 'famfamfam')}'/></a></g:if>
	
</div>
	${userInstance.name} <span class="small">${userInstance.username}</span><br />
		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}' />
		<a href="tel:${userInstance.telephone}"> ${userInstance.telephone} </a><br />
		
		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}' />
		<a href="tel:${userInstance.fax}"> ${userInstance.fax} </a><br />
			
		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}' />
		<a href="mailto:${userInstance.email}"> ${userInstance.email} </a><br />
		
	<br />

	<blockquote>
		${userInstance.bio}
	</blockquote>

</div>

<div style="margin:auto;" id="chart_div"></div>

<div style="margin:auto; width:300px;">
<sec:ifNotSwitched>
		<sec:ifAllGranted roles='ROLE_ADMIN'>
			<form action='${request.contextPath}/j_spring_security_switch_user' method='POST'>
				<input type='text' name='j_username' /><br /> <input
					type='submit' value='Echanger Utilisateur' />
			</form>

		</sec:ifAllGranted>
</sec:ifNotSwitched>
	</div>
</body>
</html>
