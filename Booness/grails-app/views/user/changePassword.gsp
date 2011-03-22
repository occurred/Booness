<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main" />
    <title>Change Password</title>
  </head>
  <body>
  <g:form action="changePassword" method="post" >
    <br/>
    mot de passe courant : <g:textField name="oldpassword"/><br/>
    nouveau mot de passe : <g:textField name="password"/><br/>
    encore nouveau mot de passe : <g:textField name="repassword"/><br/>
    <g:submitButton name="create" class="save" value="${message(code: 'update', 'default': 'Update')}" />

  </g:form>
  </body>
</html>
