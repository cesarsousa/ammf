
$(document).ready(function() { 

	$('#carouselArtesOrientais').infiniteCarousel({});
	
	$('#sizeSmall, #sizeMedium, #sizeLarge, #sizeXLarge, #sizeXxLarge').click(function(){
		alterarTamanhoTexto(this.id, '#textoLeituraArtesOrientais');			
	});
    
});