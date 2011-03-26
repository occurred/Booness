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
  <fullcal:resources theme="smoothness"/>
  <jqui:resources theme="smoothness"/>

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
  <div id="tabs" style="width:100%;height:1000px">
    <ul>
      <li><a href="#tabs-1">Calendrier</a></li>
      <li><a href="#tabs-2">En cours</a></li>
      <li><a href="#tabs-3">Recherche</a></li>
    </ul>
    <div id="tabs-1">
      <fullcal:calendar id="cal">
        theme: true,
        header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
        },
        editable: true,
        columnFormat: { week: 'ddd d/M' },
        timeFormat: 'HH:mm{ - HH:mm}',
        events:${include(controller:"event", action:"json")}
      </fullcal:calendar>
    </div>
    <div id="tabs-2">
      <h1>Bonjour ${user.name}, J'espere que vous allez bien. Avez-vous fait tous vos rapports aujourd'hui</h1>
      <h2><g:message code="compte.affaires"/></h2>
      
<%for(def affaire:user.affaires){
  if(!affaire.archived){%>
              <h3>${affaire.name} [<g:link controller="affaire" action="show" id="${affaire.id}"><g:message code="show"/></g:link>]</h3>
  <%}}%>
           <h2><g:message code="compte.logs"/></h2>
<%for(def log:fr.booness.Log.findAllByUser(user,[max:10, order:'desc', sort:'startDate'])){%>
              <h3>${log.title} [<g:link controller="log" action="show" id="${log.id}"><g:message code="show"/></g:link>]</h3>
              <blockquote>${log.description.length()<128?log.description.replaceAll("<br/>"," "):log.description.substring(0,128).replaceAll("<br/>"," ").replaceAll("<"," ").replaceAll("\\>"," ")}...</blockquote>
<%}%>
            
    </div>

    <div id="tabs-3">

    <g:formRemote url="[action:'search']" method="get" id="searchableForm" name="searchableForm" update="results">
        mots-clefs : <input type="text" name="q" value="" size="50" id="q" />
    </g:formRemote>
      <div id="results">
      </div>
    </div>

  </div>
</body>
</html>