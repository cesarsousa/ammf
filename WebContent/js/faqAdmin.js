
function visualizarFaqParaEdicao(uuid){
	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/adm/faq/editar",
		data: {"uuid" : uuid},
		success : function(json){
			
			$('#faqUuid').val(json.uuid);
			var dadosAutor = "Dados da Pergunta.<br/>Autor: " + json.nome + " (" + json.email + ").";
			$('#faqAutor').html('').html(dadosAutor);
			
			var dataDaPostagem = "Enviada em " + json.postagem.$;
			$('#faqPostagem').html('').html(dataDaPostagem);
			
			if(json.publica){
				$('#faqVisibilidade').html('').html('Pública').removeClass().addClass('Publica');
				
			}else{
				$('#faqVisibilidade').html('').html('Particular').removeClass().addClass('Particular');
			}
			
			$('#faqPergunta').html('').html(json.pergunta);
			
			$('#tabEditarFaq').slideDown(500);
			
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});	
}

function ajaxResponderFaq(){
	
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/adm/faq/resposta",
		data: {"uuid" : $('#faqUuid').val(), "resposta" : $('#areaRespostaFaq').val()},
		success : function(json){		
			var resultado = json.string;
			$('#msgResultadoRespostaFaq').html('').removeAttr('class').slideUp();
			
			$('#msgResultadoRespostaFaq').html(resultado);
			
			if(resultado.substring(0, 4) == "Erro"){
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgErro ponteiro closeClick');
			}else if (resultado.substring(0, 4) == "Avis"){
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgAlerta ponteiro closeClick');
			}else{
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgSucesso ponteiro closeClick');
			}
			
			$('#msgResultadoRespostaFaq').slideDown();			
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});
	
}

$(document).ready(function() {
	
	$('#telaAguardeAdmResponderFaq, #tabEditarFaq').hide();
		
	$('#btFaqNaoRespodidas').click(function (){
		$('#formFaqNaoRespondidas').submit();
	});
	
	$('#btFaqRespodidas').click(function (){
		$('#formFaqRespondidas').submit();
	});
	
	$('#btFaqTodas').click(function (){
		$('#formFaqTodas').submit();
	});
	
	addRemoveDestaque("#cadastroFaqNome");
	
	addRemoveDestaque("#areaRespostaFaq");
	$('#areaRespostaFaq').autoResize();	
	$('#areaRespostaFaq').keyup(function() {		
		limitarCaracteres('#areaRespostaFaq', '#contadorCaracterFaq', 2000);		  
	});
	
	$('#btResponderFaq').click(function (){
		ajaxResponderFaq();
	});
	
	
	
	$('#').toggle(function() {
		$('#').slideDown(1000);
	}, function() {
		$('#').slideUp(1000);
	});	
	
	$('#btCancelarFaq, #btFecharTabEditarFaq').click(function(){
		$('#tabEditarFaq').slideUp(500);
		$('#areaRespostaFaq').val('');		
	});	
	
	
	$('#smoothFaq').smoothScroll();
		
});
