<head>
<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
<link rel="shortcut icon"
	href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
<style type="text/css">
body{
	background-image: url("${fr.booness.Parameters.findByName('wallpaper').value}");
}
#wrapper{
	opacity:${fr.booness.Parameters.findByName('wallpaper-opacity').value};
}
</style>
<jq:resources/>
<jqui:resources themeCss="/Booness/css/jquery-ui/themes/custom-theme/jquery-ui-1.8.16.custom.css"/>
</head>

<body>
<g:if test="${flash.message}">
  		<g:render template="/layouts/message" model="${[message:message(code:flash.message, args:flash.args, default:flash.defaultMessage)]}"></g:render>
   </g:if>
	<div id='profile' style="opacity:0.9;border:medium solid #aaf;">
		<div class='inner'>
			<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
				<div class="login">
					<label for='username'>Utilisateur</label>
					<input type='text' class='text_' name='j_username' id='username' />
				</div>
				<div class="login">
					<label for='password'>Mot de Passe</label>
					<input type='password' class='text_' name='j_password' id='password' />
				</div>
				<div class="login">
					<input style="width:10%" type='checkbox' class='chk' name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if> />
					<label style="width:80%" for='remember_me'>Se souvenir de moi</label>
				</div>
				<div class="login">
					<input type='submit' value='Connection' />
				</div>
			</form>
		</div>
	</div>
<script type='text/javascript'>
<!--
(function(){
	document.forms['loginForm'].elements['j_username'].focus();
})();
// -->
</script>
</body>
