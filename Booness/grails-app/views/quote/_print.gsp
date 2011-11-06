<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page import="fr.booness.*"%>
<html>
<head>
<title>Devis</title>
<style type="text/css">
@page {
    size: 210mm 297mm;
    @bottom-center { content: element(footer);}
    @top-center { content: element(header); }
}

* {
	margin:0px;
}
div.break {
	page-break-after:always;
}

table.list {
	border: thin solid #333;
	border-spacing: 0;
	padding:0px;
}

.list th {
	border: thin solid #333;
}

.list td {
	padding:5px;
	border: thin solid #333;
	empty-cells: show;
}

table.table{
	border-collapse:collapse;
}

table.table td{
	border: 1px #6e94b7 solid;
}

table {
	align: center;
	width: 100%;
	border: none;
	padding: 10mm;
	padding-top: 0;
}

td.center {
	text-align: center;
	
}

tr.title {
	background-color: #bbbbcc;
	text-align: center;
	margin:0px;
	text-shadow: navy;
	font-weight: bold;
}

td.report {
	text-shadow: navy;
	font-weight: bolder;
	font-size: larger;
}

td.MEDIUM {
	background-color: yellow;
}

td.HIGH {
	background-color: red;
}

td.LOW {
	background-color: green;
}

.small {
	color: #888;
}

.footer {
	bottom: 0px;
	font-size: 90%; 
	ont-style: italic;
	position: running(footer); 
}

.header {
	top: 0px;
	position: running(header); 
}
#post-header{
	height:100px;
}

</style>
</head>
<body>
	<table class="header">
		<tbody>
			<tr>
				<td class="center"><img height="90px;" src="/Booness/images/CALEFFI_logo.jpg" />
				</td>
				<td class="small">
				CALEFFI FRANCE S.A.R.L.<br/>
				45 Avenue Gambetta - 26000 Valence - France<br/>
				Tel +33 (0)4 75 59 95 86 - Fax +33 (0)4 75 84 15 61<br/>
				infos@caleffi.fr - www.caleffi.fr<br/>
				</td>
			</tr>
		</tbody>
	</table>
	
	<div class="footer small" style="font-size: 10px;">
	CALEFFI FRANCE S.A.R.L - Capital 207.500 &euro; - 450 181 383 00024 - RCS Romans B 450 181 383 - SIRET 450 181 383 00024 - APE 4674B - TVA FR 66 450 181 383
	</div>
	
	
	<g:if test="${quoteInstance.type=='devis'}">
	<div id="post-header"/>
	<table>
		<tbody>
			<tr>
				<td style="width:50%;">
				Contact : ${quoteInstance.affaire.owner.name }<br/>
				Portable : ${quoteInstance.affaire.owner.telephone }<br/>
				Courriel : ${quoteInstance.affaire.owner.email }
				</td>
				
				<td>
				<strong>${quoteInstance.affaire.compte.name}</strong><br/>
				${quoteInstance.contact.titre} ${quoteInstance.contact.name} <br/>
				${quoteInstance.affaire.compte.street} <br/>
				${quoteInstance.affaire.compte.extra} <br/>
				${quoteInstance.affaire.compte.zip} ${quoteInstance.affaire.compte.city}
				</td>
			</tr>
			<tr style="height:10mm;">
			<td colspan="2"></td>
			</tr>
			<tr>
			<td></td>
			<td>Valence, le ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateCreated).capitalize()}</td>
			</tr>
			<tr/>
			<tr>
		      <td colspan="2">
		      &ensp;&ensp;&ensp;&ensp;${quoteInstance.contact.titre},
		      <br/><br/>
		      &ensp;&ensp;&ensp;&ensp;Nous vous remercions beaucoup de l'int&eacute;r&ecirc;t que vous portez &agrave; nos produits suite &agrave; votre demande concernant l'affaire cit&eacute;e en objet.
			  <br/>
			  <br/>
			  &ensp;&ensp;&ensp;&ensp;Par la pr&eacute;sente, nous sommes heureux de vous soumettre notre liste de prix nets HT <g:if test="${quoteInstance.affaire.compte.type.toString()=='BUREAU D\'ETUDES'}"> pour votre &eacute;tude.</g:if><g:else>r&eacute;serv&eacute;s &agrave; votre soci&eacute;t&eacute;.</g:else>
			  <br/>
			  Notre offre est valable jusqu'au ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateCreated+120)}
			  <br/>
			  <g:if test="${quoteInstance.affaire.compte.type.toString()!='BUREAU D\'ETUDES'}">
			  	<br/>
			  	<div style="color: red; text-align: center;font-weight: bold;width: 100%">Commande &agrave; passer chez votre grossiste partenaire de Thermador</div>
			  </g:if>
			  <br/>
			  Pour toutes demandes compl&eacute;mentaires, vous pourrez nous joindre aux coordonn&eacute;es suivantes :
			  <br/>
			  <div style="width:100%;text-align: center;font-weight: bold;">
			  	CALEFFI France<br/>																																																						
				45 Avenue Gambetta	<br/>																																																				
				26000 VALENCE	<br/>																																																							
				T&eacute;l : 04.75.59.95.86 / Fax : 04.75.84.15.61<br/>
				</div>
				<br/>
			  Je serai votre interlocuteur privil&eacute;gi&eacute; et vous pourrez me joindre &agrave; ces coordonn&eacute;es :
			  
			  
			  <div style="width:100%;text-align: center;font-weight: bold;">
			  <br/>
			  Portable : ${quoteInstance.affaire.owner.telephone }<br/><br/>
			  Courriel : ${quoteInstance.affaire.owner.email }
			  </div>
			  <br/>
			     &ensp;&ensp;&ensp;&ensp;Nous restons bien entendu &agrave; votre disposition pour tous renseignements. Vous trouverez notre documentation technique et les nouveaut&eacute;s en consultant notre site internet www.caleffi.fr.
			  <br/>
			  <br/>
			     &ensp;&ensp;&ensp;&ensp;Dans l'attente de vos commandes, nous vous prions d'agr&eacute;er, ${quoteInstance.contact.titre?.toLowerCase()}, l'expression de nos meilleures salutations.
			  <br/>
			  <br/>
			  <br/>
			  <br/>
			  <strong>${quoteInstance.affaire.owner.name}</strong><br/>
			  ${quoteInstance.affaire.owner.bio }
			  
			  </td>
			</tr>
		</tbody>
	</table>
	
	
    
    <div class="break"/>
    </g:if>
    <div id="post-header"/>
	<table>
		<tbody>
			<tr>
				<td colspan="2" style=" border:thin solid #333; text-align: center;">
					<g:if test="${quoteInstance.type=='devis'}">
						<h1>Offre de Prix</h1>
						<g:if test="${quoteInstance.affaire.compte.type.toString()=='INSTALLATEUR'}"><h1>${quoteInstance.affaire.name}</h1></g:if>
					</g:if>
					<g:else>
						<h1>Fiche de Transmission Thermador</h1>
					</g:else>
				</td>
			</tr>
			<g:if test="${quoteInstance.affaire.compte.type.toString()!='BUREAU D\'ETUDES'}">
				<tr>
					<td colspan="2" >
					<div style="margin:5mm; color: red; text-align: center;font-weight: bold;width: 100%">Commande &agrave; passer chez votre grossiste partenaire de Thermador</div> 
					</td>
				</tr>
			</g:if>
			<tr>
				<td style="width:50%;">
				Date : ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateCreated)}
				<br/><br/>
				N/REF: 
				<br/>
				V/REF : 
				<br/><br/>
				Contact : ${quoteInstance.affaire.owner.name }<br/>
				Portable : ${quoteInstance.affaire.owner.telephone }<br/>
				Courriel : ${quoteInstance.affaire.owner.email }
				</td>
				
				<td>
				<strong>${quoteInstance.affaire.compte.name}</strong><br/>
				${quoteInstance.affaire.compte.street} <br/>
				${quoteInstance.affaire.compte.extra} <br/>
				${quoteInstance.affaire.compte.zip} ${quoteInstance.affaire.compte.city}
				<br/>
				<br/>
				${quoteInstance.contact.name} <br/>
				Tel.&ensp; ${quoteInstance.contact.telephone} &ensp;&ensp; Fax ${quoteInstance.contact.fax} <br/>
				Port.&ensp;${quoteInstance.contact.mobile} <br/>
				
				
				</td>
			</tr>
		</tbody>
	
	</table>
	<table class="list">
  		<thead>
  		<tr>
  			<th>R&eacute;f&eacute;rence</th>
  			<th>Description</th>
  			<th>R&eacute;f&eacute;rence Thermador</th>
  			<th>Quantit&eacute;</th>
  			<th>Prix Indicatif</th>
  		</tr>
  		</thead>
  		<tbody>
  			<g:render template="product" collection="${quoteInstance.products}" var="insert"/>
  			<tr>
  				<td colspan="3"/><td><strong>Total</strong></td><td>${String.format("%.2f",quoteInstance.total)} &euro;</td>
  			</tr>
  		</tbody>
  	</table>
  	<br/>
  	<g:if test="${quoteInstance.type=='devis'}">
		L'offre  est  valable jusqu'au ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateCreated+120)}
	</g:if>
	<g:else>
		Date Pr&eacute;vue : ${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(quoteInstance.dateExecution)}
	</g:else>
</body>
</html>

