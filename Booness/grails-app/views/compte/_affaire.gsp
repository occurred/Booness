<div id="affaire-${affaire.id}">
	<div id="log">
		<div id="action">
			<a href="${createLink(controller:'affaire', action:'edit', id:affaire.id)}">
				<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}' />
			</a>
			
			<a href="${createLink(controller:'affaire', action:'show', id:affaire.id)}">
				<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'page_go.png', plugin: 'famfamfam')}' />
			</a>
		</div>
		<h2>${affaire.name}</h2>
		<span class="small">
			${affaire.owner.name} (${java.text.DateFormat.getDateInstance(java.text.DateFormat.FULL, java.util.Locale.FRANCE).format(affaire.dateCreated).capitalize()})
		</span>
		<br />
		<div id="address">
			${affaire.description.replace("\\n","<br/>")}
		</div>
	</div>
</div>