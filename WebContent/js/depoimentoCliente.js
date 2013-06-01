
$(document).ready(function() {
	
	addRemoveDestaque("#cadastroDepoimentoEmail");
	addRemoveDestaque("#cadastroDepoimentoNome");
	addRemoveDestaque("#cadastroDepoimentoTexto");	
	
	$('#cadastroDepoimentoTexto').autoResize();
	$('#cadastroDepoimentoTexto').keyup(function() {		
		limitarCaracteres('#cadastroDepoimentoTexto', '#contadorCaracterDepoimento', 500);		  
	});
	
	
	$('#telaAguardeCadastroDepoimento').hide();	

	$('#divNovoDepoimento').hide();
	
	$('#btNovoDepoimento').hover(function() {
		$('#textoNovoDepoimento').slideDown(500);
	});
	
	$('#btNovoDepoimento').toggle(function() {
		$('#divNovoDepoimento').slideDown(1000);
	}, function() {
		$('#divNovoDepoimento').slideUp(1000);
	});	
	
	$('#btnClienteCadastrar').click(function(){
		$('#divMsgCadCliente').slideUp(500);
		$('#nomeDoCliente').html($('#cadastroDepoimentoNome').val());	
		abrirJanelaDeEspera("#divPgCadastroCliente", "#telaAguardeCadastroDepoimento");
	});	

	
	// codigos daqui para cima
	if($('#flagErroDepoimento').val() == "true"){
		$('#divNovoDepoimento').show();
		
	}	
});
