
function fecharCamposConstelacao(){
	$('#tabNovaConstelacao, #tabListagemConstelacao, #telaAguardeAdmConstelacaoCadastrar, #divAdmGerenciarConstelacao, #formIncluirParticipante').hide();
}

function limparFormConstelacao(){
	$(":text").each(function () {
        $(this).val("");
    });
}

jQuery(document).ready(function() {
	
	fecharCamposConstelacao();
	
	$('#btListarConstelacao').click(function(){
		fecharCamposConstelacao();
		$('#tabListagemConstelacao').slideDown(500);
	});
	$('#btFecharListagemConstelacao').click(function(){		
		$('#tabListagemConstelacao').slideUp(500);		
	});
	
	if($('#flagLinkConstelacaoCadastro').val()){
		$('#tabNovaConstelacao').show();
	}	
	if($('#flagListagemConstelacao').val()){
		$('#tabListagemConstelacao').show();
	}
	if($('#flagGerenciarConstelacao').val()){
		$('#divAdmGerenciarConstelacao').show();
	}
	
	$('#telefoneParticipante, #editarTelefoneParticipante').mask('(99) 99999-9999');
	
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
		$('#formCadastrarConstelacao').submit();
	});	
	
	$('#btIncluirParticipante').click(function(){		
		$('#formIncluirParticipante').slideDown(500);
		$('#edtConstelacaoCadPessoa').focus();
	});
	$('#btCancelCadastroParticipante').click(function(){		
		$('#formIncluirParticipante').slideUp(500);		
	});	
	
	$('#btCancelEditarParticipante').click(function(){		
		$('#divEditarParticipante').slideUp(500);		
	});
	
	$('#btFecharGerenciarConstelacao').click(function(){		
		$('#divAdmGerenciarConstelacao').slideUp(500);		
	});
			
});
