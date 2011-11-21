<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />

<jq:resources />
<jqui:resources themeCss="/Booness/css/jquery-ui/themes/custom-theme/jquery-ui-1.8.16.custom.css"/>
<style type="text/css">
/* Vertical Tabs
----------------------------------*/
.ui-tabs-vertical {
	width: 100%;
}

.ui-tabs-vertical .ui-tabs-nav {
	padding: .2em .1em .2em .2em;
	float: left;
	width:100px;
}

.ui-tabs-vertical .ui-tabs-nav li {
	clear: left;
	width:100%;
	border-bottom-width: 1px !important;
	border-right-width: 0 !important;
	margin: 0 -1px .2em 0;
}

.ui-tabs-vertical .ui-tabs-nav li a {
	display: block;
}

.ui-tabs-vertical .ui-tabs-nav li.ui-tabs-selected {
	padding-bottom: 0;
	padding-right: .1em;
	border-bottom: 1;
	border-right-width: 1px;
}

.ui-tabs-vertical .ui-tabs-panel {
	padding: 1em;
	float: right;
}
</style>

<script>
    $(document).ready(function() {
        $("#logs").tabs({
            fillSpace: true,
            navigation: true
    	}).addClass('ui-tabs-vertical ui-helper-clearfix');
     	$("#logs li").removeClass('ui-corner-top').addClass('ui-corner-left');
    });
    $(document).ready(function() {
        $("#affaires").tabs({
            fillSpace: true,
            navigation: true
    	}).addClass('ui-tabs-vertical ui-helper-clearfix');
     	$("#affaires li").removeClass('ui-corner-top').addClass('ui-corner-left');
    });
    $(document).ready(function() {
        $( "#tabs" ).tabs({
                fillSpace: true,
                navigation: true
        });
	});
</script>
<title>
	${compteInstance.name}
</title>
</head>
<body>

	<div class="body">
	<div id="header">
		${compteInstance.name} 
		<div id="action">
			<a href="${createLink(action:'edit', id:compteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
			<a target="_blank" href="${createLink(action:'print', id:compteInstance.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/></a>
		</div>
			
	</div>
		<div id="rightCol">
			<div id="address">
				<a target="_blank" href="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compteInstance.street}+${compteInstance.extra}+${compteInstance.zip}+${compteInstance.city}+France&amp;ie=UTF8">
					<img style="vertical-align: 30%;" id="famfamfam"
						src='${resource(dir: 'images/icons', file: 'house.png', plugin: 'famfamfam')}' />
				</a>
				<div style="display: inline-block;">
					${compteInstance.street}<br />
					${compteInstance.extra?compteInstance.extra+"<br/>":""}
					${compteInstance.zip}
					${compteInstance.city}
				</div>
				<br /> <br /> <img id="famfamfam"
					src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}' /><a
					href="tel:${compteInstance.phone}"> ${compteInstance.phone} </a><br />
				<img id="famfamfam"
					src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}' /><a
					href="tel:${compteInstance.fax}"> ${compteInstance.fax} </a><br /> <img
					id="famfamfam"
					src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}' /><a
					href="mailto:${compteInstance.email}"> ${compteInstance.email} </a><br />
				<%if(compteInstance.website){%><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'world_link.png', plugin: 'famfamfam')}'/><a target="_blank" href="${compteInstance.website}">${compteInstance.website}</a><%}%>

			</div>
			<br /> Contacts <a
				href="${createLink(controller:"contact", action:"create", params:["compte.id":compteInstance.id])}"><img
				id="famfamfam"
				src='${resource(dir: 'images/icons', file: 'user_add.png', plugin: 'famfamfam')}' />
			</a>
			<g:render template="contact" collection="${compteInstance.contacts}"
				var="contact" />
			
			<br/><br/>
			<div id="address">
				<img width="100%" alt="qrcode" src="${createLink(controller:'qrcode', action:'text', params:['text':createLink(base:'http://caleffi-france.fr:8080/Booness',controller:'compte',action:'show',id:compteInstance.id)])}">
			</div>
		</div>
		
		<div id="leftCol">
<div id="tabs">
<ul>
    <li><a href="#tabs-1">Affaires (${compteInstance.affaires.size()})</a> <a style="cursor: pointer;" href="${createLink(controller:'affaire', action:'create', params:['compte.id':compteInstance.id])}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}' /></a>
    <li><a href="#tabs-2">Activit&eacute;s (${compteInstance.logs.size()})</a><a style="cursor: pointer;" href="${createLink(controller:'log', action:'create', params:['compte.id':compteInstance.id,'user.id':id, description:'<b>Resultat de la Visite</b><br/><br/><br/><br/><b>Reste &agrave; Faire / Actions &agrave; mener</b><br/><br/><br/>'])}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'add.png', plugin: 'famfamfam')}' /></a></li>

  </ul>

  <div id="tabs-1" style="padding:0; border:none;">
  <div id="affaires">
				<ul>
					<g:render template="affairetab" collection="${compteInstance.affaires}" var="affaire" />
				</ul>
				<g:render template="affaire" collection="${compteInstance.affaires}" var="affaire" />
			</div>
  </div>
  
  <div id="tabs-2" style="padding:0; border:0px;">
						
<div id="logs">
				<ul>
					<g:render template="logtab" collection="${compteInstance.logs}" var="log" />
					
				</ul>
				<g:render template="log" collection="${compteInstance.logs}" var="log" />
			</div>
			
			
  </div>
		</div>
			
		</div>
	</div>
</body>
</html>