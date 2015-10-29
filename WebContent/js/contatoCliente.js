
$(document).ready(function() {
	
	jQuery('#maximage').maximage();
	
	$('#telaAguardeContatoCliente').hide();
		
	$('#mapaGeoLocalizacao, #labelFecharMapa, #btFecharMapa').hide();
	$('#btAbrirMapa').click(function(){
		$('#mapaGeoLocalizacao').slideDown(500);
		$('#btAbrirMapa').slideUp(500);
		$('#btFecharMapa').slideDown(500);
	});
	$('#btFecharMapa').click(function(){
		$('#mapaGeoLocalizacao').slideUp(500);
		$('#btFecharMapa').slideUp(500);
		$('#btAbrirMapa').slideDown(500);
	});
	
	$('#mapaGeoLocalizacao').slideDown(500);
	
	$('#contatoEmailMensagem').keyup(function() {		
		limitarCaracteres('#contatoEmailMensagem', '#contadorCaracterContato', 500);		  
	});
	
	$('#btEnviarEmailContato').click(function(){
		$('#mensagemErroContato').slideUp(500);
		abrirJanelaDeEspera("#divPgContatoCliente", "#telaAguardeContatoCliente");
	});

});
