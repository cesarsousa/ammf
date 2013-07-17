
function fecharAreasDeLivros(){
	//$('#tabBuscaLivro, #tabCadastrarLivro, #tabLivrosSolicitadas').slideUp(500);
}

$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroLivro').hide();
	//$('#tabIconesLivros, #tabBuscaLivro, #tabCadastrarLivro, #tabLivrosSolicitadas').hide();
	
	
	//$('#tabIconesLivros').hide();
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
		addRemoveDestaque('#livroAutor');
		addRemoveDestaque('#livroTitulo');
		addRemoveDestaque('#livroPreco');
		addRemoveDestaque('#livroSubtitulo');
		addRemoveDestaque('#livroSinopse');
		$('#livroSinopse').keyup(function() {		
			limitarCaracteres('#livroSinopse', '#contadorCaracterLivro', 1000);
		});
		addRemoveDestaque('#livroEditora');
		addRemoveDestaque('#livroIsbn');
		addRemoveDestaque('#livroPaginas');
		addRemoveDestaque('#livroEdicao');
		addRemoveDestaque('#livroAno');
		addRemoveDestaque('#livroAssunto');
		addRemoveDestaque('#livroIdioma');
		addRemoveDestaque('#livroCodigoBarra');
		addRemoveDestaque('#livroLinkVenda');
		
		
		
		
	});
	$('#btFecharCadastrarLivro').click(function(){
		$('#tabCadastrarLivro').slideUp(500);		
	});
	
	$('#abrirBuscarEditarLivro').click(function(){
		fecharAreasDeLivros();
		$('#tabBuscaLivro').slideDown(500);		
	});
	$('#btFecharBuscaLivro').click(function(){
		$('#tabBuscaLivro').slideUp(500);		
	});
	
});