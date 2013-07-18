
function fecharAreasDeLivros(){
	$('#tabBuscaLivro, #tabCadastrarLivro, #tabLivrosSolicitadas').slideUp(500);
}

function configurarCamposAddLivro(){
	addRemoveDestaque('#livroAutor');
	addRemoveDestaque('#livroTitulo');
	addRemoveDestaque('#livroPreco');
	$("#livroPreco").maskMoney({symbol:'R$ ', showSymbol:false, thousands:'', decimal:'.', symbolStay: false});
	addRemoveDestaque('#livroSubtitulo');
	addRemoveDestaque('#livroSinopse');
	$('#livroSinopse').autoResize();
	$('#livroSinopse').keyup(function() {		
		limitarCaracteres('#livroSinopse', '#contadorCaracterLivro', 1000);
	});
	addRemoveDestaque('#livroEditora');
	addRemoveDestaque('#livroIsbn');
	
	addRemoveDestaque('#livroPaginas');
	$('#livroPaginas').keyup(function() {		
		editarCampoNumerico('#livroPaginas');
	});
	
	addRemoveDestaque('#livroEdicao');
	$('#livroEdicao').keyup(function() {		
		editarCampoNumerico('#livroEdicao');
	});
	
	addRemoveDestaque('#livroAno');
	$('#livroAno').keyup(function() {		
		editarCampoNumerico('#livroAno');
	});
	addRemoveDestaque('#livroAssunto');
	addRemoveDestaque('#livroIdioma');
	addRemoveDestaque('#livroCodigoBarra');
	addRemoveDestaque('#livroLinkVenda');
}

$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroLivro').hide();
	$('#tabIconesLivros, #tabBuscaLivro, #tabCadastrarLivro, #tabLivrosSolicitadas').hide();
	
	if($('#flagCadastroLivroVazio').val()){
		$('#tabIconesLivros, #tabCadastrarLivro').slideDown(500);
		configurarCamposAddLivro();
	}
	
	$('#iconOpcaoLivro').click(function(){
		$('#tabIconesLivros').slideDown(500);
	});
	$('#fecharTabIconesLivros').click(function(){		
		fecharAreasDeLivros();
		$('#tabIconesLivros').slideUp(500);
	});
	
	$('#abrirAddLivro').click(function(){
		fecharAreasDeLivros();
		$('#tabCadastrarLivro').slideDown(500);
		configurarCamposAddLivro();		
	});
	$('#btFecharCadastrarLivro').click(function(){
		$('#tabCadastrarLivro').slideUp(500);		
	});
	
	$('#btnCadastrarPessoa').click(function(){
		$('#mensagensPgLojaAdmin').slideUp(500);
		abrirJanelaDeEspera('#divPgAdmCadastroCliente', '#telaAguardeAdmCadastroLivro');
	});
	
	$('#abrirBuscarEditarLivro').click(function(){
		fecharAreasDeLivros();
		$('#tabBuscaLivro').slideDown(500);		
	});
	$('#btFecharBuscaLivro').click(function(){
		$('#tabBuscaLivro').slideUp(500);		
	});
	
});