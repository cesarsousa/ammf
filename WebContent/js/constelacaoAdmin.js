
function fecharCamposConstelacao(){
	$('#tabNovaConstelacao, #tabListagemConstelacao, #telaAguardeAdmConstelacaoCadastrar').hide();
}

function limparFormConstelacao(){
	$('#linkUrl').val('');
	$('#linkAreaDescricao').val('');
}

$(document).ready(function() {	
	
	fecharCamposConstelacao();
	
	if($('#flagLinkConstelacaoCadastro').val()){
		$('#tabNovaConstelacao').show();
	}
	if($('#flagListagemConstelacao').val()){
		$('#tabListagemConstelacao').show();
	}
	
	
	
	$('#btAddNovoConstelacao').click(function(){
		fecharCamposConstelacao();
		//limparFormConstelacao();
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
	
		
});
