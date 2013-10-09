

$(document).ready(function() {
	
	$('#telaAguardeAdmResponderFaq').hide();
	
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
		
});
