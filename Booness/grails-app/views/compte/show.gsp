<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>${compteInstance.name}</title>
    <meta content="main" name="layout"/>
  </head>
  <body>
    <h1>${compteInstance.name}</h1>
    <p>${compteInstance.description}</p>
    <p><g:message code="compte.logs"/> [<a href="${createLink(controller:"log", action:"create")}"/><g:message code="message.new"/></a>]</p>
<ul>

<%for(def log in compteInstance.logs){%>
  <li><h2><a href="${createLink(controller:"log",action:"show",id:log.id)}"/>${log.title}</a></h2> <p>${log.description}</p></li>
<%}%>
  <ul/>
</body>
</html>
