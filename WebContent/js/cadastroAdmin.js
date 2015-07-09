		
$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroCliente').hide();
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});		
	
	//**** BUSCA
	
	$('#tabBuscaPessoa').hide();
	$('#iconBuscaPessoa').click(function() {
		$('#tabPessoasSolicitadas').slideUp();
		$('#tabCadastrarPessoa').slideUp();
		$('#tabBuscaPessoa').slideDown();
	});	
	
	if($('#flagCampoBuscar').val()){
		$('#tabBuscaPessoa').slideDown();
	}
	
	$('#btFecharBuscaPessoa').click(function(){
		$('#tabBuscaPessoa').slideUp();		
	});	
	
	//****** CADASTRAR PESSOA
		
	$('#tabCadastrarPessoa').hide();
	if($('#flagCadastroPessoaVazio').val()){
		$('#tabCadastrarPessoa').slideDown();
	}
	$('#iconAddPessoa').click(function() {
		$('#tabBuscaPessoa').slideUp();
		$('#tabPessoasSolicitadas').slideUp();
		$('#tabCadastrarPessoa').slideDown();		
	});
	
	$('#btnCadastrarPessoa, #btConfirmarPessoa, #btNotificarPessoa').click(function(){
		$('#divAdmMsgCadCliente').slideUp();
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	$('#btFecharCadastrarPessoa').click(function(){
		$('#tabCadastrarPessoa').slideUp();		
	});
	
	//*** LISTAGEM DE PESSOAS SOLICITADAS	
		
	if($('#flagVisualizarPessoas').val()){
		$('#tabPessoasSolicitadas').slideDown();
	}
	
	$('#iconPessoasCadastradas').click(function() {
		$('#formListarPessoasCadastradas').submit();
	});
	
	$('#iconPessoasConfirmadas').click(function() {
		$('#formListarPessoasConfirmadas').submit();
	});
	
	$('#iconPessoasPendentes').click(function() {
		$('#formListarPessoasPendentes').submit();				
	});
	
	$('#btFecharPessoasSolicitadas').click(function(){
		$('#tabPessoasSolicitadas').slideUp();		
	});
});
