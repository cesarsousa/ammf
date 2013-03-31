
function visualizarTextoBlog(uuid){	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/cliente/texto",
		data:{"uuid" : uuid},
		success : function(json){		
			
			$('#textoblogData').html('').append(getDataFormatada(json.postagem.time));
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
	
	oTable = $('#example').dataTable({
		"bPaginate": true,
		"bJQueryUI": false,
		"sPaginationType": "full_numbers"
	});
	
	$('#textoModoLeitura').hide();
	
	
});
