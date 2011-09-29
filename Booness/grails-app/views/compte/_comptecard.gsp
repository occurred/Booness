<div id="comptecard">

	<div id="address">
		<div id="action">
			<a href="${createLink(controller:'compte', action:'edit', id:compte.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
			<a href="${createLink(controller:'compte', action:'show', id:compte.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'application_go.png', plugin: 'famfamfam')}'/></a>	
		</div>
		<strong>${compte.name}</strong>
		<br/>
		<a target="_blank"
			href="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compte.street}+${compte.extra}+${compte.zip}+${compte.city}+France&amp;ie=UTF8">
			<img id="famfamfam"
			src='${resource(dir: 'images/icons', file: 'house.png', plugin: 'famfamfam')}' />
		</a>
		
		<span>
			${compte.zip} ${compte.city}
		</span>
		<br />
		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}' />
		<a href="tel:${compte.phone}"> ${compte.phone} </a>
		<br />
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}' />
			<a href="tel:${compte.fax}"> ${compte.fax} </a><br />
			
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}' />
			<a href="mailto:${compte.email}"> ${compte.email} </a><br />
		
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'world_link.png', plugin: 'famfamfam')}'/>
			<a target="_blank" href="${compte.website}">${compte.website}</a><br/>
			
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'user.png', plugin: 'famfamfam')}'/>
			<span id="numcontact">${compte.contacts.size()}</span>
			
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'page_white_text.png', plugin: 'famfamfam')}'/>
			<span id="numLog">${compte.logs.size()}</span>
			
			<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'money.png', plugin: 'famfamfam')}'/>
			<span id="numLog">${compte.affaires.size()}</span>
	
	</div>
</div>