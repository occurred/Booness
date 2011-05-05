<%@ page contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<!--
  Copyright 2011 Google Inc.
 
  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at
 
     http://www.apache.org/licenses/LICENSE-2.0
 
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
 
  Original slides: Marcin Wichary (mwichary@google.com)
  Modifications: Chrome DevRel Team (chrome-devrel@googlegroups.com)
                 Alex Russell (slightlyoff@chromium.org)
                 Brad Neuberg
-->
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge;chrome=1" />
<title>HTML5 Presentation</title>
<link
	href="http://fonts.googleapis.com/css?family=Droid+Sans|Droid+Sans+Mono"
	rel="stylesheet" type="text/css" />
<link id="prettify-link"
	href="${resource(dir:'css/slides',file:'prettify.css')}"
	rel="stylesheet"/>
<link href="${resource(dir:'css/slides',file:'moon.css')}" class="theme"
	rel="stylesheet" />
<link href="${resource(dir:'css/slides',file:'sand.css')}" class="theme"
	rel="stylesheet" />
<link href="${resource(dir:'css/slides',file:'sea_wave.css')}" class="theme"
	rel="stylesheet" />
<link href="${resource(dir:'css/slides',file:'default.css')}" class="theme"
	rel="stylesheet" media="screen" />
	
</head>

<body>
	<div class="presentation">
		<div id="presentation-counter">Loading...</div>
		<div class="slides">

			<div class="slide" id="landing-slide">
				<style>
#message {
	line-height: 18px;
}

#landing-slide h1,#landing-slide h2 {
	color: black;
}

#landing-slide h1 {
	letter-spacing: -2px;
	font-size: 82px;
	border-radius: 10px 10px 10px 10px;
	bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	color: black;
	display: inline-block;
	background: -moz-linear-gradient(left top, #EE8888, #FFEEEE) repeat
		scroll 0 0 transparent;
	padding: 15px 15px 15px;
	position: relative;
	text-shadow: none;
}

#landing-slide h2 {
	margin-top: -5px;
	font-size: 40px;
	letter-spacing: -1px;
}
</style>
				<section class="middle">
					<hgroup>
						<h1>
							${compteInstance.name}
						</h1>
					</hgroup>
					<blockquote>
						<%if(compteInstance.phone){%><b><g:message code="compte.phone"/></b> : <a href="tel:${compteInstance.phone}">${compteInstance.phone}</a><br/><%}%>
						<%if(compteInstance.email){%><b><g:message code="compte.email"/></b> : <a href="mailto:${compteInstance.email}">${compteInstance.email}</a><br/><%}%>
						<%if(compteInstance.website){%><b><g:message code="compte.website"/></b> : <a href='${compteInstance.website}'>${compteInstance.website}</a><%}%>

						<p id="message">Adresse</p>
						<div id="message">
							${compteInstance.street}
							<%if(compteInstance.extra){%><br id="message"/>
      ${compteInstance.extra}
    <%}%>
							<br id="message" />
							${compteInstance.zip}
							${compteInstance.city}

						</div>
					</blockquote>
					<p>
						<span id="left-init-key" class="key">&rarr;</span>
					</p>
				</section>
			</div>
			<g:if test="${compteInstance.contacts}">
			<div class="slide" id="contacts-title-slide">
				<style>
#contacts-title-slide h1,#contacts-title-slide h2 {
	color: black;
}

#contacts-title-slide h1 {
	letter-spacing: -2px;
	font-size: 82px;
	border-radius: 10px 10px 10px 10px;
	bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	color: black;
	display: inline-block;
	background: -moz-linear-gradient(left top, #EE8888, #FFEEEE) repeat
		scroll 0 0 transparent;
	padding: 15px 15px 15px;
	position: relative;
	text-shadow: none;
}

#contacts-title-slide h2 {
	margin-top: -5px;
	font-size: 40px;
	letter-spacing: -1px;
}
</style>
				<section class="middle">
					<hgroup>
						<h1>Contacts</h1>
					</hgroup>

				</section>
			</div>


			<div class="slide" id="contacts-slide">
				<style>
				#contacts-slide p{
				font-weight: 18px;
				}
</style>
				<section class="small">
					<ul>

						<%for(def contact in compteInstance.contacts){%>
            <li><b><a href="${createLink(controller:"contact",action:"show",id:contact.id)}"/>${contact.name}</a> (${contact.post})</b><br/>
			<g:if test="${contact.mobile}"><p>Mobile : <a href="tel:${contact.mobile}">${contact.mobile}</a></p></g:if>
			<g:if test="${contact.telephone}"><p>Fixe : <a href="tel:${contact.telephone}">${contact.telephone}</a></g:if>
			<g:if test="${contact.email}"><p><a href="mailto:${contact.email}">${contact.email}</a></p></g:if>
			</li>
            <%}%>

						<ul/>
				</section>
			</div>
			</g:if>
			<div class="slide" id="map-slide">
				<style>
</style>
				<section>
					En fonction de la qualite de renseignement de l'adresse, la
					geolocalisation de la carte peut varier.
					<iframe width="800" height="500" frameborder="0" scrolling="no"
						marginheight="0" marginwidth="0"
						src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compteInstance.street}+${compteInstance.extra}+${compteInstance.zip}+${compteInstance.city}+France&amp;ie=UTF8&amp;output=embed"></iframe>


				</section>
			</div>
			<div class="slide" id="title-slide">
				<style>
#title-slide h1,#title-slide h2 {
	color: black;
}

#title-slide h1 {
	letter-spacing: -2px;
	font-size: 82px;
	border-radius: 10px 10px 10px 10px;
	bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	color: black;
	display: inline-block;
	background: -moz-linear-gradient(left top, #EE8888, #FFEEEE) repeat
		scroll 0 0 transparent;
	padding: 15px 15px 15px;
	position: relative;
	text-shadow: none;
}

#title-slide h2 {
	margin-top: -5px;
	font-size: 40px;
	letter-spacing: -1px;
}
</style>
				<section class="middle">
					<hgroup>
						<h1>Activites</h1>
					</hgroup>

				</section>
			</div>
			<%for(def log in compteInstance.logs){%>
				
				<div class="slide" id="log${log.id}-slide">
	<style>
	</style>
					<section>
					<h3><a href="#"/>${log.title} par ${log.user.name} <small>(${log.startDate.toString().split(" ")[0]}<%if(!log.allday){%> de ${log.startDate.toString().split(" ")[1].substring(0,5)} a ${log.endDate.toString().split(" ")[1].substring(0,5)}<%}%>)</small></a></h3>
      <div>
        [<a href="${createLink(controller:"log",action:"edit",id:log.id)}"/><g:message code="edit"/></a>]
        <br/><b><u>Objectif</u></b><br/>${log.objectif}
		<br/><b><u>Compte-Rendu</u></b><br/>${log.description}
      </div>
	
					</section>
				</div>
       
      
      <%}%>



		</div>
		<!-- slides -->

	</div>
	<!-- presentation -->
 <script type="text/javascript" src="${resource(dir:'js/slides',file:'slides.js')}"></script>
    <!--[if lt IE 9]>
    <script 
      src="http://ajax.googleapis.com/ajax/libs/chrome-frame/1/CFInstall.min.js">
    </script>
    <script>CFInstall.check({ mode: "overlay" });</script>
    <![endif]--> 
 
  </body> 
</html>