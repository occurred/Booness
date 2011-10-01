<div id="address">
	<div id="action">
		<a href="${createLink(controller:'compte', action:'edit', id:compte.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'pencil.png', plugin: 'famfamfam')}'/></a>
		<a href="${createLink(controller:'compte', action:'show', id:compte.id)}"><img id="famfamfam" src='${resource(dir: 'images/icons', file: 'application_go.png', plugin: 'famfamfam')}'/></a>
	</div>
	
	${compte.name}<br/>
	<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'telephone.png', plugin: 'famfamfam')}'/>
	 ${compte.phone}
	 <br/>
	  
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'printer.png', plugin: 'famfamfam')}'/>
	 ${compte.fax}
	 <br/>
	 
	 <img id="famfamfam" src='${resource(dir: 'images/icons', file: 'email.png', plugin: 'famfamfam')}'/>
	<a href="mailto:${compte.email}">${compte.email}</a>
	<br/>
	<a target="_blank"
			href="http://maps.google.com/maps?f=q&amp;source=s_q&amp;mrt=loc&amp;hl=fr&amp;geocode=&amp;q=${compte.street}+${compte.extra}+${compte.zip}+${compte.city}+France&amp;ie=UTF8">
			<img id="famfamfam"
			src='${resource(dir: 'images/icons', file: 'house.png', plugin: 'famfamfam')}' />
		</a>
		
		<span>
			${compte.zip} ${compte.city}
		</span>
</div>