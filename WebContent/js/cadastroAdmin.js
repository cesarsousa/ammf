		
$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroCliente').hide();
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});		
	
	//****** CADASTRAR PESSOA
	
	$('#btnCadastrarPessoa, #btConfirmarPessoa, #btNotificarPessoa').click(function(){
		$('#divAdmMsgCadCliente').slideUp();
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	//*** LISTAGEM DE PESSOAS SOLICITADAS	
	
	$('#iconPessoasCadastradas').click(function() {
		$('#formListarPessoasCadastradas').submit();
	});
	
	$('#iconPessoasConfirmadas').click(function() {
		$('#formListarPessoasConfirmadas').submit();
	});
	
	$('#iconPessoasPendentes').click(function() {
		$('#formListarPessoasPendentes').submit();				
	});
	
});
