
function cadastrarNovaCategoria() {
	alert("ajak para cadastara");
}

function abrirJanelaDeEsperaCadastroLivro(){
	$('#mensagensPgLojaAdmin').slideUp(500);
	abrirJanelaDeEspera('#divPgAdmCadastroCliente', '#telaAguardeAdmCadastroLivro');
}


function verificarExtensao(formulario, arquivo) {
   extensoes_permitidas = new Array(".gif", ".jpg", ".png");
   
   permitida = true;
   
   if(arquivo){
	   extensao = (arquivo.substring(arquivo.lastIndexOf("."))).toLowerCase();
	   permitida = false;
	   for (var i = 0; i < extensoes_permitidas.length; i++) {
	      if (extensoes_permitidas[i] == extensao) {
	      permitida = true;
	      break;
	      }
	   }
   }
   
   if (!permitida) {
      alert("Tipo de arquivo da capa do livro inválido.\nSão permitidos somente arquivos de fotos nos formatos: " + extensoes_permitidas.join());
      return 0;
   }else{
	  abrirJanelaDeEsperaCadastroLivro();
      formulario.submit();
      return 1;
   } 
} 

function fecharAreasDeLivros(){
	$('#tabBuscaLivro, #tabCadastrarLivro, #tabLivrosSolicitadas').slideUp(500);
}

function fecharMsgLojaAdmin(){
	$('#mensagensPgLojaAdmin').slideUp(500).html('');
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

function configurarCamposAtualizaLivro(){
	addRemoveDestaque('#livroAtualizaAutor');
	addRemoveDestaque('#livroAtualizaTitulo');
	addRemoveDestaque('#livroAtualizaPreco');
	$("#livroAtualizaPreco").maskMoney({symbol:'R$ ', showSymbol:false, thousands:'', decimal:'.', symbolStay: false});
	addRemoveDestaque('#livroAtualizaSubtitulo');
	addRemoveDestaque('#livroAtualizaSinopse');
	$('#livroAtualizaSinopse').autoResize();
	$('#livroAtualizaSinopse').keyup(function() {		
		limitarCaracteres('#livroAtualizaSinopse', '#contadorCaracterAtualizaLivro', 1000);
	});
	addRemoveDestaque('#livroAtualizaEditora');
	addRemoveDestaque('#livroAtualizaIsbn');
	
	addRemoveDestaque('#livroAtualizaPaginas');
	$('#livroAtualizaPaginas').keyup(function() {		
		editarCampoNumerico('#livroAtualizaPaginas');
	});
	
	addRemoveDestaque('#livroAtualizaEdicao');
	$('#livroAtualizaEdicao').keyup(function() {		
		editarCampoNumerico('#livroAtualizaEdicao');
	});
	
	addRemoveDestaque('#livroAtualizaAno');
	$('#livroAtualizaAno').keyup(function() {		
		editarCampoNumerico('#livroAno');
	});
	addRemoveDestaque('#livroAtualizaAssunto');
	addRemoveDestaque('#livroAtualizaIdioma');
	addRemoveDestaque('#livroAtualizaCodigoBarra');
	addRemoveDestaque('#livroAtualizaLinkVenda');	
}

function configurarCamposBuscaLivro(){
	var texto = "Digite parte do nome do autor ou o título do livro e pressione a tecla ENTER";
	$('#campoBuscaLivro').puts(texto);
}

$(document).ready(function() {
	$('#divCadastrarCategoria, #iconeAguardeCadastrarCategoria').hide();
	$('#btCadastrarCategoria').toggle(function() {
		$('#divCadastrarCategoria').show();
		addRemoveDestaque('#inputCadastrarCategoria');
		$('#inputCadastrarCategoria').puts("Digite a categoria");
	}, function() {
		$('#divCadastrarCategoria').hide();		
	});
	$('#ajaxCadastrarCategoria').click(function(){
		$('#iconeAguardeCadastrarCategoria').slideDown(500);
		cadastrarNovaCategoria();
	
	});
	
	
	configurarCamposAddLivro();
	configurarCamposAtualizaLivro();
	configurarCamposBuscaLivro();
	
	$('#telaAguardeAdmCadastroLivro').hide();
	$('#tabIconesLivros, #tabBuscaLivro, #tabCadastrarLivro').hide();
	
	if($('#flagCadastroLivroVazio').val()){
		$('#tabIconesLivros, #tabCadastrarLivro').slideDown(500);		
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
	});
	$('#btFecharCadastrarLivro').click(function(){
		$('#tabCadastrarLivro').slideUp(500);				
	});
	
	$('#btRemoverUploadFotoLivro').click(function(){
		$('#divUploadFotoLivro')
		.slideUp(500)
		.html('')
		.append('<input id="inputImagemLivro" type="file" name="imagemLivro" style="background-color: #CCCCCC; width: 100%"/>')
		.slideDown(500);
	});
	
	$('#btRemoverUploadNovaFotoLivro').click(function(){
		$('#divUploadNovaFotoLivro')
		.slideUp(500)
		.html('')
		.append('<input id="inputNovaImagemLivro" type="file" name="imagemLivro" style="background-color: #CCCCCC; width: 100%"/>')
		.slideDown(500);
	});	
	
	$('#conteudoConsultaLivros').hide();
	addRemoveDestaque('#campoBuscaLivro');
	if($('#flagBuscarLivro').val()){
		$('#tabIconesLivros, #tabBuscaLivro').slideDown(500);
	}
	$('#abrirBuscarEditarLivro').click(function(){
		fecharAreasDeLivros();
		fecharMsgLojaAdmin();	
		$('#tabBuscaLivro').slideDown(500);		
	});
	$('#btFecharBuscaLivro').click(function(){
		$('#tabBuscaLivro').slideUp(500);		
	});
	
	$('#btFecharLivrosSolicitados').click(function(){
		$('#tabLivrosSolicitadas').slideUp(500);		
	});
	
	$('#btFecharAtualizarLivro').click(function(){
		$('#tabAtualizarLivro').slideUp(500);		
	});
	
	
});