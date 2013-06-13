
jQuery.fn.smoothScroll = function(){
	$(this).each(function(){
		var node = $(this);
		$(node).click(function(e){
			var anchor = $(this).attr('href');
			anchor = anchor.split("#");
			anchor = anchor[1];
			var t = 0;
			var found = false;
			var tName = 'a[name='+anchor+']';
			var tId = '#'+anchor;
			if (!!$(tName).length){
				t = $(tName).offset().top;
				if ($(tName).text() == ""){
					t = $(tName).parent().offset().top;
				}
				found = true;
			} else if(!!$(tId).length){
				t = $(tId).offset().top;
				found = true;
			}
			if (found){
				$("body, html").animate({scrollTop: t}, 500);
			}
			//e.preventDefault();
		});
	});
	var lAnchor = location.hash;
	if (lAnchor.length > 0){
		lAnchor = lAnchor.split("#");
		lAnchor = lAnchor[1];
		if (lAnchor.length > 0){
			$("body, html").scrollTop(0);
			var lt = 0;
			var lfound = false;
			var ltName = 'a[name='+lAnchor+']';
			var ltId = '#'+lAnchor;
			if (!!$(ltName).length){
				lt = $(ltName).offset().top;
				if ($(ltName).text() == ""){
					lt = $(ltName).parent().offset().top;
				}
				lfound = true;
			} else if(!!$(ltId).length){
				lt = $(ltId).offset().top;
				lfound = true;
			}
			if (lfound){
				$("body, html").animate({scrollTop: lt}, 500);
			}
		}
	}
};

function visualizarTextoBlog(uuid){	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/cliente/texto",
		data:{"uuid" : uuid},
		success : function(json){		
			
			$('#textoblogData').html('').append("postado em " + getDataFormatada(json.postagem.time));
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
		$('#btVisualizarTodos').html('').append('Visualizar ultima publicação');
	}, function() {
		$('#divTodosTextos').slideUp(500);
		$('#ultimaPublicacao').slideDown(500);
		$('#btVisualizarTodos').html('').append('Visualizar textos anteriores.');
	});	
	
	/*$('#btVisualizarTodos').click(function (){
		$('#ultimaPublicacao').slideUp(500);
		$('#divTodosTextos').slideDown(500);
	});*/
	
	
	$('#textoModoLeitura').hide();
	$('#goTopo').smoothScroll();
	
});
