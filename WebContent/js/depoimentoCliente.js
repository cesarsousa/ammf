
$(document).ready(function() {
	
	addRemoveDestaque("#cadastroClienteNome");
	addRemoveDestaque("#cadastroClienteEmail");
		
	$('#telaAguardeCadastroCliente').hide();	

	/*$('#btAbrirToolsCadastro').toggle(function() {
		$('#toolsAreaCadastro').slideDown(500);
	}, function() {
		$('#toolsAreaCadastro').slideUp(500);
	});	*/
	
	
	$('#btnClienteCadastrar').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		$('#nomeDoCliente').html($('#cadastroClienteNome').val());	
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroCliente");
	});
	

	$('#btMenuCliente').click(function(){
		$('#formMenuCliente').submit();	
	});
	
	
});
