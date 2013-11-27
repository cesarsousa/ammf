

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

function visualizarTextoResenha(uuid){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/cliente/texto",
		data:{"uuid" : uuid},
		success : function(json){		
			var srcImagem = $('#contexto').val() + "/resenha/visualizador/" + json.uuid;
			$('#imagemResenhaModoLeitura').attr("src", srcImagem);
			$('#resenhaData').html('').append("postada em " + json.postagem.$);
			$('#resenhaTitulo').html('').append(json.titulo);
			$('#resenhaAutor').html('').append(json.autor);
			$('#resenhaCategoria').html('').append(json.categoria.descricao);
			
			
			$('#resenhaConteudo').html('');
			var paragrafos = json.descricao.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				$('#resenhaConteudo').append("<p>" + paragrafos[i] + "</p>");
			}							
			
			$('#resenhaModoLeitura').slideDown(1000);			
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});	
}

$(document).ready(function() {	
		
	if($('#flagResenhasRequest').val()){		
		$('#divResenhasTop3, #btVisualizarOutrasResenhas').hide();		
		$('#divTodasAsResenhas, #btVisualizarUltimasResenhas').show;
	}else{
		$('#divTodasAsResenhas, #btVisualizarUltimasResenhas').hide();
		$('#divResenhasTop3, #btVisualizarOutrasResenhas').show;
	}
	
	$('#resenhaModoLeitura').hide();
	$('#goTopo').smoothScroll();
			
});
