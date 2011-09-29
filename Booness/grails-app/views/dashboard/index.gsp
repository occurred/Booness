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
<fullcal:resources themeCss="/Booness/css/jquery-ui/themes/custom-theme/jquery-ui-1.8.16.custom.css"/>
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
  <div id="loading" class="spinner" style="z-index: 1000;position:absolute; width:100%; height:100%;zoom:2; top: 0px; left: 0px; display:none">
			<img style="position:fixed; top:5px; left:140px;" src="${resource(dir:'images',file:'spinner.gif')}"
				alt="${message(code:'spinner.alt',default:'Loading...')}" />
		</div>
	
			<div id="calendar">
		        
			</div>
		

</body>
</html>