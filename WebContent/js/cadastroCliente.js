
$(document).ready(function() {
	
	$('#divNotifClienteEmailJaCadastrado').hide();
	$('#btFormNotifClienteEmailJaCadastrado').click(function(){
		$('#campoEmailjaCadastrado').puts("Digite o email que deseja receber a mensagem");
		$('#divNotifClienteEmailJaCadastrado').slideDown(500);
	});
		
	$('#telaAguardeCadastroCliente').hide();	
	
	$('#btnClienteCadastrar').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		$('#nomeDoCliente').html($('#cadastroClienteNome').val());	
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroCliente");
		$("a").click(function() { return false; });
	});
	
	$('#formNotifClienteEmailJaCadastrado').submit(function(){
		$('#divNotifClienteEmailJaCadastrado, #btFormNotifClienteEmailJaCadastrado').slideUp(500);		
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroCliente");
		$("a").click(function() { return false; });
	});
	
});
