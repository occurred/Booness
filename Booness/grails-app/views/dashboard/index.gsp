<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tableau de Bord</title>
<meta content="main" name="layout" />
<fullcal:resources/>
<script type='text/javascript'> 
 
	$(document).ready(function() {
	
		$('#calendar').fullCalendar({
			theme: true,
	        firstDay:1,
	        monthNames:['Janvier', 'F&eacute;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&ucirc;t', 'Septembre', 'Octobre', 'Novembre', 'Decembre'],
	        dayNamesShort:['Dim', 'Lun','Mar','Mer','Jeu','Ven','Sam'],
	        dayNames:['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
	       	buttonText: {
			    today:    'aujourd\'hui',
			    month:    'mois',
			    week:     'semaine',
			    day:      'jour'
			},
			allDayText:'journ&eacute;e',
			axisFormat:'H:mm',
	        header: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'month,agendaWeek,agendaDay'
	        },
	        columnFormat: { week: 'ddd d/M' },
	        timeFormat: 'HH:mm{ - HH:mm}',
	        loading: function(bool) {
				if (bool) $('#loading').show();
				else {
				$('#loading').hide();
				$('#calendar').fullCalendar( 'rerenderEvents' );
				}
			},
	        <sec:ifAllGranted roles="ROLE_ADMIN">
	        selectable: true,
	  		selectHelper: true,
	  		select: function(start, end, allDay) {
	  			javascript:window.location="${createLink(controller:'event',action:'create', params:[title:'Nouveau Meeting'])}&allDay="+allDay+"&startDate_year="+start.getFullYear()+"&startDate_month="+(start.getMonth()+1)+"&startDate_day="+start.getDate()+"&startDate_hour="+start.getHours()+"&startDate_minute="+start.getMinutes()+"&endDate_year="+end.getFullYear()+"&endDate_month="+(end.getMonth()+1)+"&endDate_day="+end.getDate()+"&endDate_hour="+end.getHours()+"&endDate_minute="+end.getMinutes()
	  		},
	  		</sec:ifAllGranted>
	        events:'${createLink(controller:"event", action:"json")}'
		});
		
	});
 
</script> 
</head>
<body>
	<script type="text/javascript">
        $(function() {
                $( "#tabs" ).tabs({
                        fillSpace: true,
                        navigation: true
                });
        });
  </script>
  <div id='loading' style='position:absolute; top: 8px; left: 200px; display:none'>Chargement...</div> 
  
	<div id="tabs" style="width: 100%;">
		<ul>
			<li><a href="#tabs-1">Calendrier</a></li>
			<li><a href="#tabs-2">Derni&egrave;res Activit&eacute;s</a></li>
		</ul>
		<div id="tabs-1">
			<div id="calendar">
		        
			</div>
		</div>
		<div id="tabs-2">
			[<a href="${createLink(action:'slide')}">Slides</a>]
			<h2>
				<g:message code="compte.affaires" />
				non archiv&eacute;es
			</h2>
			<blockquote
				style="border-style: solid; border-width: 1px; padding: 1em 1em">
				<%for(def affaire:user.affaires){if(!affaire.archived){%>
      <h3>${affaire.name} [<g:link controller="affaire" action="show" id="${affaire.id}"><g:message code="show"/></g:link>] / ${affaire.compte.name}</h3>
  				<%}}%>

			</blockquote>
		</div>

	</div>
</body>
</html>