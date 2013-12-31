
function cadastrarComentario(){
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
				$('#msgErroBlogCliente').html(json).slideDown(500);
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
				$('#textoblogConteudo').append("<p>" + paragrafos[i] + "</p>");
			}			
			
			$.ajax({
				type : 'GET',
				url : $('#contexto').val() + "/blog/cliente/texto/comentarios",
				data:{"uuid" : uuid},
				async: false,
				success : function(json){
					
					if(json.list.length > 0){
						
						$('#divVisualizarComentários').show();
						$('#divComentariosBlog').html('');
						for(var i = 0; i < json.list.length; i++){
							$('#divComentariosBlog').append(
							'<div>' +
							'<ul style="list-style: none;">' +
							'<li><p class="azulClaro negrito" style="font-size: large;">' + json.list[i].nome + '</p></li>' +
							'<li>' +
								'<ul style="list-style: none;">' +
									'<li><p class="textoConteudoBlog">' + json.list[i].conteudo + '</p></li>' +
									'<li><p class="textoPostagemBlog aEsquerda negrito">... postado em ' + json.list[i].postagem.$ + '</p></li>' +
								'</ul>' +						
							'</li>' +									
							'</ul>' +
							'</div>');
						}						
						
					}else{
						$('#divVisualizarComentários').hide();
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
	
	addRemoveDestaque("#comentarTextoNome");
	addRemoveDestaque("#comentarTextoEmail");
	addRemoveDestaque("#comentarTextoConteudo");
	
	addRemoveDestaque("#comentarTextoNomePrincipal");
	addRemoveDestaque("#comentarTextoEmailPrincipal");
	addRemoveDestaque("#comentarTextoConteudoPrincipal");
	
	$('#comentarTextoConteudoPrincipal').keyup(function() {		
		limitarCaracteres('#comentarTextoConteudoPrincipal', '#contadorCaracterComentarTextoConteudoPrincipal', 999);		  
	});	
	
	$('#comentarTextoConteudo').keyup(function() {		
		limitarCaracteres('#comentarTextoConteudo', '#contadorCaracterComentarTextoConteudo', 999);		  
	});
	
	$('#divTodosTextos').hide();
	$('#divNovoComentarioBlogPrincipal, #divComentariosTextoPrincipal, #divNovoComentarioBlog, #divComentariosBlog, #msgErroBlogCliente').hide();
	
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
		cadastrarComentario();
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
