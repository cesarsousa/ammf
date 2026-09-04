
function visualizarFaqParaEdicao(uuid){
	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/adm/faq/editar",
		data: {"uuid" : uuid},
		success : function(json){
			
			$('#tabFaqsSolicitadas').slideUp(500);
			$('#faqRespondida').html('');
			$('#divCamposParaResposta').slideDown(500);
			
			
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
			$('#telaAguardeAdmResponderFaq').slideUp(500);
			var resultado = json.string;
			$('#msgResultadoRespostaFaq').html('').removeAttr('class').slideUp();
			
			$('#msgResultadoRespostaFaq').html(resultado);
			
			if(resultado.substring(0, 4) == "Erro"){
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgErro ponteiro closeClick');
			}else if (resultado.substring(0, 4) == "Avis"){
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgAlerta ponteiro closeClick');
			}else{
				$('#msgResultadoRespostaFaq').addClass('msgBorder msgSucesso ponteiro closeClick');
				configurarPerguntaRespondida($('#areaRespostaFaq').val());
			}
			
			$('#msgResultadoRespostaFaq').slideDown(500);			
		},
		error : function(){
			ajaxErroPadrao();		
		}
	});
	
}

function configurarPerguntaRespondida(resposta){
	$('#divCamposParaResposta').slideUp(500);
	$('#faqRespondida').html('<h3>' + resposta + '</h3');
}

$(document).ready(function() {
	
	$('#telaAguardeAdmResponderFaq, #tabEditarFaq').hide();
		
	$('#btFaqNaoRespodidas').click(function (){
		$('#tabEditarFaq').slideUp(500);
		$('#formFaqNaoRespondidas').submit();
	});
	
	$('#btFaqRespodidas').click(function (){
		$('#tabEditarFaq').slideUp(500);
		$('#formFaqRespondidas').submit();
	});
	
	$('#btFaqTodas').click(function (){
		$('#tabEditarFaq').slideUp(500);
		$('#formFaqTodas').submit();
	});
	
	$('#areaRespostaFaq').keyup(function() {		
		limitarCaracteres('#areaRespostaFaq', '#contadorCaracterFaq', 2000);		  
	});
	
	$('#btResponderFaq').click(function (){
		$('#telaAguardeAdmResponderFaq').slideDown(500);
		ajaxResponderFaq();
	});
	
	$('#btFecharFaqsSolicitadas').click(function (){
		$('#tabFaqsSolicitadas').slideUp(500);
	});	
	
	$('#sizeSmallFaq, #sizeMediumFaq, #sizeLargeFaq, #sizeXLargeFaq, #sizeXxLargeFaq').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Faq","");		
		alterarTamanhoTexto(origem, '#areaRespostaFaq');
	});
	
	$('#btCancelarFaq, #btFecharTabEditarFaq').click(function(){
		$('#tabEditarFaq').slideUp(500);
		$('#areaRespostaFaq').val('');		
	});	
	
	$('#smoothFaq').smoothScroll();
		
});
