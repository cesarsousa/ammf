
// comando para desabilitar link durante envio de email
// $("a").click(function() { return false; });


function abrirJanelaDeEspera(idPagina, idJanelaEspera){
	$(idPagina).slideUp(500);
	$(idJanelaEspera).slideDown(500);
}

function limitarCaracteres(areaDeTexto, contador, totalCaracteres){	
	var valorDigitado = $(areaDeTexto).val();
	var totalDigitado = valorDigitado.length;		
		
	if(totalDigitado < totalCaracteres){
		var resto = totalCaracteres - totalDigitado;
		$(contador).html('').html(resto);
	}else{
		$(contador).html('').html('0');
		$(areaDeTexto).val(valorDigitado.substring(0, totalCaracteres-2));
	}	
}

function ehNumero(param){
	if(param == '1' || param == '2' || param == '3' || param == '4' || param == '5' || param == '6' || param == '7' || param == '8' || param == '9' || param == '0'){
		return true;
	}
	return false;
}

function somenteNumero(e){
	// escrever este evento no input do html onkeypress="return somenteNumero(event)"
	var tecla=(window.event)?event.keyCode:e.which;
	if((tecla>47 && tecla<58)) return true;
	else{
	if (tecla==8 || tecla==0) return true;
	else return false;
	}
}

function editarCampoNumerico(areaDeTexto){	
	var valorDigitado = $(areaDeTexto).val();
	var totalDigitado = valorDigitado.length;
	
	if (totalDigitado == 1 && ( valorDigitado == '0' || !ehNumero)){
		$(areaDeTexto).val('');
	}else{
		var str = new String(valorDigitado);
		var ultimoCaracter = str.substring(str.length -1, str.length);
		if(!ehNumero(ultimoCaracter)){
			var valorCorrigido = str.substring(0, str.length - 1);
			$(areaDeTexto).val(valorCorrigido);
		}
	}	
}

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

function confirmarExclusao(){
	return confirm("Tem certeza que deseja remover este registro?");	
}


$(document).ready(function() {
	
	/*$('#btNovoDepoimento').toggle(function() {
		$('#divNovoDepoimento').slideDown(1000);
	}, function() {
		$('#divNovoDepoimento').slideUp(1000);
	});*/
	
	$('.dataTable').dataTable({
		"bPaginate": true,
		"bJQueryUI": false,
		"sPaginationType": "full_numbers"
	});
	
	$('.closeClick').click(function(){
		$(this).fadeOut(1000);
	});
	
	$('#btLogout').click(function(){
		$('#formLogout').submit();
	});	
});
