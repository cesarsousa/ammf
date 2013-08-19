
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
	
	showIdResenha(false);
}

function showIdResenha(visualizarId){
	if(visualizarId) $('#divIdResenha').show();
	else $('#divIdResenha').hide();	
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


$(document).ready(function() {
	
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
		showIdResenha(false);
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
		//$('#tabNovaResenha').slideUp(500);
		$('#tabEditarResenha').slideDown(500);		
		showIdResenha(true);
	}
	$('#btCancelarEditarResenha').click(function() {
		$('#tabEditarResenha').slideUp(500);
		removerMensagemResenha();
	});
	
	
	
	/*$('#btCadBlogTexto, #btCadEdtTexto').click(function() {		
		abrirJanelaDeEspera("#divPgBlogAdmin", "#telaAguardeAdmBlogCadastrar");	
	});*/
	
	
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
	}); //continuar daki
		
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
