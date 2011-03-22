<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>${userInstance.name}</title>
  </head>
  <body>
    <br/>
    <h2><g:message code="user.username"/> : <sec:loggedInUserInfo field="username"/></h2>
    <h2><g:message code="user.name"/> : ${userInstance.name}</h2>
    <h2><g:message code="user.email"/> : ${userInstance.email}</h2>
    <h2><g:message code="user.bio"/></h2>
    <h3>${userInstance.bio}</h3>
    <h2>[<a href="${createLink(controller:'user',action:'changePassword')}"/>Changer de mot de passe</a>]</h2>

  </body>
</html>
