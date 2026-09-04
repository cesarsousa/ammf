

function hideAllResenhaFields(){
	$('#divResenhaBuscarTexto, #tabListagemResenhas, #telaAguardeAdmResenhaCadastrar, #telaAguardeAdmResenhaEditar, #tabComentariosResenhaAdmin, #divResenhaView').hide();
}

function removerMensagemResenha(){	
	$('#divMensagemResenha').html('');
}

function limparFormCadastroResenha(){
	$('#resenhaTitulo').val('');
	$('#resenhaAutor').val('');
	$('#resenhaUrl').val('');
	$('#textoDescricaoResenha').val('');
}

function abrirResenhaView(uuid){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/busca/view",
		data:{"uuid" : uuid},
		
		success : function(json){
			
			var urlImagemResenha = $('#contexto').val() + "/resenha/visualizador/" + uuid;
			$('#imgResenhaView').attr('src', urlImagemResenha);
			
			$('#divResenhaView').slideUp(500);
			$('#resenhaTituloView').text(json.titulo);
			$('#resenhaDataView').text("... postada em " + json.postagem.$);			
			$('#resenhaConteudoView').html('');
			var paragrafos = json.descricao.split(".");
			for(var i = 0; i < paragrafos.length; i++){
				$('#resenhaConteudoView').append("<p>" + paragrafos[i] + ".</p>");
			}	
						
			$('#divResenhaView').slideDown(500);							
		},
		error : function(){
			alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
		}
	});	
}

function visualizarTextoParaEdicao(uuid){	
}

function cadastrarNovaCategoriaResenha() {
	var categoria  = $('#inputCadastrarCategoriaResenha').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoriaResenha');
		ajaxResenhaCadastrar(categoria);
	}	
}

function cadastrarNovaCategoriaResenhaEdt() {
	var categoria  = $('#inputCadastrarCategoriaResenhaEdt').val();
	if(categoria == "Digite a categoria" || categoria == ""){
		alert("Digite a categoria");
	}else{
		abrirIconeAguarde('#iconeAguardeCadastrarCategoriaResenhaEdt');
		ajaxResenhaCadastrar(categoria);
	}	
}

function ajaxResenhaCadastrar(categoria){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/resenha/categoria/nova",
		data: {"categoria" : categoria},
		success : function(json){
			fecharIconeAguarde('#iconeAguardeCadastrarCategoriaResenha');
			fecharIconeAguarde('#iconeAguardeCadastrarCategoriaResenhaEdt');
			$('#divCadastrarCategoriaResenha, #divCadastrarCategoriaResenhaEdt').slideUp(500);
			
			if(json == "sucesso"){
				notificarSalvaDeCategoria();
			}else if(json == "erro"){
				notificarNaoSalvaDeCategoria();
			}
			
			listarCategoriasDeResenha();
			 listarCategoriasDeResenhaEdicao();
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function listarCategoriasDeResenha() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/categorias",
		success : function(json){
			$('#comboBoxCategoriasResenha').html('');			
			for(var i = 0; i < json.length; i++){
				$('#comboBoxCategoriasResenha').append('<option value="' + json[i].id + '">' + json[i].descricao + '</option>');
			}
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function listarCategoriasDeResenhaEdicao() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/categorias/edicao",
		data: {"id" : $('#resenhaCategoriaIdEdicao').val()},
		success : function(json){
			$('#comboBoxCategoriasResenhaEdt').html('');			
			for(var i = 0; i < json.length; i++){				
				$('#comboBoxCategoriasResenhaEdt').append('<option value="' + json[i].id + '">' + json[i].descricao + '</option>');
			}
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function listarCategoriasDeResenhaPredefinidas() {
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/resenha/categorias",
		success : function(json){
			$('#comboBoxCategoriasResenhaPredefinidas').html('');			
			for(var i = 0; i < json.length; i++){				
				$('#comboBoxCategoriasResenhaPredefinidas').append('<option value="' + json[i].id + '">' + json[i].descricao + '</option>');
			}
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}


$(document).ready(function() {
	
	hideAllResenhaFields();
	$('#tabListagemResenhas').show();
	
    $('.selectpicker').selectpicker({
        style: 'btn-info',
        size: 4
    });
    
	
    listarCategoriasDeResenha();
    listarCategoriasDeResenhaEdicao();
    listarCategoriasDeResenhaPredefinidas();
	
	
	$('#divCadastrarCategoriaResenha, #iconeAguardeCadastrarCategoriaResenha, #divCategoriaResenhaEdt').hide();
	$('#btCadastrarCategoriaResenha').click(function() {
		$('#divCadastrarCategoriaResenha').show();		
	});
	
	$('#ajaxCadastrarCategoriaResenha').click(function(){		
		cadastrarNovaCategoriaResenha();	
	});
		
	$('#btRemoverUploadFotoResenha').click(function(){
		$('#divUploadFotoResenha')
		.slideUp(500)
		.html('')
		.append('<input id="inputImagemResenha" type="file" name="imagemResenha"/>')
		.slideDown(500);
	});
	
	$('#btRemoverUploadNovaFotoResenha').click(function(){
		$('#divUploadNovaFotoResenha')
		.slideUp(500)
		.html('')
		.append('<input id="inputNovaImagemResenha" type="file" name="novaImagemResenha" style="background-color: #CCCCCC; width: 100%"/>')
		.slideDown(500);
	});
	
	$('#divCadastrarCategoriaResenhaEdt, #iconeAguardeCadastrarCategoriaResenhaEdt').hide();
	$('#btCadastrarCategoriaResenhaEdt').click(function() {
		$('#divCadastrarCategoriaResenhaEdt').show();		
	});
	
	$('#ajaxCadastrarCategoriaResenhaEdt').click(function(){		
		cadastrarNovaCategoriaResenhaEdt();	
	});
	
	$('#textoDescricaoResenha').keyup(function() {		
		limitarCaracteres('#textoDescricaoResenha', '#contadorCaracterResenha', 10000);
	});
	
	$('#textoDescricaoResenhaEdt').keyup(function() {		
		limitarCaracteres('#textoDescricaoResenhaEdt', '#contadorCaracterResenhaEdt', 10000);
	});
	
	$('#btCadastrarResenha').click(function() {
		$('#msgResenhaErroCadastro').slideUp(500);
		abrirJanelaDeEspera("#tableNovaResenha", "#telaAguardeAdmResenhaCadastrar");
	});
	$('#btEditarResenha').click(function() {
		$('#msgAtualizarResenha').slideUp(500);
		abrirJanelaDeEspera("#tableEditarResenha", "#telaAguardeAdmResenhaEditar");
	});
	
	$('#btCancelarEditarResenha, #btCancelarCadastroResenha').click(function() {
		$('#formMenuPrincipal').submit();
	});	
		
	if($('#flagBuscarResenhas').val()){		
		$('#divResenhaBuscarTexto').slideDown(500);
	}
	$('#btBuscarResenha').click(function(){
		hideAllResenhaFields();		
		$('#labelBuscaResenha').html('');
		$('#divResenhaBuscarTexto').slideDown(500);		
	});	
	$('#btFecharEdtResenha').click(function() {
		$('#divResenhaBuscarTexto').slideUp(500);
		$('#campoBuscaTxtResenha').val('');
		$('#labelBuscaResenha').html('');
	});
	
	if($('#flagListarResenhas').val()){		
		$('#tabListagemResenhas').slideDown(500);
	}
	$('#btListarResenhas').click(function(){
		$('#formResenhasListarTodas').submit();
	});
	$('#btResenhaFecharTextos').click(function(){		
		$('#tabListagemResenhas').slideUp(500);
	});	
	
	$('#sizeSmallResenha, #sizeMediumResenha, #sizeLargeResenha, #sizeXLargeResenha, #sizeXxLargeResenha').click(function(){		
		var idOrigem = this.id;
		var origem = idOrigem.replace("Resenha","");
		alterarTamanhoTexto(origem, '#textoDescricaoResenha');			
	});
	
	
	if($('#flagComentariosResenha').val()){
		$('#tabComentariosResenhaAdmin').show();
	}
	
	$('#btVerComentariosResenha').click(function(){
		hideAllResenhaFields();
		$('#formVerComentariosResenha').submit();
	});
	$('#btVerComentariosResenhaConfirmados').click(function(){
		hideAllResenhaFields();
		$('#formVerComentariosResenhaConfirmados').submit();
	});
	$('#btVerComentariosResenhaPendentes').click(function(){
		hideAllResenhaFields();
		$('#formVerComentariosResenhaPendentes').submit();
	});
	
	$('#btFecharComentariosResenha').click(function(){		
		$('#tabComentariosResenhaAdmin').slideUp(500);
	});
	
	$('#btFecharResenhaView').click(function(){		
		$('#divResenhaView').slideUp(500);
	});
	
});
