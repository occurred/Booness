<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>${affaireInstance.name}</title>
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
  <h1>${affaireInstance.name} / <a href="${createLink(controller:'compte', action:'show', id:affaireInstance.compte.id)}">${affaireInstance.compte}</a> par ${affaireInstance.owner}</h1>
  <p>[<a href="${createLink(controller:"affaire", action:"edit", id:affaireInstance.id)}"/><g:message code="edit"/></a>]</p>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">Description</a></li>
    <li><a href="#tabs-2"><g:message code="affaire.quotes"/></a></li>
  </ul>

  <div id="tabs-1">
${affaireInstance.description}<br/>
  </div>

  <div id="tabs-2">
    <ul>
<%for(def quote in affaireInstance.quotes){%>
      <li><h2><a href="${createLink(controller:"quote",action:"show",id:quote.id)}"/>${quote.title}</a></li>
<%}%>
      <li><h2>[<a href="${createLink(controller:"quote", action:"create", params:["affaire.id":affaireInstance.id, "owner.id":sec.loggedInUserInfo(field:"id")])}"/><g:message code="message.new"/></a>]</h2></li>
      <ul/>
  </div>

</div>
</body>
</html>
