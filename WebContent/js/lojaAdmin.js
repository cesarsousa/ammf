


function cadastrarNovaCategoria() {
	var categoria  = $('#inputCadastrarCategoria').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoria');
		ajaxLivroCadastrar(categoria);
	}	
}

function cadastrarNovaCategoriaEdt() {
	var categoria  = $('#inputCadastrarCategoriaEdt').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoriaEdt');
		ajaxLivroCadastrar(categoria);		
	}	
}

function ajaxLivroCadastrar(categoria){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/livro/categoria/nova",
		data: {"categoria" : categoria},
		success : function(json){
			fecharIconeAguarde('#iconeAguardeCadastrarCategoria');
			fecharIconeAguarde('#iconeAguardeCadastrarCategoriaEdt');
			$('#divCadastrarCategoria, #divCadastrarCategoriaEdt').slideUp(500);
			
			if(json == "sucesso"){
				notificarSalvaDeCategoria();
			}else if(json == "erro"){
				notificarNaoSalvaDeCategoria();
			}
			
			listarCategoriasDeLivro();
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function listarCategoriasDeLivro() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/livro/categorias",
		success : function(json){
			$('#comboBoxCategoriasLivro, #comboBoxCategoriasLivroEdt').html('');			
			for(var i = 0; i < json.length; i++){				
				$('#comboBoxCategoriasLivro, #comboBoxCategoriasLivroEdt').append('<option value="' + json[i].id + '">' + json[i].descricao + '</option>');
			}					
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
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
	$('#tabCadastrarLivro, #tabLivrosSolicitadas, #tabAtualizarLivro').slideUp(500);
}

function fecharMsgLojaAdmin(){
	$('#mensagensPgLojaAdmin').slideUp(500).html('');
}

function configurarCamposAddLivro(){
	$("#livroPreco").maskMoney({thousands:'', decimal:'.'});
	$('#livroSinopse').keyup(function() {		
		limitarCaracteres('#livroSinopse', '#contadorCaracterLivro', 1000);
	});
	
	$('#livroPaginas').keyup(function() {		
		editarCampoNumerico('#livroPaginas');
	});
	
	$('#livroEdicao').keyup(function() {		
		editarCampoNumerico('#livroEdicao');
	});
	
	$('#livroAno').keyup(function() {		
		editarCampoNumerico('#livroAno');
	});
	
}

function configurarCamposAtualizaLivro(){
	$("#livroAtualizaPreco").maskMoney({symbol:'R$ ', showSymbol:false, thousands:'', decimal:'.', symbolStay: false});
	$('#livroAtualizaSinopse').keyup(function() {		
		limitarCaracteres('#livroAtualizaSinopse', '#contadorCaracterAtualizaLivro', 1000);
	});
	
	$('#livroAtualizaPaginas').keyup(function() {		
		editarCampoNumerico('#livroAtualizaPaginas');
	});
	
	$('#livroAtualizaEdicao').keyup(function() {		
		editarCampoNumerico('#livroAtualizaEdicao');
	});
	
	$('#livroAtualizaAno').keyup(function() {		
		editarCampoNumerico('#livroAno');
	});
}


$(document).ready(function() {
	listarCategoriasDeLivro();
	
	$('#divCadastrarCategoria, #iconeAguardeCadastrarCategoria').hide();
	$('#btCadastrarCategoria').toggle(function() {
		$('#divCadastrarCategoria').show();
	}, function() {
		$('#divCadastrarCategoria').hide();		
	});
	$('#ajaxCadastrarCategoria').click(function(){		
		cadastrarNovaCategoria();	
	});
	
	$('#divCadastrarCategoriaEdt, #iconeAguardeCadastrarCategoriaEdt').hide();
	$('#btCadastrarCategoriaEdt').toggle(function() {
		$('#divCadastrarCategoriaEdt').show();
	}, function() {
		$('#divCadastrarCategoriaEdt').hide();		
	});
	$('#ajaxCadastrarCategoriaEdt').click(function(){		
		cadastrarNovaCategoriaEdt();	
	});	
	
	configurarCamposAddLivro();
	configurarCamposAtualizaLivro();
	
	
	$('#telaAguardeAdmCadastroLivro').hide();
	$('#tabIconesLivros, #tabCadastrarLivro').hide();
	
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
		.append('<input id="inputImagemLivro" type="file" name="imagemLivro"/>')
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
	if($('#flagBuscarLivro').val()){
		$('#tabIconesLivros').slideDown(500);
	}
	/*$('#abrirBuscarEditarLivro').click(function(){
		fecharAreasDeLivros();
		fecharMsgLojaAdmin();	
		$('#tabBuscaLivro').slideDown(500);		
	});*/
	/*$('#btFecharBuscaLivro').click(function(){
		$('#tabBuscaLivro').slideUp(500);		
	});*/
	
	$('#btFecharLivrosSolicitados').click(function(){
		$('#tabLivrosSolicitadas').slideUp(500);		
	});
	
	$('#btFecharAtualizarLivro').click(function(){
		$('#tabAtualizarLivro').slideUp(500);		
	});
});