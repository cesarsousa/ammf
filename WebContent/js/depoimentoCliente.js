
$(document).ready(function() {
	
	addRemoveDestaque("#cadastroDepoimentoEmail");
	addRemoveDestaque("#cadastroDepoimentoNome");
	addRemoveDestaque("#cadastroDepoimentoTexto");	
		
	if($('#cadastroDepoimentoEmail').val() == "") $('#cadastroDepoimentoEmail').puts("DIGITE O SEU EMAIL");
	if($('#cadastroDepoimentoNome').val() == "") $('#cadastroDepoimentoNome').puts("DIGITE O SEU NOME");
	if($('#cadastroDepoimentoTexto').val() == "") $('#cadastroDepoimentoTexto').puts("DIGITE O SEU DEPOIMENTO");
	
	$('#cadastroDepoimentoTexto').autoResize();
	$('#cadastroDepoimentoTexto').keyup(function() {		
		limitarCaracteres('#cadastroDepoimentoTexto', '#contadorCaracterDepoimento', 500);		  
	});
	
	
	$('#telaAguardeCadastroDepoimento').hide();	

	$('#divNovoDepoimento').hide();
	$('#btNovoDepoimento').toggle(function() {
		$('#divDepoimentosCadastrados').slideUp(500);
		$('#divNovoDepoimento').slideDown(500);
	}, function() {
		$('#divNovoDepoimento').slideUp(500);
		$('#divDepoimentosCadastrados').slideDown(500);
	});	
	
	$('#btnClienteCadastrar').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		$('#nomeDoCliente').html($('#cadastroDepoimentoNome').val());	
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroDepoimento");
	});	

	
	// codigos daqui para cima
	if($('#flagErroDepoimento').val() == "true"){
		$('#divDepoimentosCadastrados').hide();
		$('#divNovoDepoimento').show();
		
	}	
});
