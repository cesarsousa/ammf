
$(document).ready(function() { 

	$('#carouselPsicologia').infiniteCarousel({});
	
	$('#sizeSmall, #sizeMedium, #sizeLarge, #sizeXLarge, #sizeXxLarge').click(function(){
		alterarTamanhoTexto(this.id, '#textoLeituraPsicologia');			
	});	
    
});