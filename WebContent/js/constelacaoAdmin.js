
function fecharCamposConstelacao(){
	$('#tabNovaConstelacao, #tabListagemConstelacao, #telaAguardeAdmConstelacaoCadastrar, #divAdmGerenciarConstelacao, #formIncluirParticipante').hide();
}

function limparFormConstelacao(){
	$('#formCadastroConstelacao').each (function(){
		  this.reset();
	});
}

$(document).ready(function() {	
	
	fecharCamposConstelacao();
	
	if($('#flagLinkConstelacaoCadastro').val()){
		$('#tabNovaConstelacao').show();
	}
	if($('#flagListagemConstelacao').val()){
		$('#tabListagemConstelacao').show();
	}
	if($('#flagGerenciarConstelacao').val()){
		$('#divAdmGerenciarConstelacao').show();
	}
	
	$('#telefoneParticipante').mask('(99) 99999-9999');
	
	$('#btAddNovoConstelacao').click(function(){
		fecharCamposConstelacao();
		limparFormConstelacao();
		$('#tabNovaConstelacao').slideDown(500);
	});
	
	$('#btFecharAddConstelacao, #btCancelarConstelacao').click(function(){		
		$('#tabNovaConstelacao').slideUp(500);		
	});
	
	$('#btCadastrarConstelacao').click(function(){
		abrirJanelaDeEspera("#divPgConstelacaoAdm", "#telaAguardeAdmConstelacaoCadastrar");
	});
	
	$('#btListarConstelacao').click(function(){
		fecharCamposConstelacao();
		$('#tabListagemConstelacao').slideDown(500);
	});	
	
	$('#btFecharListagemConstelacao').click(function(){		
		$('#tabListagemConstelacao').slideUp(500);		
	});
	
	$('#btListarConstelacao').click(function(){
		fecharCamposConstelacao();
		$('#formListarConstelacao').submit();
	});	
	
	
	$('#btIncluirParticipante').click(function(){		
		$('#formIncluirParticipante').slideDown(500);		
	});
	$('#btCancelCadastroParticipante').click(function(){		
		$('#formIncluirParticipante').slideUp(500);		
	});
	
		
});
