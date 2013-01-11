
var alertWindow;

function abrirJanelaDeEspera(idPagina, idJanelaEspera){
	$(idPagina).slideUp(500);
	$(idJanelaEspera).slideDown(500);
	
	//var esquerda = (screen.width - 550)/2;
	//var topo = (screen.height - 250)/2;
	//alertWindow = window.open(html, "bookpixWin","width=550, height=250, top=" + topo + ", left=" + esquerda);	
}

/*function fecharJanelaDeEspera(){
	$('#telaAguardeMenu').slideUp(500);
	$('#divPgMenu').slideDown(500);
	//alertWindow.close();
}*/

function addRemoveOpacidade(link, imagem){
	$(link).hover(
			function(){$(imagem).removeClass('opacidade');},
			function(){$(imagem).addClass('opacidade');}
	);	
}

function addRemoveDestaque(elemento) {
	$(elemento).focus(function() {
		$(this).removeClass('bordaPadrao').addClass('destaque');
	});
	$(elemento).blur(function() {
		$(this).removeClass('destaque').addClass('bordaPadrao');
	});
}

function alterarTamanhoTexto(origem, destino) {
	switch (origem) {
		case 'sizeSmall':
			$(destino).css("font-size", "small");
			break;
		case 'sizeMedium':
			$(destino).css("font-size", "medium");
			break;
		case 'sizeLarge':
			$(destino).css("font-size", "large");
			break;
		case 'sizeXLarge':
			$(destino).css("font-size", "x-large");
			break;
		case 'sizeXxLarge':
			$(destino).css("font-size", "xx-large");
			break;		
	}
}

function alterarTamanhoAreaTexto(origem, destino) {	
	switch (origem) {
		case 'sizeSmallArea':
			$(destino).css("height", "200px");
			break;
		case 'sizeMediumArea':
			$(destino).css("height", "500px");
			break;
		case 'sizeLargeArea':
			$(destino).css("height", "750px");
			break;
		case 'sizeXLargeArea':
			$(destino).css("height", "1000px");
			break;
		case 'sizeXxLargeArea':
			$(destino).css("height", "1500px");
			break;
	}
}

function getDataFormatada(milisegundos){
	var data = new Date();
	data.setTime(milisegundos);
	
	return data.getDate() + "/" + (data.getMonth() + 1) + "/" + data.getFullYear() + " " 
	     + data.getHours() + ":" + data.getMinutes() + ":" + data.getMilliseconds();	
}

$(document).ready(function() {
	$('.closeClick').click(function(){
		$(this).fadeOut(1000);
	});
	
});
