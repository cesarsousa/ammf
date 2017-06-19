
jQuery(document).ready(function() {
	
	$('#telaAguardeResenhaPredef').hide();
	
	$('#sizeSmallRespredef, #sizeMediumRespredef, #sizeLargeRespredef, #sizeXLargeRespredef, #sizeXxLargeRespredef').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Respredef","");		
		alterarTamanhoTexto(origem, '#textDescricaoResenhaPredef');
	});
	
	$('#btAtualizarResenhaPredef').click(function(){
		abrirJanelaDeEspera("#pgResenhaPredef", "#telaAguardeResenhaPredef");		
	});	
	
});
