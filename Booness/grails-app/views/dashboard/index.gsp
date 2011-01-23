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
  <h1>Welcome back ${user.name} !</h1>
 
<fullcal:calendar id="cal">
  header: {
    left: 'prev,next today',
    center: 'title',
    right: 'month,agendaWeek,agendaDay'
  },
  columnFormat: { week: 'ddd d/M' },
  timeFormat: 'HH:mm{ - HH:mm}',
  events:${include(controller:"event", action:"json")}
</fullcal:calendar>
</body>
</html>