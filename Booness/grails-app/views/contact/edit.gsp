
<%@ page import="fr.booness.Contact"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<title><g:message code="contact.edit" default="Edit Contact" />
</title>
<g:javascript library="prototype" />
<script type="text/javascript">

  function getParams(){
    var p='zip='
    p+=document.getElementById('zip').value
    p+='&country='
    p+=document.getElementById('country').value
    return p
  }

  function updateCities(e) {
  // The response comes back as a bunch-o-JSON
    var cities = eval("(" + e.responseText + ")") // evaluate JSON

    if (cities) {
      var rselect = document.getElementById('city')

  // Clear all previous options
      var l = rselect.length
      while (l > 0) {
        l--
        rselect.remove(l)
      }

  // Rebuild the select
      for (var i=0; i < cities.length; i++) {
        var city = cities[i];
        var opt = document.createElement('option');
        opt.text = city;
        try {
          rselect.add(opt, null) // standards compliant; doesn't work in IE
        } catch(ex) {
          rselect.add(opt) // IE only
        }
     }
  }
}

        

  </script>
</head>
<body>
	<div class="body">
		<h1>
			<g:message code="contact.edit" default="Edit Contact" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message">
				<g:message code="${flash.message}" args="${flash.args}"
					default="${flash.defaultMessage}" />
			</div>
		</g:if>
		<g:hasErrors bean="${contactInstance}">
			<div class="errors">
				<g:renderErrors bean="${contactInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save" method="post">
			<input type="hidden" name="compte.id" value="${contactInstance?.compte?.id}" id="compte.id" />
			<g:hiddenField name="id" value="${contactInstance?.id}" />
			<g:hiddenField name="version" value="${contactInstance?.version}" />
			<div class="dialog">
				<table>
					<tbody>
					<style>
                        input {
                        width:100%;
                        }
                        </style>
                        
                        <tr class="prop">
							<td valign="top" class="name"><label for="titre"><g:message
										code="contact.titre" default="Civilit&eacute;" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'titre', 'errors')}">
								<g:select name="titre"
									from="${fr.booness.Contact.constraints.titre.inList}"
									value="${contactInstance?.titre}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="name"><g:message
										code="contact.name" default="Name" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'name', 'errors')}">
								<g:textField name="name"
									value="${contactInstance.name}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="post"><g:message
										code="contact.post" default="Post" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'post', 'errors')}">
								<g:select name="post.id"
									from="${fr.booness.param.ContactPost.list(order:'asc', sort:'name')}"
									optionKey="id"
									value="${contactInstance.post?.id}"/></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message
										code="contact.description" default="Description" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'description', 'errors')}">
								<richui:richTextEditor name="description" width="600"
									height="300" value="${contactInstance.description}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="email"><g:message
										code="contact.email" default="Email" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'email', 'errors')}">
								<g:textField name="email"
									value="${contactInstance.email}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="website"><g:message
										code="contact.website" default="Website" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'website', 'errors')}">
								<g:textField name="website"
									value="${contactInstance.website}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="telephone"><g:message
										code="contact.telephone" default="Telephone" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'telephone', 'errors')}">
								<g:textField name="telephone"
									value="${contactInstance.telephone}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="mobile"><g:message
										code="contact.mobile" default="Mobile" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'mobile', 'errors')}">
								<g:textField name="mobile"
									value="${contactInstance.mobile}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="fax"><g:message
										code="contact.fax" default="Fax" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'fax', 'errors')}">
								<g:textField name="fax"
									value="${contactInstance.fax}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="street"><g:message
										code="contact.street" default="Street" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'street', 'errors')}">
								<g:textField name="street"
									value="${contactInstance.street}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="extra"><g:message
										code="contact.extra" default="Extra" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'extra', 'errors')}">
								<g:textField name="extra"
									value="${contactInstance.extra}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="zip"><g:message
										code="contact.zip" default="Zip" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'zip', 'errors')}">
								<g:textField name="zip"
									value="${contactInstance.zip}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="city"><g:message
										code="contact.city" default="City" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'city', 'errors')}">
								<g:select id="city" name="city"
									onfocus="${remoteFunction(
controller:'contact',
action:'getCities',
params:'getParams()',
onComplete:'updateCities(e)')}"
									value="${contactInstance.city}" /></td>
						</tr>


						<tr class="prop">
							<td valign="top" class="name"><label for="country"><g:message
										code="contact.country" default="Country" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: contactInstance, field: 'country', 'errors')}">
								<g:select name="country"
									from="${contactInstance.constraints.country.inList}"
									value="${contactInstance.country}"
									valueMessagePrefix="contact.country" /></td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'update', 'default': 'Update')}" /></span>
                	<span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'delete', 'default': 'Delete')}" onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" /></span>
                </div>
		</g:form>
	</div>
</body>
</html>
