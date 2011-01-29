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
  <jqui:resources/>

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
  <div id="tabs" style="width:800px;height:800px">
    <ul>
      <li><a href="#tabs-1">Calendrier</a></li>
      <li><a href="#tabs-2">Activites</a></li>
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
      <h1>${user.name}</h1>
      <h2><g:message code="compte.affaires"/></h2>
      
<%for(def affaire:user.affaires){
  if(!affaire.archived){%>
              <h3>${affaire.name} [<g:link controller="affaire" action="show" id="${affaire.id}"><g:message code="show"/></g:link>]</h3>
  <%}}%>
           <h2><g:message code="compte.logs"/></h2>
<%for(def log:fr.booness.Log.findAllByUser(user,[max:10, order:'desc'])){%>
              <h3>${log.title} [<g:link controller="log" action="show" id="${log.id}"><g:message code="show"/></g:link>]</h3>
              <blockquote>${log.description}</blockquote>
<%}%>
            
    </div>

  </div>
</body>
</html>