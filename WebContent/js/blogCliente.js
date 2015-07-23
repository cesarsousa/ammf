
function cadastrarComentarioBlog(){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/blog/cliente/comentario",
		data:{
			"uuidTextoBlog" : $('#uuidTextoBlog').val(),
			"comentarioNome" : $('#comentarTextoNome').val(),
			"comentarioEmail" : $('#comentarTextoEmail').val(),
			"comentarioConteudo" : $('#comentarTextoConteudo').val(),			
			},
		success : function(json){
			
			if(json == "OK"){
				$('#formBlogComentado').submit();
			}else{
				$('#msgErroPadraoBlogCliente').hide();
				$('#msgErroBlogCliente').html(json).show();
				$('html, body').animate({scrollTop:0}, 'slow');
			}			
		},
		error : function(){
			alert("Erro :( Não foi possível cadastrar o seu comentários!");				
		}
	});
	
}

function visualizarTextoBlog(uuid){	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/cliente/texto",
		data:{"uuid" : uuid},
		async: false,
		success : function(json){			
			$('#uuidTextoBlog').val(json.uuid);
			$('#textoblogData').html('').append("postado em " + json.postagem.$);
			$('#textoblogTitulo').html('').append(json.titulo);
			
			$('#textoblogConteudo').html('');
			var paragrafos = json.conteudo.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				if(paragrafos[i].length > 0){
					$('#textoblogConteudo').append("<p>" + paragrafos[i] + ".</p>");
				}
			}			
			
			$.ajax({
				type : 'GET',
				url : $('#contexto').val() + "/blog/cliente/texto/comentarios",
				data:{"uuid" : uuid},
				async: false,
				success : function(json){
					
					if(json.list.length > 0){
						
						$('#divVisualizarComentarios').show();
						$('#divComentariosBlog').html('');
						
						var contextoDasImagens = $('#imageContexto').val();
						
						for(var i = 0; i < json.list.length; i++){
							
							var urlDaImagem = contextoDasImagens + "/usuario_cinza.png";
							$('#divComentariosBlog').append(
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
						$('#divVisualizarComentarios').hide();
					}
					
				},
				error : function(){
					alert("Não foi possível carregar os comentários desse texto!");				
				}
			});		
			
			$('#textoModoLeitura').slideDown(1000);
			
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});	
}

function limparFormComentarioBlog(){
	$("#comentarTextoNome").val('');
	$("#comentarTextoEmail").val('');
	$("#comentarTextoConteudo").val('');
}

function limparFormComentarioBlogPrincipal(){
	$("#comentarTextoNomePrincipal").val('');
	$("#comentarTextoEmailPrincipal").val('');
	$("#comentarTextoConteudoPrincipal").val('');
}

$(document).ready(function() {
	
	$('#comentarTextoConteudoPrincipal').keyup(function() {		
		limitarCaracteres('#comentarTextoConteudoPrincipal', '#contadorCaracterComentarTextoConteudoPrincipal', 999);		  
	});	
	
	$('#comentarTextoConteudo').keyup(function() {		
		limitarCaracteres('#comentarTextoConteudo', '#contadorCaracterComentarTextoConteudo', 999);		  
	});
	
	$('#divTodosTextos').hide();
	$('#msgErroBlogCliente').hide();
	
	if($('#erroComentarioPrincipal').val() == "true"){
		$('#divNovoComentarioBlogPrincipal').show();		
	}
	
	$('#btNovoComentarioBlogPrincipal').toggle(function() {
		limparFormComentarioBlogPrincipal();
		$('#divNovoComentarioBlogPrincipal').slideDown(1000);
		$('#imgNovoComentarioBlogPrincipal').text('-');
	}, function() {
		$('#divNovoComentarioBlogPrincipal').slideUp(1000);
		$('#imgNovoComentarioBlogPrincipal').text('+');
	});
	
	$('#btdivComentariosTextoPrincipal').toggle(function() {
		limparFormComentarioBlogPrincipal();
		$('#divComentariosTextoPrincipal').slideDown(1000);
		$('#imgdivComentariosTextoPrincipal').text('-');
	}, function() {
		$('#divComentariosTextoPrincipal').slideUp(1000);
		$('#imgdivComentariosTextoPrincipal').text('+');
	});	
	
	$('#btNovoComentarioBlog').toggle(function() {
		limparFormComentarioBlog();
		$('#divNovoComentarioBlog').slideDown(1000);
		$('#imgNovoComentarioBlog').text('-');
	}, function() {
		$('#divNovoComentarioBlog').slideUp(1000);
		$('#imgNovoComentarioBlog').text('+');
	});
	
	$('#btdivComentariosBlog').toggle(function() {
		limparFormComentarioBlogPrincipal();
		$('#divComentariosBlog').slideDown(1000);
		$('#imgdivComentariosBlog').text('-');
	}, function() {
		$('#divComentariosBlog').slideUp(1000);
		$('#imgdivComentariosBlog').text('+');
	});	
	

	$('#btnClienteComentarTexto').click(function(){
		cadastrarComentarioBlog();
	});
	
	$('#btVisualizarTodos').toggle(function() {
		$('#ultimaPublicacao').slideUp(500);
		$('#divTodosTextos').slideDown(500);
		if($('#emailRequest').val()){
			$('#btVisualizarTodos').html('').append('Visualizar texto solicitado do email');
		}else{
			$('#btVisualizarTodos').html('').append('Visualizar ultima publica&ccedil;&atilde;o');
		}
		
	}, function() {
		$('#divTodosTextos').slideUp(500);
		$('#ultimaPublicacao').slideDown(500);
		$('#btVisualizarTodos').html('').append('Visualizar textos anteriores.');
	});	
	
	
	$('#textoModoLeitura').hide();
	$('#goTopo').smoothScroll();
	
});
