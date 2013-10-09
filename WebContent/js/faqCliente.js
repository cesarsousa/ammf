
$(document).ready(function() {
	
	addRemoveDestaque("#cadastroFaqNome");
	addRemoveDestaque("#cadastroFaqEmail");
	addRemoveDestaque("#cadastroFaqPergunta");	
	
	$('#cadastroFaqPergunta').autoResize();
	$('#cadastroFaqPergunta').keyup(function() {		
		limitarCaracteres('#cadastroFaqPergunta', '#contadorCaracterFaq', 500);		  
	});
	
	
	$('#telaAguardeCadastroFaq').hide();	

	$('#divNovaPergunta').hide();	
	
	$('#btNovaPergunta').toggle(function() {
		$('#divNovaPergunta').slideDown(1000);
	}, function() {
		$('#divNovaPergunta').slideUp(1000);
	});	
	
	$('#btnClienteCadastrarFaq').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		abrirJanelaDeEspera("#divPgFaqCliente", "#telaAguardeCadastroFaq");
	});
	
	// codigos daqui para cima
	if($('#flagFaqErroCadastro').val() == "true"){
		$('#divNovaPergunta').show();		
	}	
});
