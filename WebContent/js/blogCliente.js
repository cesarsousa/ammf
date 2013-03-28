
function visualizarTextoBlog(titulo, conteudo, postagem){
	$('#textoblogTitulo').html(' ').append(titulo);
	$('#textoblogConteudo').html(' ').append(conteudo);
	$('#textoblogData').html(' ').append(postagem);
	$('#textoModoLeitura').slideDown(500);
}

$(document).ready(function() {
	
	oTable = $('#example').dataTable({
		"bPaginate": true,
		"bJQueryUI": false,
		"sPaginationType": "full_numbers"
	});
	
	$('#textoModoLeitura').hide();
	
	
});
