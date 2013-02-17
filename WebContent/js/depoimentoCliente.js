
$(document).ready(function() {
	
	addRemoveDestaque("#cadastroDepoimentoEmail");
	addRemoveDestaque("#cadastroDepoimentoNome");
	addRemoveDestaque("#cadastroDepoimentoTexto");	
		
	$('#cadastroDepoimentoEmail').puts("DIGITE O SEU EMAIL");
	$('#cadastroDepoimentoNome').puts("DIGITE O SEU NOME");
	$('#cadastroDepoimentoTexto').puts("DIGITE O SEU DEPOIMENTO");
	
	$('#telaAguardeCadastroDepoimento').hide();	

	$('#divNovoDepoimento').hide();
	$('#btNovoDepoimento').toggle(function() {
		$('#divNovoDepoimento').slideDown(500);
	}, function() {
		$('#divNovoDepoimento').slideUp(500);
	});	
	
	
	$('#btnClienteCadastrar').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		$('#nomeDoCliente').html($('#cadastroDepoimentoNome').val());	
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroDepoimento");
	});
	

	
	
	
});
