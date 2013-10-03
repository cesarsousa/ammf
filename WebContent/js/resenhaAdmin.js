
/*function ajaxGet(url, ulTabela, divTabela, btFechar){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + url,
		success : function(json){
			$(ulTabela).html('');
			for(var i = 0; i< json.length; i++){				
				var dataCadastro = getDataFormatada(json[i].dataCadastro.time);				
				$(ulTabela).append(
					'<tr>' +
					'<td class="infoTabela">' + json[i].nome + '</td>' +
					'<td class="infoTabela">' + json[i].email + '</td>' +
					'<td class="infoTabela">' + dataCadastro + '</td>' +
					'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
					'</tr>');						
			}			
			
			if(json.length > 0){
				$(divTabela).slideDown(1000);
				$(btFechar).click(function(){
					$(divTabela).slideUp(1000);		
				});
			}
		},
		error : function(){
			alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
		}
	});	
}*/

function hideAllResenhaFields(){
	$('#tabNovaResenha, #tabEditarResenha, #divResenhaBuscarTexto, #tabListagemResenhas, #telaAguardeAdmResenhaCadastrar').hide();
}

function removerMensagemResenha(){	
	$('#divMensagemResenha').html('');
}

function limparFormCadastroResenha(){
	$('#resenhaTitulo').val('');
	$('#resenhaAutor').val('');
	$('#textoDescricaoResenha').val('');
}

function visualizarTextoParaEdicao(uuid){	
	/*$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/visualizar/" + uuid,
		success : function(json){
			$('#blogEdtUuidTexto').val(json.uuid);
			$('#blogEdtTituloTexto').val(json.titulo);
			$('#blogEdtAutorTexto').val(json.autor);
			$('#blogEdtConteudoTexto').val(json.conteudo);
			
			$('#blogAreaBusca, #divBlogEditarTexto').slideDown(500);			
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});*/	
}

function cadastrarNovaCategoriaResenha() {
	var categoria  = $('#inputCadastrarCategoriaResenha').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoriaResenha');
		ajaxCadastar(categoria);
	}	
}

function cadastrarNovaCategoriaResenhaEdt() {
	var categoria  = $('#inputCadastrarCategoriaResenhaEdt').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoriaResenhaEdt');
		ajaxCadastar(categoria);
		
		/*
		 * fazer prepend da categoria atual
		 */
	}	
}

function ajaxCadastar(categoria){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/resenha/categoria/nova",
		data: {"categoria" : categoria},
		success : function(json){
			fecharIconeAguarde('#iconeAguardeCadastrarCategoriaResenha');
			fecharIconeAguarde('#iconeAguardeCadastrarCategoriaResenhaEdt');
			$('#divCadastrarCategoriaResenha, #divCadastrarCategoriaResenhaEdt').slideUp(500);
			$('#msgCadastrarCategoriaResenha, #msgCadastrarCategoriaResenhaEdt').html('').html(json).show().slideUp(5000);			
			listarCategoriasDeResenha();
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function listarCategoriasDeResenha() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/categorias",
		success : function(json){
			$('#comboBoxCategoriasResenha, #comboBoxCategoriasResenhaEdt').html('');			
			for(var i = 0; i < json.length; i++){				
				$('#comboBoxCategoriasResenha, #comboBoxCategoriasResenhaEdt').append('<option value="' + json[i].id + '">' + json[i].descricao + '</option>');
			}
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}


$(document).ready(function() {
	listarCategoriasDeResenha();
	
	$('#msgCadastrarCategoriaResenha, #divCadastrarCategoriaResenha, #iconeAguardeCadastrarCategoriaResenha').hide();
	$('#btCadastrarCategoriaResenha').toggle(function() {
		$('#divCadastrarCategoriaResenha').show();
		addRemoveDestaque('#inputCadastrarCategoriaResenha');
		$('#inputCadastrarCategoriaResenha').puts("Digite a categoria");
	}, function() {
		$('#divCadastrarCategoriaResenha').hide();		
	});
	$('#ajaxCadastrarCategoriaResenha').click(function(){		
		cadastrarNovaCategoriaResenha();	
	});
	
	$('#msgCadastrarCategoriaResenhaEdt, #divCadastrarCategoriaResenhaEdt, #iconeAguardeCadastrarCategoriaResenhaEdt').hide();
	$('#btCadastrarCategoriaResenhaEdt').toggle(function() {
		$('#divCadastrarCategoriaResenhaEdt').show();
		addRemoveDestaque('#inputCadastrarCategoriaResenhaEdt');
		$('#inputCadastrarCategoriaResenhaEdt').puts("Digite a categoria");
	}, function() {
		$('#divCadastrarCategoriaResenhaEdt').hide();		
	});
	$('#ajaxCadastrarCategoriaResenhaEdt').click(function(){		
		cadastrarNovaCategoriaResenhaEdt();	
	});
	
	addRemoveDestaque("#resenhaTitulo");
	addRemoveDestaque("#resenhaAutor");
	addRemoveDestaque("#textoDescricaoResenha");
	addRemoveDestaque("#campoBuscaTxtResenha");
	var texto = "Digite parte do título da resenha e pressione a tecla ENTER";
	$('#campoBuscaTxtResenha').puts(texto);
	$('').autoResize();
	
	hideAllResenhaFields();
	
	/*if($('#flagTextosblog').val()){
		$('#divEditarBlogTodosTextos').show();
	}*/
	
	
	$('#btCadastrarResenha, #btEditarResenha').click(function() {
		abrirJanelaDeEspera("#divPgResenhaAdm", "#telaAguardeAdmResenhaCadastrar");
	});	
	
	if($('#resenhaErroCadastro').val()){
		$('#tabNovaResenha').slideDown(500);
	}
	$('#btAddNovaResenha').click(function() {
		hideAllResenhaFields();
		removerMensagemResenha();
		limparFormCadastroResenha();
		
		$('#tabNovaResenha').slideDown(500);		
	});
	$('#btFecharAddResenha').click(function() {
		$('#tabNovaResenha').slideUp(500);		
	});	

	$('#btCancelarResenha').click(function(){
		$('#tabNovaResenha').slideUp(500);
		removerMensagemResenha();
		limparFormCadastroResenha();				
	});
	
	if($('#resenhaEditarCadastro').val()){
		$('#tabEditarResenha').slideDown(500);
	}
	$('#btCancelarEditarResenha').click(function() {
		$('#tabEditarResenha').slideUp(500);
		removerMensagemResenha();
	});	
		
	if($('#flagBuscarResenhas').val()){		
		$('#divResenhaBuscarTexto').slideDown(500);
	}
	$('#btBuscarResenha').click(function(){
		hideAllResenhaFields();		
		$('#labelBuscaResenha').html('');
		$('#divResenhaBuscarTexto').slideDown(500);		
	});	
	$('#btFecharEdtResenha').click(function() {
		$('#divResenhaBuscarTexto').slideUp(500);
		$('#campoBuscaTxtResenha').val('');
		$('#labelBuscaResenha').html('');
		//$('#resultBuscaTxtBlog').slideUp(500);
		//$('#divBlogEditarTexto').slideUp(500);
	});
	
	$('#btFecharEditarResenha').click(function() {
		$('#tabEditarResenha').slideUp(500);
	});
	
		
	/*$('#btBlogExcluirEdtTexto').click(function(){
		if(confirmarExclusao()){
			var action = $('#contexto').val() + "/blog/remover/" + $('#blogEdtUuidTexto').val();
			$('#formBtBlogExcluirEdtTexto').attr('action', action);
			$('#formBtBlogExcluirEdtTexto').submit();
		}
	});*/
	
	
	if($('#flagListarResenhas').val()){		
		$('#tabListagemResenhas').slideDown(500);
	}
	$('#btListarResenhas').click(function(){
		$('#formResenhasListarTodas').submit();
	});
	$('#btResenhaFecharTextos').click(function(){		
		$('#tabListagemResenhas').slideUp(500);
	});	
	
	$('#sizeSmallResenha, #sizeMediumResenha, #sizeLargeResenha, #sizeXLargeResenha, #sizeXxLargeResenha').click(function(){		
		var idOrigem = this.id;
		var origem = idOrigem.replace("Resenha","");
		alterarTamanhoTexto(origem, '#textoDescricaoResenha');			
	});
	
	
	/*$('#sizeSmallBlogEdit, #sizeMediumBlogEdit, #sizeLargeBlogEdit, #sizeXLargeBlogEdit, #sizeXxLargeBlogEdit').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("BlogEdit","");
		alterarTamanhoTexto(origem, '#blogEdtConteudoTexto');			
	});*/

	
	/*$('#formBlogBuscaTexto').submit(function(event){
		event.preventDefault();
		$('#resultBuscaTxtBlog').slideUp(500);
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/blog/busca/texto",
			data:{"paramConsulta" : $('#campoBuscaTxtEdtBlog').val()},
			success : function(json){
				$('#tabEdtTextoBlog').html('');
				for(var i = 0; i< json.length; i++){
					var nome = json[i].titulo;
					nome = nome.replace($('#campoBuscaTxtEdtBlog').val(),"<b>" + $('#campoBuscaTxtEdtBlog').val() + "</b>");
					var conteudo = 	json[i].conteudo.substring(0, 50);					
					var linkRemover = $('#contexto').val() + "/blog/remover/" + json[i].uuid;
					
					$('#tabEdtTextoBlog').append(
						'<tr class="zebrado">' +
						'<td class="headTabelaBlog2Info">' + json[i].postagem.$ + '</td>' +
						'<td class="headTabelaBlog1Info">' + nome + '</td>' +
						'<td class="headTabelaBlog1Info" title="'+ json[i].conteudo +'">' + conteudo + '</td>' +
						'<td>' +
							'<a id="linkPadrao" class="ponteiro" onclick="visualizarTextoParaEdicao(\'' + json[i].uuid + '\')"><img class="ponteiro" alt="editar" src="../image/iconeEditarHover.png" width="20px" height="20px" title="editar este texto"></a>' +
							'<a href="'+ linkRemover + '" onclick="return confirmarExclusao()"><img class="ponteiro" alt="remover" src="../image/icone_excluir.png" width="20px" height="20px" title="excluir este texto"></a>' +
					     	'</td>' +
						'</tr>');					
				}
				
				if(json.length > 0) $('#resultBuscaTxtBlog').slideDown(1000);
				
				var textoBuscado = $('#campoBuscaTxtEdtBlog').val();
				$('#campoBuscaTxtEdtBlog').attr("value", "").focus();
				
				$('#labelBuscaTexto').html('').html('<b>' + json.length + '</b> ocorrência(s) para a pesquisa: <b>' + textoBuscado + '</b>');
								
			},
			error : function(){
				alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
			}
		});	
		
	});	*/
});
