
function hideAllLinkfields(){
	$('#tabNovoLink, #tabListagemLinks, #telaAguardeAdmLinkCadastrar').hide();
}

function limparFormLink(){
	$('#linkUrl').val('');
	$('#linkAreaDescricao').val('');
}

$(document).ready(function() {
	
	hideAllLinkfields();
	if($('#flagLinkErroCadastro').val()){
		$('#tabNovoLink').show();
	}
	if($('#flagListagemLink').val()){
		$('#tabListagemLinks').show();
	}
	
	
	addRemoveDestaque('#linkUrl');
	addRemoveDestaque('#linkAreaDescricao');
	$('#linkAreaDescricao').keyup(function() {		
		limitarCaracteres('#linkAreaDescricao', '#contadorCaracterLink', 500);
	});
	
	$('#btAddNovoLink').click(function(){
		limparFormLink();
		$('#tabNovoLink').slideDown(500);
	});
	
	$('#btCadastrarLink').click(function(){
		abrirJanelaDeEspera("#divPgLinkAdm", "#telaAguardeAdmLinkCadastrar");
	});
	
	$('#btFecharAddLink, #btCancelarLink').click(function(){		
		$('#tabNovoLink').slideUp(500);		
	});
	
	$('#btListarLinks').click(function(){
		$('#tabListagemLinks').slideDown(500);
	});	
	
	$('#btFecharListagemLinks').click(function(){		
		$('#tabListagemLinks').slideUp(500);		
	});
});
