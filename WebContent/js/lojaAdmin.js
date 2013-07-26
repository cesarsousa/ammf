
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
      alert("Tipo de arquivo da capa do livro inválido.\nSó são permitidos arquivos de fotos nos formatos: " + extensoes_permitidas.join());
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
	
	$('#btRemoverUploadFotoLivro').click(function(){
		$('#divUploadFotoLivro')
		.slideUp(500)
		.html('')
		.append('<input id="inputImagemLivro" type="file" name="imagemLivro" style="background-color: #CCCCCC; width: 100%"/>')
		.slideDown(500);
	});	
	
	$('#abrirBuscarEditarLivro').click(function(){
		fecharAreasDeLivros();
		$('#tabBuscaLivro').slideDown(500);		
	});
	$('#btFecharBuscaLivro').click(function(){
		$('#tabBuscaLivro').slideUp(500);		
	});
	
});