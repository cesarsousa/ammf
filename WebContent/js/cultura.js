
$(document).ready(function() { 

	$('#carouselCultura').infiniteCarousel({});
	
	$('#sizeSmall, #sizeMedium, #sizeLarge, #sizeXLarge, #sizeXxLarge').click(function(){
		alterarTamanhoTexto(this.id, '#textoLeituraCultura');			
	});
    
});