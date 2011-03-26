<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <title>${compteInstance.name}</title>
    <script type="text/javascript" src="http://www.websnapr.com/js/websnapr.js"></script>
    <meta content="main" name="layout"/>
  <fullcal:resources theme="smoothness"/>
  <jqui:resources theme="smoothness"/>

</head>
<body>
  <script type="text/javascript">
        $(function() {
                $( "#accordion" ).accordion({
                  collapsible:true,
                  active:false,
                  autoHeight:false
                });
        });

      $(function() {
              $( "#tabs" ).tabs({
                      fillSpace: true,
                      navigation: true
              });
      });
  </script>
  <h1>${compteInstance.name}</h1>
  <p>[<a href="${createLink(controller:"compte", action:"edit", id:compteInstance.id)}"/><g:message code="edit"/></a>][<a href="${createLink(controller:"compte", action:"print", id:compteInstance.id)}"/><g:message code="print"/></a>]</p>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">General</a></li>
    <li><a href="#tabs-2"><g:message code="compte.affaires"/></a></li>
    <li><a href="#tabs-3"><g:message code="compte.logs"/></a></li>
    <li><a href="#tabs-4"><g:message code="compte.contacts"/></a></li>
    <li><a href="#tabs-5"><g:message code="compte.address"/></a></li>
  </ul>

  <div id="tabs-1">
${compteInstance.description}<br/>
    <g:message code="compte.type"/> : ${compteInstance.type}<br/>
<%if(compteInstance.phone){%><g:message code="compte.phone"/> : <a href="skype:${compteInstance.phone}?call">${compteInstance.phone}</a><br/><%}%>
  <%if(compteInstance.email){%><g:message code="compte.email"/> : <a href="mailto:${compteInstance.email}">${compteInstance.email}</a><br/><%}%>
    <%if(compteInstance.website){%><g:message code="compte.website"/> : <script type="text/javascript">wsr_snapshot('${compteInstance.website}', 'C2T4XSE7A1b0', 's');</script><%}%>
  </div>

  <div id="tabs-2">
      <ul>

      <%for(def affaire in compteInstance.affaires){%>
        <li><h2><a href="${createLink(controller:"affaire",action:"show",id:affaire.id)}"/>${affaire.name}</a></h2> <p>${affaire.description}</h2></li>
      <%}%>
        <li><h2>[<a href="${createLink(controller:"affaire", action:"create", params:["compte.id":compteInstance.id, "owner.id":sec.loggedInUserInfo(field:"id")])}"/><g:message code="message.new"/></a>]</h2></li>

  </div>
  <div id="tabs-3">
    <div id="accordion">

      <%for(def log in compteInstance.logs){%>
       
      <h3><a href="#"/>${log.title} par ${log.user.name} <small>(${log.startDate.toString().split(" ")[0]}<%if(!log.allday){%> de ${log.startDate.toString().split(" ")[1].substring(0,5)} a ${log.endDate.toString().split(" ")[1].substring(0,5)}<%}%>)</small></a></h3>
      <div>
        [<a href="${createLink(controller:"log",action:"edit",id:log.id)}"/><g:message code="edit"/></a>]
        <br/>${log.description}
      </div>
      <%}%>
      </div>
      <h2>[<a href="${createLink(controller:"log", action:"create")}"/><g:message code="message.new"/></a>]
      [<a href="mailto:yetanotherman@gmail.com?subject=&body=@description@%0ABut de la visite%0A%0A%0AImpression du Commercial%0A%0A%0APoints Forts%0A%0A%0APoints Faibles%0A%0A%0A%0AReste à Faire / Actions à mener%0A%0A%0A%0AObservation du Directeur Commercial%0A%0A%0A%0A%0A@description@%0A@compte@${compteInstance.id}@compte@" >mail</a>]</h2></li>

          <ul/>
          </div>
          <div id="tabs-4">
          <ul>

          <%for(def contact in compteInstance.contacts){%>
            <li><h2><a href="${createLink(controller:"contact",action:"show",id:contact.id)}"/>${contact.name}</a></h2> <p>${contact.email}</h2></li>
            <%}%>
      <li><h2>[<a href="${createLink(controller:"contact", action:"create")}"/><g:message code="message.new"/></a>]</h2></li>

      <ul/>

  </div>
  <div id="tabs-5">
    <div>${compteInstance.street}<br/>${compteInstance.extra}<br/>${compteInstance.zip} ${compteInstance.city}</div>
    <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compteInstance.street}+${compteInstance.extra}+${compteInstance.zip}+${compteInstance.city}+France&amp;ie=UTF8&amp;output=embed"></iframe>

  </div>


</div>

</body>
</html>
