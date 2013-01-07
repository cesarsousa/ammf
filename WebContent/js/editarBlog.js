
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

function hideAllBlogFields(){
	$('#divBlogNovoTexto, #divBlogBuscarTexto, #resultBuscaTxtBlog, #divBlogEditarTexto').hide();
}

function visualizarTextoParaEdicao(uuid){	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/visualizar/" + uuid,
		success : function(json){
			$('#blogEdtUuidTexto').val(json.uuid);
			$('#blogEdtTituloTexto').val(json.titulo);
			$('#blogEdtAutorTexto').val(json.autor);
			$('#blogEdtConteudoTexto').val(json.conteudo);
			
			$('#divBlogEditarTexto').slideDown(500);			
		},
		error : function(){
			alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
		}
	});	
}


$(document).ready(function() {
	
	var janelaHtml = $('#contexto').val() + "/telaAguarde.html";	
	
	addRemoveDestaque("#campoBuscaTxtEdtBlog, #blogTituloNovoTexto, #blogAutorNovoTexto, #blogConteudoNovoTexto");
	addRemoveDestaque("#blogEdtTituloTexto, #blogEdtAutorTexto, #blogEdtConteudoTexto");
	$('#blogConteudoNovoTexto').autoResize();
	
	hideAllBlogFields();
	
	$('#btAddTextoBlog').click(function(){
		hideAllBlogFields();		
		$('#divBlogNovoTexto').slideDown(500);		
	});
	
	$('#btBlogCancelNovoTexto').click(function(){
		$('#blogTituloNovoTexto').val('');
		$('#blogConteudoNovoTexto').val('');
		$('#blogAutorNovoTexto').val('Alcindo Miguel Martins Filho');
		$('#divBlogNovoTexto').slideUp(500);		
	});
	
	$('#btEdtTextoBlog').click(function(){
		var texto = "Título do texto";
		$('#campoBuscaTxtEdtBlog').puts(texto);
		hideAllBlogFields();
		$('#tabEdtTextoBlog, #labelBuscaTexto').html('');
		$('#divBlogBuscarTexto').slideDown(500);		
	});
	$('#btFecharBuscaTextoBlog').click(function(){
		$('#campoBuscaTxtEdtBlog').val('');
		$('#tabEdtTextoBlog, #labelBuscaTexto').html('');
		$('#resultBuscaTxtBlog').slideUp(500);
		$('#divBlogBuscarTexto').slideUp(500);		
	});
	
	$('#btBlogCancelEdtTexto').click(function(){		
		$('#divBlogEditarTexto').slideUp(500);		
	});	
	
	$('#formBlogNovoTexto').submit(function(event){		
		if($('#blogTituloNovoTexto').val()== "" || $('#blogConteudoNovoTexto').val()== ""){
			event.preventDefault();
			alert("Por favor digite o título e o conteúdo do texto antes de cadastrar !");
		}		
	});
	
	$('#formBlogEditarTexto').submit(function(event){		
		if($('#blogEdtTituloTexto').val()== "" || $('#blogEdtAutorTexto').val()== "" || $('#blogEdtConteudoTexto').val()== ""){
			event.preventDefault();
			alert("Por favor digite o título, autor e o conteúdo do texto antes de confirmar atualização !");
		}		
	});
	
	$('#sizeSmallBlogNovo, #sizeMediumBlogNovo, #sizeLargeBlogNovo, #sizeXLargeBlogNovo, #sizeXxLargeBlogNovo').click(function(){
		alterarTamanhoTexto(this.id, '#blogConteudoNovoTexto');			
	});
	
	$('#sizeSmallBlogEdit, #sizeMediumBlogEdit, #sizeLargeBlogEdit, #sizeXLargeBlogEdit, #sizeXxLargeBlogEdit').click(function(){
		alterarTamanhoTexto(this.id, '#blogEdtConteudoTexto');			
	});
	
	$('#formBlogBuscaTexto').submit(function(event){
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
					var dataCadastro = getDataFormatada(json[i].postagem.time);
										
					$('#tabEdtTextoBlog').append(
						'<tr>' +
						'<td class="headTabelaBlog2Info">' + dataCadastro + '</td>' +
						'<td class="headTabelaBlog1Info"><a id="linkPadrao" class="ponteiro" onclick="visualizarTextoParaEdicao(\'' + json[i].uuid + '\')">' + nome + '</td>' +
						'<td class="headTabelaBlog1Info" title="'+ json[i].conteudo +'">' + conteudo + '</td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#resultBuscaTxtBlog').slideDown(1000);
				
				var textoBuscado = $('#campoBuscaTxtEdtBlog').val();
				$('#campoBuscaTxtEdtBlog').attr("value", "").focus();
				
				$('#labelBuscaTexto').html('').html('<b>' + json.length + '</b> ocorrência(s) para a pesquisa: <b>' + textoBuscado + '</b>');
								
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});	
		
	});	
});
