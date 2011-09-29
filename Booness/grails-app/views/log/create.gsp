
<%@page import="fr.booness.Compte"%>
<%@ page import="fr.booness.Log"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<resource:richTextEditor type="advanced" />
<jq:resources />
<jqui:resources />
<title><g:message code="log.create" default="Create Log" />
</title>
</head>
<body>
	<div class="body">
		<div style="text-align: center; width: 100%">
			<g:render template="/compte/comptecard"
				model="${[compte:Compte.get(Long.parseLong(params.compte.id))]}"></g:render>
		</div>

		<g:if test="${flash.message}">
			<div class="message">
				<g:message code="${flash.message}" args="${flash.args}"
					default="${flash.defaultMessage}" />
			</div>
		</g:if>
		<g:hasErrors bean="${logInstance}">
			<div class="errors">
				<g:renderErrors bean="${logInstance}" as="list" />
			</div>
		</g:hasErrors>
		<g:form action="save" method="post">
			<input type="hidden" name="compte.id" value="${params.compte.id}"
				id="compte.id" />

			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name"><label for="type"><g:message
										code="log.type" default="Type" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'type', 'errors')}">
								<g:select name="type.id"
									from="${fr.booness.param.LogType.list()}" optionKey="id"
									value="" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="allday"><g:message
										code="log.allday" default="Allday" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'allday', 'errors')}">
								<g:checkBox name="allday" value="${logInstance?.allday}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="startDate"><g:message
										code="log.startDate" default="Start Date" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'startDate', 'errors')}">
								<g:jqDatePicker name="startDate"
									value="${logInstance?.startDate}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="endDate"><g:message
										code="log.endDate" default="End Date" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'endDate', 'errors')}">
								<g:jqDatePicker name="endDate" value="${logInstance?.endDate}" />

							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="objectif"><g:message
										code="objectif" default="Objectif" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'objectif', 'errors')}">
								<richui:richTextEditor name="objectif" width="600" height="100"
									value="${logInstance?.objectif}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message
										code="log.description" default="Description" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'description', 'errors')}">
								<richui:richTextEditor name="description" width="600"
									height="300" value="${logInstance?.description}" /></td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="kilometres"><g:message
										code="log.kilometres" default="Kilom&egrave;tres" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'kilometres', 'errors')}">
								<g:textField name="kilometres"
									value="${logInstance?.kilometres}" /></td>
						</tr>


					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:submitButton name="create"
						class="save"
						value="${message(code: 'create', 'default': 'Create')}" /> </span>
			</div>
		</g:form>
	</div>

</body>
</html>
