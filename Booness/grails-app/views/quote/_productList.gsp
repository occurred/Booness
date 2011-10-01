<script type="text/javascript">
if(document.getElementById("product").value){
	document.getElementById("product").value=null;
}
</script>
<div id="address">
<div id="action">
		<g:formRemote name="addProductForm" url="[action:'removeProduct']" update="productList">
		 	<g:hiddenField name="code" value="${product.product.code}"/>
		 	<button title="Ajouter" name="ajouter">
		 		<img id="famfamfam" src='${resource(dir: 'images/icons', file: 'cross.png', plugin: 'famfamfam')}'/>
		 	</button>
		 </g:formRemote>
	</div>
 <strong>${product.quantity}</strong> X <strong>${product.product} ${product.product.description}</strong>
<br/>
${product.price} &euro;
</div>