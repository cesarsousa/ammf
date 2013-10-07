

function ajaxPreencherAlgo(uuid){	
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
	});	*/
}

function ajaxCadastramento(categoria){
	/*$.ajax({
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
	});	*/
}

function visualizarTextoResenha(elemento){
	
	$('.hideTd').hide();
	var id = "#resenha" + elemento.id;
	$(id).slideDown(500);
}

function obterSubString50(texto){
	return texto.substring(0, 30) + "...";
}

function ajaxListarResenhasCliente() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/cliente/listar",
		success : function(json){
			$('#bodyResenhasCliente').html('');			
			for(var i = 0; i < json.length; i++){				
				$('#bodyResenhasCliente').append(
					'<tr class="zebrado">' +
						'<td class="infoTabela">' + json[i].categoria.descricao + '</td>' +
						'<td class="infoTabela metadado ponteiro" title="visualizar este texto">' +
						'<a id="' + json[i].uuid + '" class="infoTabela metadado" onclick="visualizarTextoResenha(this);"><b>' + json[i].titulo + '</b></a>' +
						'</td>' +
						'<td class="infoTabela" title="clique no titulo para ler texto completo">' + obterSubString50(json[i].descricao) + '</td>' + 
						'<td class="infoTabela"><b>' + json[i].postagem.$ + '</b></td>' +
						
					'</tr>' +
					'<tr>' +
						'<td colspan="4" id="resenha' + json[i].uuid + '" class="hideTd infoTabela titulo bordaPadrao paddingPadrao"><p class="infoTabela metadado">' + json[i].titulo + '<p>' + json[i].descricao + '</td>' +
					'</tr>'				
				);			
			}
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}


$(document).ready(function() {
	
	$('#divTodasAsResenhas').hide();
	
	$('#btVisualizarOutrasResenhas').toggle(function() {
		$('#divResenhasTop3').slideUp(500);
		ajaxListarResenhasCliente();
		$('#divTodasAsResenhas').slideDown(500);
		/*if($('#emailRequest').val()){
			$('#btVisualizarTodos').html('').append('Visualizar texto solicitado do email');
		}else{
			$('#btVisualizarTodos').html('').append('Visualizar ultima publica&ccedil;&atilde;o');
		}*/
		$('#btVisualizarOutrasResenhas').html('').append('Visualizar ultimas publica&ccedil;&atilde;os');
		
	}, function() {
		alert("fazer novo reload");
		$('#divResenhasTop3').slideDown(500);
		$('#divTodasAsResenhas').slideUp(500);
		$('#btVisualizarOutrasResenhas').html('').append('Visualizar resenhas anteriores');
	});	
			
});
