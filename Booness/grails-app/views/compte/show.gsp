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
  <jq:resources/>
  <jqui:resources/>

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
            $( "#help" ).accordion({
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
  <p>[<a href="${createLink(controller:"compte", action:"edit", id:compteInstance.id)}"><g:message code="edit"/></a>][<a href="${createLink(controller:'compte', action:'print', id:compteInstance.id)}" target="_blank"><g:message code="print"/></a>][<a href="${createLink(controller:'compte', action:'slide', id:compteInstance.id)}">Slides</a>]</p>
<div id="tabs">
  <ul>
    <li><a href="#tabs-1">General</a></li>
    <li><a href="#tabs-2"><g:message code="compte.affaires"/></a></li>
    <li><a href="#tabs-3"><g:message code="compte.logs"/></a></li>
    <li><a href="#tabs-4"><g:message code="compte.contacts"/></a></li>
    <li><a href="#tabs-5"><g:message code="compte.carte" default="Carte"/></a></li>
    <li><a href="#tabs-6"><g:message code="compte.fichiers" default="Fichiers"/></a></li>
  </ul>

  <div id="tabs-1">
  <blockquote style="border-style: solid;border-width: 1px;padding: 1em 1em">
    <b><g:message code="compte.type"/></b> : ${compteInstance.type}<br/>
    <b><g:message code="compte.address"/></b>
    <blockquote>${compteInstance.street}<br/>${compteInstance.extra?compteInstance.extra+"<br/>":""}${compteInstance.zip} ${compteInstance.city}</blockquote>
<%if(compteInstance.phone){%><b><g:message code="compte.phone"/></b> : <a href="tel:${compteInstance.phone}">${compteInstance.phone}</a><br/><%}%>
  <%if(compteInstance.email){%><b><g:message code="compte.email"/></b> : <a href="mailto:${compteInstance.email}">${compteInstance.email}</a><br/><%}%>
    <%if(compteInstance.website){%><b><g:message code="compte.website"/></b> : <script type="text/javascript">wsr_snapshot('${compteInstance.website}', 'C2T4XSE7A1b0', 's');</script><%}%>
    </blockquote>
    <br/>
    <blockquote style="border-style: solid;border-width: 1px;padding: 1em 1em">
${compteInstance.description}</blockquote>
<img alt="qrcode" src="${createLink(controller:'qrcode', action:'text', params:['text':createLink(base:'http://caleffi-france.fr:8080/Booness',controller:'compte',action:'show',id:compteInstance.id)])}">

  </div>
  
  <div id="tabs-2">
  [<a href="${createLink(controller:"affaire", action:"create", params:["compte.id":compteInstance.id, "owner.id":sec.loggedInUserInfo(field:"id")])}"/><g:message code="message.new"/></a>]
  
      <ul>
      <%for(def affaire in compteInstance.affaires){%>
        <li><h2><a href="${createLink(controller:"affaire",action:"show",id:affaire.id)}"/>${affaire.name}</a></h2> <p>${affaire.description}</h2></li>
      <%}%>
      </ul>
  </div>
  <div id="tabs-3">
  [<a href="${createLink(controller:"log", action:"create", params:["compte.id":compteInstance.id,"user.id":id, description:"<b>Resultat de la Visite</b><br/><br/><br/><br/><b>Reste à Faire / Actions à mener</b><br/><br/><br/>"])}"/>
      <g:message code="message.new"/>
      </a>]
    <div id="accordion">
	
      <%for(def log in compteInstance.logs){%>
       
      <h3><a href="#"/>${log.title} par ${log.user.name} <small>(${log.startDate.toString().split(" ")[0]}<%if(!log.allday){%> de ${log.startDate.toString().split(" ")[1].substring(0,5)} a ${log.endDate.toString().split(" ")[1].substring(0,5)}<%}%>)</small></a></h3>
      <div>
        [<a href="${createLink(controller:"log",action:"edit",id:log.id)}"/><g:message code="edit"/></a>]
        <br/><b><u>Objectif</u></b><br/>${log.objectif}
		<br/><b><u>Compte-Rendu</u></b><br/>${log.description.replaceAll('\n','<br/>')}
      </div>
      <%}%>
      </div>
      
          <ul/>
          </div>
          <div id="tabs-4">
          [<a href="${createLink(controller:"contact", action:"create", params:["compte.id":compteInstance.id])}"/><g:message code="message.new"/></a>]
          
          <ul>

          <%for(def contact in compteInstance.contacts){%>
            <li><b><a href="${createLink(controller:"contact",action:"show",id:contact.id)}"/>${contact.name}</a> (${contact.post})</b><br/>
			<g:if test="${contact.mobile}"><p>Mobile : <a href="tel:${contact.mobile}">${contact.mobile}</a></p></g:if>
			<g:if test="${contact.telephone}"><p>Fixe : <a href="tel:${contact.telephone}">${contact.telephone}</a></p></g:if>
			<g:if test="${contact.email}"><p><a href="mailto:${contact.email}">${contact.email}</a></p></g:if>
			</li>
            <%}%>
      
      <ul/>

  </div>
  <div id="tabs-5">
    En fonction de la qualite de renseignement de l'adresse, la geolocalisation de la carte peut varier.
    <iframe width="600" height="400" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compteInstance.street}+${compteInstance.extra}+${compteInstance.zip}+${compteInstance.city}+France&amp;ie=UTF8&amp;output=embed"></iframe>

  </div>
  <div id="tabs-6">
  <div id="help"><h3><a href="#"/>Aide</a></h3>
  <div>
  <ul>
    <li>Veuillez <b>connecter</b> le <b>VPN Caleffi</b> pour acceder aux fichiers relatifs au compte de facon securisee.</li>
    
    <li>Si le repertoire n'existe pas, vous pouvez le creer en copiant Z:\CALEFFI-FRANCE\Base%20Odys\Documents\ dans l'Explorer (Windows+E pour l'ouvrir) et en creant le fichier '${compteInstance.id}'. Z:\CALEFFI-FRANCE\Base%20Odys\Documents\${compteInstance.id}\ est ainsi cree.</li>
    <li>Installez si ce n'est pas fait, le plugin chrome: <a target="_blank" href="https://chrome.google.com/webstore/detail/jllpkdkcdjndhggodimiphkghogcpida?hl=fr">Ici</a></li>
    </ul>
	</div>
	</div>
	<br/><a target="_blank" href="file:///Z:/CALEFFI-FRANCE/Base%20Odys/Documents/${compteInstance.id}">Allez aux fichiers</a>
  </div>


</div>

</body>
</html>
