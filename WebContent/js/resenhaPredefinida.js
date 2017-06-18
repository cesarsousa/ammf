
jQuery(document).ready(function() {
	
	$('#sizeSmallQuiron, #sizeMediumQuiron, #sizeLargeQuiron, #sizeXLargeQuiron, #sizeXxLargeQuiron').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Quiron","");		
		alterarTamanhoTexto(origem, '#campoConteudoQuiron');
	});
			
});
