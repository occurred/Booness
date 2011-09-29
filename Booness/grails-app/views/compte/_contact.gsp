<div id="address">
	<div id="action">
		<a href="${createLink(controller:'contact', action:'edit', id:contact.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
		<a href="${createLink(controller:'contact', action:'show', id:contact.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'user_go.png', plugin: 'famfamfam')}'/></a>
	</div>
	
	${contact.name}<br/><span class="small">${contact.post}</span><br/>
	<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}'/>
	 ${contact.telephone}
	 <br/>
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'phone.png', plugin: 'famfamfam')}'/>
	 ${contact.mobile}
	 <br/> 
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/>
	 ${contact.fax}
	 <br/>
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}'/>
	<a href="mailto:${contact.email}">${contact.email}</a>
</div>