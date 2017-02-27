
function hideAllLinkfields(){
	$('#tabNovoLink, #telaAguardeAdmLinkCadastrar').hide();
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
	
	$('#linkUrl').keyup(function() {		
		limitarCaracteres('#linkUrl', '#contadorCaracterLinkUrl', 500);
	});
	
	$('#linkAreaDescricao').keyup(function() {		
		limitarCaracteres('#linkAreaDescricao', '#contadorCaracterLink', 500);
	});
	
	$('#btAddNovoLink').click(function(){
		hideAllLinkfields();
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
		hideAllLinkfields();
		$('#tabListagemLinks').slideDown(500);
	});	
	
	$('#btFecharListagemLinks').click(function(){		
		$('#tabListagemLinks').slideUp(500);		
	});
});
