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
  </head>
  <body>
    <h1>Welcome back ${user.name} !</h1>
    <table>
      <thead>
        <tr>
          <th>
            Current Affairs
          </th>
          <th>
            Last Logs
          </th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td width="30%">
<%for(def affaire:user.affaires){
  if(!affaire.archived){%>
            <h2>${affaire.name} [<g:link controller="affaire" action="show" id="${affaire.id}">show</g:link>]</h2>
<%}}%>
          </td>
          <td width="70%">
<%for(def log:fr.booness.Log.findAllByUser(user,[max:10, sort:'lastUpdated', order:'desc'])){%>
            <h3>${log.title} [<g:link controller="log" action="show" id="${log.id}">show</g:link>]</h3>
            <blockquote>${log.content}</blockquote>
<%}%>
          </td>
        </tr>
      </tbody>
    </table>
  </body>
</html>