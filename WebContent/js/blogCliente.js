
function visualizarTextoBlog(uuid){	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/cliente/texto",
		data:{"uuid" : uuid},
		success : function(json){		
			
			$('#textoblogData').html('').append("postado em " + json.postagem.$);
			$('#textoblogTitulo').html('').append(json.titulo);
			
			$('#textoblogConteudo').html('');
			var paragrafos = json.conteudo.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				$('#textoblogConteudo').append("<p>" + paragrafos[i] + "</p>");
			}							
			
			$('#textoModoLeitura').slideDown(1000);
			/*$(btFechar).click(function(){
				$(divTabela).slideUp(1000);		
			});*/
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});
	
	/*$('#textoblogTitulo').html(' ').append(titulo);
	$('#textoblogConteudo').html(' ').append(conteudo);
	$('#textoblogData').html(' ').append(postagem);
	$('#textoModoLeitura').slideDown(500);*/
}

$(document).ready(function() {
	
	$('#divTodosTextos').hide();
	
	$('#btVisualizarTodos').toggle(function() {
		$('#ultimaPublicacao').slideUp(500);
		$('#divTodosTextos').slideDown(500);
		if($('#emailRequest').val()){
			$('#btVisualizarTodos').html('').append('Visualizar texto solicitado do email');
		}else{
			$('#btVisualizarTodos').html('').append('Visualizar ultima publica&ccedil;&otilde;es');
		}
		
	}, function() {
		$('#divTodosTextos').slideUp(500);
		$('#ultimaPublicacao').slideDown(500);
		$('#btVisualizarTodos').html('').append('Visualizar textos anteriores.');
	});	
	
	
	$('#textoModoLeitura').hide();
	$('#goTopo').smoothScroll();
	
});
