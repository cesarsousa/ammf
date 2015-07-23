
function hideAllBlogFields(){
	$('#tdNovoBlog, #blogAreaBusca, #resultBuscaTxtBlog, #divBlogEditarTexto, #divEditarBlogTodosTextos, #telaAguardeAdmBlogCadastrar, #tabComentariosAdmin, #divTextoView').hide();
}

function ajaxAtualizarTextoBlog(uuid, url, conteudo){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + url,
		data:{
			"uuid" : uuid,
			"conteudo" : conteudo},		
		error : function(){
			alert("Servidor nao esta disponivel no momento, nao foi possivel atualizar '" + conteudo + "'");				
		}
	});	
}

function abrirTextoView(uuid){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/blog/busca/texto/view",
		data:{"uuid" : uuid},
		success : function(json){
			$('#divTextoView').slideUp(500);
			$('#textoTituloView').text(json.titulo);
			$('#textoDataView').text(json.postagem.$);
			
			$('#textoConteudoView').html('');
			var paragrafos = json.conteudo.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				$('#textoConteudoView').append("<p>" + paragrafos[i] + ".</p>");
			}	
						
			$('#divTextoView').slideDown(500);							
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});	
}

$(document).ready(function() {
	
	var caracteresNovoTexto = 0;
	$('#blogConteudoNovoTexto').keyup(function() {		
		limitarCaracteres('#blogConteudoNovoTexto', '#contadorCaracterNovoBlog', 20000);
		
		caracteresNovoTexto++;
		if(caracteresNovoTexto == 100){				
			caracteresNovoTexto = 0;
			ajaxSalvaAutomatica("#blogConteudoNovoTexto", "/blog/salvaAutomativa/" + $('#uuidNovoBlog').val());
		}
	});
	
	var caracteresTexto = 0;
	$('#blogEdtConteudoTexto').keyup(function() {		
		limitarCaracteres('#blogEdtConteudoTexto', '#contadorCaracterEdtBlog', 20000);
		
		caracteresTexto++;
		if(caracteresTexto == 100){				
			caracteresTexto = 0;
			ajaxSalvaAutomatica("#blogEdtConteudoTexto", "/blog/salvaAutomativa/" + $('#blogEdtUuidTexto').val());
		}
	});
	
	hideAllBlogFields();
	
	$('#btAbrirTextoTrava').click(function() {
		$('#infoTravaTexto').slideDown(500);		
	});
	$('#btFecahrTextoTrava').click(function() {
		$('#infoTravaTexto').slideUp(500);		
	});	
		
	if($('#flagTextosblog').val()){
		$('#divEditarBlogTodosTextos').show();
	}
	
	if($('#flagCadastrarBlogVazio').val()){
		$('#tdNovoBlog').slideDown(500);
	}
	if($('#flagCadastrarNovoBlog').val()){
		$('#tdNovoBlog').slideDown(500);
	}
	$('#btAddTextoBlog').click(function() {
		hideAllBlogFields();
		$('#tdNovoBlog').slideDown(500);		
	});
	$('#btFecharAddTextoBlog').click(function() {
		$('#tdNovoBlog').slideUp(500);		
	});	
	$('#btAddTextoBlog').click(function() {
		$('#formBlogNovoTexto').submit();		
	});
	
	$('#blogTituloNovoTexto').blur(function(){
		ajaxAtualizarTextoBlog($('#uuidNovoBlog').val(), '/blog/novo/titulo', $('#blogTituloNovoTexto').val());
	});
	
	$('#blogAutorNovoTexto').blur(function(){
		ajaxAtualizarTextoBlog($('#uuidNovoBlog').val(), '/blog/novo/autor', $('#blogAutorNovoTexto').val());
	});
	
	$('#blogEdtTituloTexto').blur(function(){
		ajaxAtualizarTextoBlog($('#blogEdtUuidTexto').val(), '/blog/novo/titulo', $('#blogEdtTituloTexto').val());
	});
	
	$('#blogEdtAutorTexto').blur(function(){
		ajaxAtualizarTextoBlog($('#blogEdtUuidTexto').val(), '/blog/novo/autor', $('#blogEdtAutorTexto').val());
	});	
	
	
	if($('#flagAbrirEdicaoTexto').val()){
		$('#divBlogEditarTexto').show();
	}
	
	if($('#flagComentariosBlog').val()){
		$('#tabComentariosAdmin').show();
	}

	$('#btBlogCancelNovoTexto').click(function(){
		$('#tdNovoBlog').slideUp(500);		
	});
	
	$('#btCadBlogTexto, #btCadEdtTexto').click(function() {		
		abrirJanelaDeEspera("#divPgBlogAdmin", "#telaAguardeAdmBlogCadastrar");	
	});
	
	$('#blogAreaBusca').hide();
	if($('#flagBuscarBlog').val()){		
		$('#blogAreaBusca').slideDown(500);
	}
	$('#btEdtTextoBlog').click(function(){
		hideAllBlogFields();
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
	
	$('#btVerComentarios').click(function(){
		hideAllBlogFields();
		$('#formVerComentariosBlog').submit();
	});
	$('#btVerComentariosConfirmados').click(function(){
		hideAllBlogFields();
		$('#formVerComentariosBlogConfirmados').submit();
	});
	$('#btVerComentariosPendentes').click(function(){
		hideAllBlogFields();
		$('#formVerComentariosBlogPendentes').submit();
	});
	
	$('#btFecharComentarios').click(function(){		
		$('#tabComentariosAdmin').slideUp(500);
	});
	
	$('#btFecharTextoView').click(function(){		
		$('#divTextoView').slideUp(500);
		$('#textoTituloView').text('');
		$('#textoDataView').text('');
		$('#textoConteudoView').text('');
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
	
	$('#goTextoView').smoothScroll();	
	
});
