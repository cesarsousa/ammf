
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
	$('#tabNovaResenha, #divResenhaBuscarTexto, #tabListagemResenhas, #telaAguardeAdmResenhaCadastrar').hide();
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
	$('').autoResize();
	
	hideAllResenhaFields();
	
	/*if($('#flagTextosblog').val()){
		$('#divEditarBlogTodosTextos').show();
	}*/
	
	
	$('#btCadastrarResenha').click(function() {
		abrirJanelaDeEspera("#divPgResenhaAdm", "#telaAguardeAdmResenhaCadastrar");
	});	
	
	if($('#resenhaErroCadastro').val()){
		$('#tabNovaResenha').slideDown(500);
	}
	$('#btAddNovaResenha').click(function() {
		hideAllResenhaFields();
		$('#tabNovaResenha').slideDown(500);		
	});
	$('#btFecharAddResenha').click(function() {
		$('#tabNovaResenha').slideUp(500);		
	});	

	$('#btCancelarResenha').click(function(){
		$('#blogTituloNovoTexto').val('');
		$('#blogConteudoNovoTexto').val('');
		$('#blogAutorNovoTexto').val('Alcindo Miguel Martins Filho');
		$('#tabNovaResenha').slideUp(500);		
	});
	
	/*$('#btCadBlogTexto, #btCadEdtTexto').click(function() {		
		abrirJanelaDeEspera("#divPgBlogAdmin", "#telaAguardeAdmBlogCadastrar");	
	});*/
	
	$('#divResenhaBuscarTexto').hide();	
	$('#btBuscarResenha').click(function(){
		hideAllResenhaFields();
		var texto = "Digite parte do título da resenha e pressione a tecla ENTER";
		$('#campoBuscaTxtResenha').puts(texto);
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
	
	$('#btListarResenhas').click(function(){
		$('#formResenhasListarTodas').submit();
	});
	$('#btResenhaFecharTextos').click(function(){		
		$('#tabListagemResenhas').slideUp(500);
	});
	
	
	
	/*$('#formBlogEditarTexto').submit(function(event){		
		if($('#blogEdtTituloTexto').val()== "" || $('#blogEdtAutorTexto').val()== "" || $('#blogEdtConteudoTexto').val()== ""){
			event.preventDefault();
			alert("Por favor digite o titulo, autor e o conteudo do texto antes de confirmar atualizacao !");
		}		
	});	*/
	
	$('#sizeSmallResenha, #sizeMediumResenha, #sizeLargeResenha, #sizeXLargeResenha, #sizeXxLargeResenha').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Resenha","");
		alterarTamanhoTexto(origem, '#textoDescricaoResenha');			
	});
	$('#sizeSmallAreaBlogNovo, #sizeMediumAreaBlogNovo, #sizeLargeAreaBlogNovo, #sizeXLargeAreaBlogNovo, #sizeXxLargeAreaBlogNovo').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("BlogNovo","");		
		alterarTamanhoAreaTexto(origem, '#blogConteudoNovoTexto');
	});
	
	$('#sizeSmallBlogEdit, #sizeMediumBlogEdit, #sizeLargeBlogEdit, #sizeXLargeBlogEdit, #sizeXxLargeBlogEdit').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("BlogEdit","");
		alterarTamanhoTexto(origem, '#blogEdtConteudoTexto');			
	});
	$('#sizeSmallAreaBlogEdit, #sizeMediumAreaBlogEdit, #sizeLargeAreaBlogEdit, #sizeXLargeAreaBlogEdit, #sizeXxLargeAreaBlogEdit').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("BlogEdit","");		
		alterarTamanhoAreaTexto(origem, '#blogEdtConteudoTexto');
	});
	
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
