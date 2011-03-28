<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Impression Compte</title>
  </head>
  <body>
    <h1 style="text-decoration: underline;text-align: center">${compteInstance.name}</h1>
    <blockquote style="text-align: justify;border-style: solid;border-width: 1px;padding: 1em 1em">
    <h3>Telephone : ${compteInstance.phone}</h3>
    <h3>Courriel : ${compteInstance.email}</h3>
    <div style="text-align: justify;">${compteInstance.description}</div>
    <h3>Adresse</h3>
    ${compteInstance.street}
    <%if(compteInstance.extra){%><br/>
      ${compteInstance.extra}
    <%}%><br/>
    ${compteInstance.zip} ${compteInstance.city}
    </blockquote>
    <h2>Affaires</h2>
  <g:each in="${compteInstance.affaires}">
    ${it.name}<br/>
  </g:each>
    <h2>Compte-Rendus</h2>
    <g:each in="${compteInstance.logs}">
      <h3>${it.title} par ${it.user.name} <small>(${it.startDate.toString().split(" ")[0]}<%if(!it.allday){%> de ${it.startDate.toString().split(" ")[1].substring(0,5)} a ${it.endDate.toString().split(" ")[1].substring(0,5)}<%}%>)</small></h3>
      <blockquote style="text-align: justify;border-style: solid;border-width: 1px;padding: 1em 1em">${it.description}</blockquote>
  </g:each>
    <h2>Contacts</h2>
    <g:each in="${compteInstance.contacts}">
      <h3>${it.name}</h3>
      <blockquote style="border-style: solid;border-width: 1px;padding: 1em 1em">
${it.email?"<b>Email</b> : "+it.email+"<br/>":""}
${it.telephone?"<b>Tel</b> : "+it.telephone+"<br/>":""}
${it.city?"<b>Adresse</b> :<br/><blockquote>"+(it.street?it.street+"<br/>":"")+(it.extra?it.extra+"<br/>":"")+it.zip+" "+it.city+"<br/></blockquote>":""}
      </blockquote>
    </g:each>

  </body>
</html>
