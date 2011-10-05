<head>
<meta name='layout' content='main' />
<title>Login</title>
<style type='text/css' media='screen'>
</style>
<jq:resources/>
<jqui:resources themeCss="/Booness/css/jquery-ui/themes/custom-theme/jquery-ui-1.8.16.custom.css"/>
</head>

<body>
	<div id='profile'>
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
