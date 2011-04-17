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
  <g:if test="${flash.message}">
    <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
  </g:if>

  <g:if test="${flash.error}"><div class="errors">
      <g:message code="${flash.error}" args="${flash.args}" default="${flash.defaultMessage}" />
    </div>
  </g:if>
  <g:message code="user.username"/> : ${userInstance.username}<br/>
  <g:message code="user.name"/> : ${userInstance.name}<br/>
  <g:message code="user.email"/> : ${userInstance.email}<br/>
  <g:message code="user.bio"/>
  <blockquote>${userInstance.bio}</blockquote>
  <h2>[<a href="${createLink(controller:'profile',action:'edit', id:params.id)}"/><g:message code="edit"/></a>]<g:if test="${sameUser}">[<a href="${createLink(controller:'user',action:'changePassword')}"/>Changer de mot de passe</a>]</g:if></h2>
</body>
</html>
