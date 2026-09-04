
function hideAllLinkfields(){
	$('#telaAguardeAdmLinkCadastrar').hide();
}

function limparFormLink(){
	$('#linkUrl').val('');
	$('#linkAreaDescricao').val('');
}

$(document).ready(function() {
	
	hideAllLinkfields();
	if($('#flagListagemLink').val()){
		$('#tabListagemLinks').show();
	}	
	
	$('#linkUrl').keyup(function() {		
		limitarCaracteres('#linkUrl', '#contadorCaracterLinkUrl', 500);
	});
	
	$('#linkAreaDescricao').keyup(function() {		
		limitarCaracteres('#linkAreaDescricao', '#contadorCaracterLink', 500);
	});
	
	
	$('#formNovoLink').submit(function(){
		abrirJanelaDeEspera("#divPgLinkAdm", "#telaAguardeAdmLinkCadastrar");
	});
	
	
	$('#btListarLinks').click(function(){
		hideAllLinkfields();
		$('#tabListagemLinks').slideDown(500);
	});	
	
	$('#btFecharListagemLinks').click(function(){		
		$('#tabListagemLinks').slideUp(500);		
	});
});
