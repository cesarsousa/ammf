
function visualizarFaqParaEdicao(uuid){
	alert("fazer ajax para editar " + uuid);
}

$(document).ready(function() {
	
	$('#telaAguardeAdmResponderFaq').hide();
		
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
	
	$('#').keyup(function() {		
		limitarCaracteres('#campo', '#contador', 500);		  
	});
	
	$('#').toggle(function() {
		$('#').slideDown(1000);
	}, function() {
		$('#').slideUp(1000);
	});	
	
	$('#').click(function(){
		$('#').slideUp(500);
		abrirJanelaDeEspera("#divPgAdmFaq", "#telaAguardeAdmResponderFaq");
	});	
	
	
	$('#smoothFaq').smoothScroll();
		
});
