<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <meta content="main" name="layout"/>
  <fullcal:resources/>

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
  <div id="tabs" style="width:100%;">
    <ul>
      <li><a href="#tabs-1">Calendrier</a></li>
      <li><a href="#tabs-2">Derni&egrave;res Activit&eacute;s</a></li>
    </ul>
    <div id="tabs-1">
      <fullcal:calendar id="cal">
        theme: true,
        header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
        },
        columnFormat: { week: 'ddd d/M' },
        timeFormat: 'HH:mm{ - HH:mm}',
        <sec:ifAllGranted roles="ROLE_ADMIN">
        selectable: true,
  		selectHelper: true,
  		select: function(start, end, allDay) {
  		javascript:window.location="${createLink(controller:'event',action:'create', params:[title:'nouveau meeting'])}&allDay="+allDay+"&startDate_year="+start.getFullYear()+"&startDate_month="+(start.getMonth()+1)+"&startDate_day="+start.getDate()+"&startDate_hour="+start.getHours()+"&startDate_minute="+start.getMinutes()+"&endDate_year="+end.getFullYear()+"&endDate_month="+(end.getMonth()+1)+"&endDate_day="+end.getDate()+"&endDate_hour="+end.getHours()+"&endDate_minute="+end.getMinutes()
  		},
  		</sec:ifAllGranted>
        events:${include(controller:"event", action:"json")}
      </fullcal:calendar>
    </div>
    <div id="tabs-2">
      [<a href="${createLink(controller:'event', action:'ical', params:['token':user.token]).replaceAll("http","webcal")}">Integrer Le calendrier a Outlook</a>]
      <h2><g:message code="compte.affaires"/> non archiv&eacute;es</h2>
      <blockquote style="border-style: solid;border-width: 1px;padding: 1em 1em">
<%for(def affaire:user.affaires){
  if(!affaire.archived){%>
      <h3>${affaire.name} [<g:link controller="affaire" action="show" id="${affaire.id}"><g:message code="show"/></g:link>] / ${affaire.compte.name}</h3>
  <%}
}%>
      </blockquote>

      <h2><g:message code="compte.logs"/> (les 10 derni&egrave;res)</h2>
      <blockquote style="border-style: solid;border-width: 1px;padding: 1em 1em">
<%for(def log:fr.booness.Log.findAllByUser(user,[max:10, order:'desc', sort:'startDate'])){%>
      <h3>${log.title} [<g:link controller="log" action="show" id="${log.id}"><g:message code="show"/></g:link>] /  ${log.compte.name}</h3>
      <blockquote>${log.description.length()<128?log.description.replaceAll("<br/>"," "):log.description.substring(0,128).replaceAll("<br/>"," ").replaceAll("<"," ").replaceAll("\\>"," ")}...</blockquote>
<%}%>
      </blockquote>
    </div>

  </div>
</body>
</html>