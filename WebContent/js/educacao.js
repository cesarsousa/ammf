
$(document).ready(function() { 

	//$('#carouselEducacao').infiniteCarousel({});
	
	$('#sizeSmall, #sizeMedium, #sizeLarge, #sizeXLarge, #sizeXxLarge').click(function(){
		alterarTamanhoTexto(this.id, '#textoLeituraEducacao');			
	});
	
    
});