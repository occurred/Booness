<div id="tab-${log.id}">
	<div id="log">
		<div id="action">
			<a href="${createLink(controller:'log', action:'edit', id:log.id)}">
				<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}' />
			</a>
			
			<a href="${createLink(controller:'log', action:'show', id:log.id)}">
				<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'page_go.png', plugin: 'famfamfam')}' />
			</a>
		</div>
		<h2>${log.title}</h2>
		<span class="small">
			${log.user.name} (${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(log.startDate).capitalize()}
			<%if(!log.allday){%> de ${log.startDate.toString().split(" ")[1].substring(0,5)} a ${log.endDate.toString().split(" ")[1].substring(0,5)}<%}%>)</span>
		<br />
		<div id="address">
			${log.objectif}
		</div>
		<div id="address">
			${log.description.replace("\\n","<br/>")}
		</div>
	</div>
</div>