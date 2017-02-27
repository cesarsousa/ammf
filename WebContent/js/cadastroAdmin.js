		
$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroCliente').hide();
	$('#telaModalAguardeAdmCadastroCliente').hide();
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});		
	
	//****** CADASTRAR PESSOA
	
	$('#btConfirmarPessoa, #btNotificarPessoa').click(function(){
		$('#divAdmMsgCadCliente').slideUp();
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	$('#formCadastrarPessoa').submit(function(){
		abrirJanelaDeEspera("#divModalPgAdmCadastroCliente", "#telaModalAguardeAdmCadastroCliente");
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
