<script type="text/javascript">
if(document.getElementById("product").value){
	document.getElementById("product").value=null;
}
</script>
<div id="address">
<div id="action">
		<g:formRemote name="removeObjectifForm" url="[action:'removeObjectif']" update="objectifList">
		 	<g:hiddenField name="year" value="${objectif.year}"/>
		 	<g:hiddenField name="userid" value="${objectif.user.id}"/>
		 	<button title="Ajouter" name="ajouter">
		 		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'cross.png', plugin: 'famfamfam')}'/>
		 	</button>
		 </g:formRemote>
	</div>
 <strong>${objectif.year}</strong> : <strong>${objectif.ca}</strong>
</div>