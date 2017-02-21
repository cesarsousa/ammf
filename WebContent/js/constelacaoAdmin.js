
function fecharCamposConstelacao(){
	$('#tabListagemConstelacao, #telaAguardeAdmConstelacaoCadastrar, #divAdmGerenciarConstelacao').hide();
}

function limparFormConstelacao(){
	$(":text").each(function () {
        $(this).val("");
    });
}

jQuery(document).ready(function() {
	
	//$('#modalEditarParticipante').modal('show');
	
	fecharCamposConstelacao();
	$('#tabListagemConstelacao').show();
		
	$('#btListarConstelacao').click(function(){
		fecharCamposConstelacao();
		$('#tabListagemConstelacao').slideDown(500);
	});
	
	if($('#flagListagemConstelacao').val()){
		$('#tabListagemConstelacao').show();
	}
	if($('#flagGerenciarConstelacao').val()){
		$('#divAdmGerenciarConstelacao').show();
		$('#tabListagemConstelacao').hide();
		
	}
	
	$('#telefoneParticipante, #editarTelefoneParticipante').mask('(99) 99999-9999');
	
	$('#btAddNovoConstelacao').click(function(){
		limparFormConstelacao();
	});
	
	
	$('#btCadastrarConstelacao').click(function(){
		abrirJanelaDeEspera("#divPgConstelacaoAdm", "#telaAguardeAdmConstelacaoCadastrar");
		$('#formCadastrarConstelacao').submit();
	});		
	
	$('#btCancelEditarParticipante').click(function(){		
		$('#divEditarParticipante').slideUp(500);		
	});
	
	$('#btFecharGerenciarConstelacao').click(function(){		
		$('#divAdmGerenciarConstelacao').slideUp(500);		
	});
			
});
