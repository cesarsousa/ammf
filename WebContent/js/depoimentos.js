
$(document).ready(function() {	
	
	$('#btFecharDepoimentosPendentes').click(function(){
		$('#tabDepoimentosPendentes').slideUp(500);		
	});
	
	$('#campoBuscaDepoimento').puts('DIGITE O NOME DA PESSOA');
	addRemoveDestaque('#campoBuscaDepoimento');	
});
