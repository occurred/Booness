
<%@ page import="fr.booness.Log"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<resource:richTextEditor type="advanced" />
<jq:resources />
<jqui:resources />
<title><g:message code="log.edit" default="Edit Log" /></title>
</head>
<body>
	<div class="body">
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
		<h2>
			Compte :
			${logInstance.compte.name}
		</h2>
		<g:form method="post">
			<input type="hidden" name="compte.id"
				value="${logInstance.compte.id}" id="compte.id" />

			<g:hiddenField name="id" value="${logInstance?.id}" />
			<g:hiddenField name="version" value="${logInstance?.version}" />
			<div class="dialog">
				<table>
					<tbody>

						<tr class="prop">
							<td valign="top" class="name"><label for="title"><g:message
										code="log.title" default="Title" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'title', 'errors')}">
								<g:textField name="title" value="${logInstance?.title}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="type"><g:message
										code="log.type" default="Type" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'type', 'errors')}">
								<g:select name="type.id"
									from="${fr.booness.param.LogType.list()}" optionKey="id"
									value="${logInstance?.type?.id}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="allday"><g:message
										code="log.allday" default="Allday" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'allday', 'errors')}">
								<g:checkBox name="allday" value="${logInstance?.allday}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="startDate"><g:message
										code="log.startDate" default="Start Date" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'startDate', 'errors')}">
								<g:jqDatePicker name="startDate"
									value="${logInstance?.startDate}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="endDate"><g:message
										code="log.endDate" default="End Date" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'endDate', 'errors')}">
								<g:jqDatePicker name="endDate" value="${logInstance?.endDate}" />

							</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><label for="objectif"><g:message
										code="objectif" default="Objectif" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'objectif', 'errors')}">
								<richui:richTextEditor name="objectif" width="600" height="100"
									value="${logInstance?.objectif}" /></td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name"><label for="description"><g:message
										code="log.description" default="Description" />:</label>
							</td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'description', 'errors')}">
								<richui:richTextEditor name="description" width="600"
									height="300" value="${logInstance?.description}" />
							</td>
						</tr>

						<tr class="prop">
							<td valign="top" class="name"><label for="kilometres"><g:message
										code="log.kilometres" default="Kilom&egrave;tres" />:</label></td>
							<td valign="top"
								class="value ${hasErrors(bean: logInstance, field: 'kilometres', 'errors')}">
								<g:textField name="kilometres"
									value="${logInstance?.kilometres}" />
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="buttons">
				<span class="button"><g:actionSubmit class="save"
						action="update"
						value="${message(code: 'update', 'default': 'Update')}" /> </span> <span
					class="button"><g:actionSubmit class="delete"
						action="delete"
						value="${message(code: 'delete', 'default': 'Delete')}"
						onclick="return confirm('${message(code: 'delete.confirm', 'default': 'Are you sure?')}');" />
				</span>
			</div>
		</g:form>
	</div>
</body>
</html>
