

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

function cadastrarComentarioResenha(){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/resenha/cliente/novo/comentario",
		data:{
			"uuidResenhaView" : $('#uuidResenhaView').val(),
			"comentarioNome" : $('#comentarNovaResenhaNome').val(),
			"comentarioEmail" : $('#comentarNovaResenhaEmail').val(),
			"comentarioConteudo" : $('#comentarNovaResenhaConteudo').val(),			
			},
		success : function(json){
			
			if(json == "OK"){
				$('#formResenhaComentada').submit();
			}else{
				$('#msgErroResenhaCliente').html(json).slideDown(500);
				$('html, body').animate({scrollTop:0}, 'slow');
			}			
		},
		error : function(){
			alert("Erro :( Não foi possível cadastrar o seu comentários!");				
		}
	});
	
}

function cadastrarComentarioResenhaEmail(){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/resenha/cliente/novo/comentario",
		data:{
			"uuidResenhaView" : $('#uuidResenhaEmail').val(),
			"comentarioNome" : $('#comentarResenhaEmailNome').val(),
			"comentarioEmail" : $('#comentarResenhaEmailEmail').val(),
			"comentarioConteudo" : $('#comentarResenhaEmailConteudo').val(),			
			},
		success : function(json){
			
			if(json == "OK"){
				$('#formResenhaComentada').submit();
			}else{
				$('#msgErroResenhaCliente').html(json).slideDown(500);
				$('html, body').animate({scrollTop:0}, 'slow');
			}			
		},
		error : function(){
			alert("Erro :( Não foi possível cadastrar o seu comentário. Servidor indisponível!");				
		}
	});
	
}

function visualizarTextoResenha(uuid){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/cliente/texto",
		data:{"uuid" : uuid},
		async: false,
		success : function(json){		
			var srcImagem = $('#contexto').val() + "/resenha/visualizador/" + json.uuid;			
			
			$('#imagemResenhaModoLeitura').attr("src", srcImagem);
			$('#linkPrettyPhotoResenha').attr("href", srcImagem);			
			
			$('#uuidResenhaView').val(json.uuid);
			$('#resenhaData').html('').append("postada em " + json.postagem.$);
			$('#resenhaTitulo').html('').append(json.titulo);
			$('#resenhaAutor').html('').append(json.autor);
			$('#resenhaCategoria').html('').append(json.categoria.descricao);
			
			
			$('#resenhaConteudo').html('');
			var paragrafos = json.descricao.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				if(paragrafos[i].length > 0){
					$('#resenhaConteudo').append("<p>" + paragrafos[i] + ".</p>");
				}				
			}
			
			$.ajax({
				type : 'GET',
				url : $('#contexto').val() + "/resenha/cliente/comentarios",
				data:{"uuid" : uuid},
				async: false,
				success : function(json){
					
					if(json.list.length > 0){
						
						$('#divVisualizarComentariosResenha').show();
						$('#divComentariosResenha').html('');
						
						var contextoDasImagens = $('#imageContexto').val();
						
						for(var i = 0; i < json.list.length; i++){
							
							var urlDaImagem = contextoDasImagens + "/usuario_cinza.png";
							$('#divComentariosResenha').append(
							'<table>' +
							'<tr>' +
							'<td valign="top"><img src="' + urlDaImagem + '" class="icone50 ponteiro esquerda"></td>' +
							'<td valign="top">' +
								'<p class="azulClaro negrito" style="font-size: large;">' + json.list[i].nome + '</p>' +
								'<p class="textoConteudoBlog">' + json.list[i].conteudo + '</p>' +
								'<p class="textoPostagemBlog aEsquerda negrito">... postado em ' + json.list[i].postagem.$ + '</p>' +
							'</td>' +					
							'</tr>' +
							'</table>');
						}						
						
					}else{
						$('#divVisualizarComentariosResenha').hide();
					}
					
				},
				error : function(){
					alert("Não foi possível carregar os comentários desse texto!");				
				}
			});			
			
			$('#resenhaModoLeitura').slideDown(1000);
			hideResenhafields();
			limparFormComentarioResenha();
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});	
}

function limparFormComentarioResenha(){
	$("#comentarResenhaNomePrincipal").val('');
	$("#comentarResenhaEmailPrincipal").val('');
	$("#comentarResenhaConteudoPrincipal").val('');
	
	$("#comentarNovaResenhaNome").val('');
	$("#comentarNovaResenhaEmail").val('');
	$("#comentarNovaResenhaConteudo").val('');
}

function hideResenhafields(){
	//$('#divComentariosResenhaPrincipal, #divNovoComentarioResenhaPrincipal, #divComentariosResenha, #divNovoComentarioResenha, #msgErroResenhaCliente').hide();
	$('#msgErroResenhaCliente').hide();
}

$(document).ready(function() {
	
	hideResenhafields();
	
	if($('#erroComentarioPrincipal').val() == "true"){
		$('#divNovoComentarioResenhaPrincipal').show();		
	}
	
	addRemoveDestaque("#comentarResenhaNomePrincipal");
	addRemoveDestaque("#comentarResenhaEmailPrincipal");
	addRemoveDestaque("#comentarResenhaConteudoPrincipal");
	
	addRemoveDestaque("#comentarResenhaEmailNome");
	addRemoveDestaque("#comentarResenhaEmailEmail");
	addRemoveDestaque("#comentarResenhaEmailConteudo");
		
	if($('#flagResenhasRequest').val()){		
		$('#divResenhasTop3, #btVisualizarOutrasResenhas').hide();		
		$('#divTodasAsResenhas, #btVisualizarUltimasResenhas').show;
	}else{
		$('#divTodasAsResenhas, #btVisualizarUltimasResenhas').hide();
		$('#divResenhasTop3, #btVisualizarOutrasResenhas').show;
	}
	
	$('#btViewComentariosResenhaPrincipal').toggle(function() {		
		$('#divComentariosResenhaPrincipal').slideDown(1000);
		$('#sinalComentariosResenhaPrincipal').text('-');
	}, function() {
		$('#divComentariosResenhaPrincipal').slideUp(1000);
		$('#sinalComentariosResenhaPrincipal').text('+');
	});
	
	$('#btNovoComentarioResenhaPrincipal').toggle(function() {
		limparFormComentarioResenha();
		$('#divNovoComentarioResenhaPrincipal').slideDown(1000);
		$('#sinalNovoComentarioResenhaPrincipal').text('-');
	}, function() {
		$('#divNovoComentarioResenhaPrincipal').slideUp(1000);
		$('#sinalNovoComentarioResenhaPrincipal').text('+');
	});	
		
	$('#comentarResenhaConteudoPrincipal').keyup(function() {		
		limitarCaracteres('#comentarResenhaConteudoPrincipal', '#contadorCaracterComentarResenhaConteudoPrincipal', 999);		  
	});	
	
	$('#btViewComentariosResenha').toggle(function() {
		$('#divComentariosResenha').slideDown(1000);
		$('#sinalComentariosResenha').text('-');
	}, function() {
		$('#divComentariosResenha').slideUp(1000);
		$('#sinalComentariosResenha').text('+');
	});	
	
	$('#btNovoComentarioResenha').toggle(function() {
		limparFormComentarioResenha();
		$('#divNovoComentarioResenha').slideDown(1000);
		$('#sinalNovoComentarioResenha').text('-');
	}, function() {
		$('#divNovoComentarioResenha').slideUp(1000);
		$('#sinalNovoComentarioResenha').text('+');
	});
	
	$('#divCategoriasResenha').hide();
	$('#divTiposCategoriasResenha').hover(function() {
		$('#divCategoriasResenha').slideDown();
	}, function() {
		$('#divCategoriasResenha').slideUp();
	});	
	
	$('#comentarNovaResenhaConteudo').keyup(function() {		
		limitarCaracteres('#comentarNovaResenhaConteudo', '#contadorCaracterComentarNovaResenhaConteudo', 999);		  
	});
	
	$('#comentarResenhaEmailConteudo').keyup(function() {		
		limitarCaracteres('#comentarResenhaEmailConteudo', '#contadorCaracterComentarResenhaEmailConteudo', 999);		  
	});			
	
	$('#btClienteComentarResenha').click(function(){
		cadastrarComentarioResenha();
	});
		
	$('#resenhaModoLeitura').hide();
	$('#goTopo').smoothScroll();
			
});
