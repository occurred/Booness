
<%@ page import="fr.booness.Contact" %>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="main" />
    <title><g:message code="contact.create" default="Create Contact" /></title>
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
  <div class="nav">
    <span class="menuButton"><a class="home" href="${createLinkTo(dir: '')}"><g:message code="home" default="Home" /></a></span>
    <span class="menuButton"><g:link class="list" action="list"><g:message code="contact.list" default="Contact List" /></g:link></span>
  </div>
  <div class="body">
    <h1><g:message code="contact.create" default="Create Contact" /></h1>
    <g:if test="${flash.message}">
      <div class="message"><g:message code="${flash.message}" args="${flash.args}" default="${flash.defaultMessage}" /></div>
    </g:if>
    <g:hasErrors bean="${contactInstance}">
      <div class="errors">
        <g:renderErrors bean="${contactInstance}" as="list" />
      </div>
    </g:hasErrors>
    <g:form action="save" method="post" >
      <div class="dialog">
        <table>
          <tbody>

            <tr class="prop">
              <td valign="top" class="name">
                <label for="name"><g:message code="contact.name" default="Name" />:</label>
              </td>
              <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'name', 'errors')}">
          <g:textField name="name" value="${fieldValue(bean: contactInstance, field: 'name')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="email"><g:message code="contact.email" default="Email" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'email', 'errors')}">
          <g:textField name="email" value="${fieldValue(bean: contactInstance, field: 'email')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="telephone"><g:message code="contact.telephone" default="Telephone" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'telephone', 'errors')}">
          <g:textField name="telephone" value="${fieldValue(bean: contactInstance, field: 'telephone')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="street"><g:message code="contact.street" default="Street" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'street', 'errors')}">
          <g:textField name="street" value="${fieldValue(bean: contactInstance, field: 'street')}" />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="zip"><g:message code="contact.zip" default="Zip" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'zip', 'errors')}">
          <g:textField name="zip" value="${fieldValue(bean: contactInstance, field: 'zip')}" />

          </td>
          </tr>


          <tr class="prop">
            <td valign="top" class="name">
              <label for="country"><g:message code="contact.country" default="Country" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'country', 'errors')}">
          <g:select name="country" from="${contactInstance.constraints.country.inList}" value="${contactInstance.country}" valueMessagePrefix="contact.country"  />

          </td>
          </tr>

          <tr class="prop">
            <td valign="top" class="name">
              <label for="city"><g:message code="contact.city" default="City" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'city', 'errors')}">
          <g:select id="city"
                    name="city"
                    onfocus="
${remoteFunction(
  controller:'contact',
  action:'getCities',
  params:'getParams()',
  onComplete:'updateCities(e)')}
                    "
                    value="${fieldValue(bean: contactInstance, field: 'city')}" />

          </td>
          </tr>



          <tr class="prop">
            <td valign="top" class="name">
              <label for="description"><g:message code="contact.description" default="Description" />:</label>
            </td>
            <td valign="top" class="value ${hasErrors(bean: contactInstance, field: 'description', 'errors')}">
          <g:textArea name="description" rows="5" cols="40" value="${fieldValue(bean: contactInstance, field: 'description')}" />

          </td>
          </tr>

          </tbody>
        </table>
      </div>
      <div class="buttons">
        <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'create', 'default': 'Create')}" /></span>
      </div>
    </g:form>
  </div>
</body>
</html>
