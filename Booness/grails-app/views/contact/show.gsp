<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta content="main" name="layout"/>
    <title>${contactInstance.name}</title>
    <fullcal:resources theme="smoothness"/>
  <jqui:resources theme="smoothness"/>

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
<%
def compte=null
def c = fr.booness.Compte.createCriteria()
def results = c.list {
  contacts {
    eq('id',contactInstance.id)
  }
}
if(results.size()>0){
  compte=results[0]
}
%>
    <h1>${contactInstance.name} [<a href="${createLink(controller:"contact", action:"edit", id:contactInstance.id)}"><g:message code="edit"/></a>]<g:if test="${compte!=null}"> | <a href="${createLink(controller:'compte', action:'show', id:compte.id)}">${compte.name}</a></g:if></h1>
    <div id="tabs">
  <ul>
    <li><a href="#tabs-1">General</a></li>
    <li><a href="#tabs-2">Carte</a></li>
  </ul>

  <div id="tabs-1">
    <b><g:message code="contact.address"/></b>
    <blockquote>${contactInstance.street}<br/>${contactInstance.extra?contactInstance.extra+"<br/>":""}${contactInstance.zip} ${contactInstance.city}</blockquote>
<%if(contactInstance.telephone){%><b><g:message code="contact.telephone"/></b> : <a href="skype:${contactInstance.telephone}?call">${contactInstance.telephone}</a><br/><%}%>
<%if(contactInstance.mobile){%><b><g:message code="contact.mobile"/></b> : <a href="skype:${contactInstance.mobile}?call">${contactInstance.mobile}</a><br/><%}%>
  <%if(contactInstance.fax){%><b><g:message code="contact.fax"/></b> : <b>${contactInstance.fax}</b><br/><%}%>

  <%if(contactInstance.email){%><b><g:message code="contact.email"/></b> : <a href="mailto:${contactInstance.email}">${contactInstance.email}</a><br/><%}%>
    <%if(contactInstance.website){%><b><g:message code="contact.website"/></b> : <script type="text/javascript">wsr_snapshot('${contactInstance.website}', 'C2T4XSE7A1b0', 's');</script><%}%>
    <blockquote>
${contactInstance.description}</blockquote>
  </div>

  <div id="tabs-2">
       <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=fr&amp;mrt=loc&amp;geocode=&amp;q=${contactInstance.street}+${contactInstance.zip}+${contactInstance.city}+${contactInstance.country}&amp;ie=UTF8&amp;z=14&amp;output=embed"></iframe>
  </div>


</div>


   
   </body>
</html>
