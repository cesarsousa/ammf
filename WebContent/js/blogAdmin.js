
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
	$('#tdNovoBlog, #blogAreaBusca, #resultBuscaTxtBlog, #divBlogEditarTexto, #divEditarBlogTodosTextos, #telaAguardeAdmBlogCadastrar').hide();
}

/*function visualizarTextoParaEdicao(uuid){
	alert("aqui");
	$.ajax({
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
	});	
}*/


$(document).ready(function() {
	
	addRemoveDestaque("#campoBuscaTxtEdtBlog, #blogTituloNovoTexto, #blogAutorNovoTexto, #blogConteudoNovoTexto");
	addRemoveDestaque("#blogEdtTituloTexto, #blogEdtAutorTexto, #blogEdtConteudoTexto");
	$('#blogConteudoNovoTexto').autoResize();
	
	hideAllBlogFields();
	
	if($('#flagTextosblog').val()){
		$('#divEditarBlogTodosTextos').show();
	}
	
	if($('#flagCadastrarBlogVazio').val()){
		$('#tdNovoBlog').slideDown(500);
	}
	$('#btAddTextoBlog').click(function() {
		hideAllBlogFields();
		$('#tdNovoBlog').slideDown(500);		
	});
	$('#btFecharAddTextoBlog').click(function() {
		$('#tdNovoBlog').slideUp(500);		
	});	
	
	if($('#flagAbrirEdicaoTexto').val()){
		$('#divBlogEditarTexto').show();
	}	

	$('#btBlogCancelNovoTexto').click(function(){
		$('#blogTituloNovoTexto').val('');
		$('#blogConteudoNovoTexto').val('');
		$('#blogAutorNovoTexto').val('Alcindo Miguel Martins Filho');
		$('#divBlogNovoTexto').slideUp(500);		
	});
	
	$('#btCadBlogTexto, #btCadEdtTexto').click(function() {		
		abrirJanelaDeEspera("#divPgBlogAdmin", "#telaAguardeAdmBlogCadastrar");	
	});
	
	$('#blogAreaBusca').hide();	
	$('#btEdtTextoBlog').click(function(){
		hideAllBlogFields();
		var texto = "Digite parte do título do texto e pressione a tecla ENTER";
		$('#campoBuscaTxtEdtBlog').puts(texto);
		$('#tabEdtTextoBlog, #labelBuscaTexto').html('');
		$('#blogAreaBusca').slideDown(500);		
	});	
	$('#btFecharEdtTextoBlog').click(function() {
		$('#blogAreaBusca').slideUp(500);
		$('#campoBuscaTxtEdtBlog').val('');
		$('#tabEdtTextoBlog, #labelBuscaTexto').html('');
		$('#resultBuscaTxtBlog').slideUp(500);
		$('#divBlogEditarTexto').slideUp(500);
	});
	$('#btFecharEdtEdtTextoBlog').click(function() {
		$('#divBlogEditarTexto').slideUp(500);		
	});
	
	$('#btBlogCancelEdtTexto').click(function(){		
		$('#divBlogEditarTexto').slideUp(500);		
	});
	
	$('#btBlogExcluirEdtTexto').click(function(){
		if(confirmarExclusao()){
			var action = $('#contexto').val() + "/blog/remover/" + $('#blogEdtUuidTexto').val();
			$('#formBtBlogExcluirEdtTexto').attr('action', action);
			$('#formBtBlogExcluirEdtTexto').submit();
		}
	});
	
	$('#btListarTextosBlog').click(function(){
		hideAllBlogFields();
		$('#formBlogListarTodos').submit();
	});
	$('#btBlogFecharTextos').click(function(){		
		$('#divEditarBlogTodosTextos').slideUp(500);
	});
	
	
	
	$('#formBlogEditarTexto').submit(function(event){		
		if($('#blogEdtTituloTexto').val()== "" || $('#blogEdtAutorTexto').val()== "" || $('#blogEdtConteudoTexto').val()== ""){
			event.preventDefault();
			alert("Por favor digite o titulo, autor e o conteudo do texto antes de confirmar atualizacao !");
		}		
	});	
	
	$('#sizeSmallBlogNovo, #sizeMediumBlogNovo, #sizeLargeBlogNovo, #sizeXLargeBlogNovo, #sizeXxLargeBlogNovo').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("BlogNovo","");
		alterarTamanhoTexto(origem, '#blogConteudoNovoTexto');			
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
					var linkRemover = $('#contexto').val() + "/blog/remover/" + json[i].uuid;
					var linkEditar = $('#contexto').val() + "/blog/editar/" + json[i].uuid;
					
					$('#tabEdtTextoBlog').append(
						'<tr class="zebrado">' +
						'<td class="headTabelaBlog2Info">' + json[i].postagem.$ + '</td>' +
						'<td class="headTabelaBlog1Info">' + nome + '</td>' +
						'<td class="headTabelaBlog1Info" title="'+ json[i].conteudo +'">' + conteudo + '</td>' +
						'<td>' +
							'<a href="'+ linkEditar + '"><img class="ponteiro" alt="editar" src="../image/iconeEditarHover.png" width="20px" height="20px" title="editar este texto"></a>' +
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
		
	});	
});
