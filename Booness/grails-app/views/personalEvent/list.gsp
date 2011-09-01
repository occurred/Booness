<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Evenements Personnels</title>
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
	        
	        selectable: true,
	  		selectHelper: true,
	  		select: function(start, end, allDay) {
	  			javascript:window.location="${createLink(controller:'personalEvent',action:'create', params:[title:'...'])}&allDay="+allDay+"&startDate_year="+start.getFullYear()+"&startDate_month="+(start.getMonth()+1)+"&startDate_day="+start.getDate()+"&startDate_hour="+start.getHours()+"&startDate_minute="+start.getMinutes()+"&endDate_year="+end.getFullYear()+"&endDate_month="+(end.getMonth()+1)+"&endDate_day="+end.getDate()+"&endDate_hour="+end.getHours()+"&endDate_minute="+end.getMinutes()
	  		},
	        events:'${createLink(controller:"personalEvent", action:"json")}'
		});
		
	});
 
</script> 
</head>
<body>
	
  <div id='loading' style='position:absolute; top: 8px; left: 200px; display:none'>Chargement...</div> 
  
	
			<div id="calendar">
		        
			</div>
</body>
</html>