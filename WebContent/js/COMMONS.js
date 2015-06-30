jQuery.fn.smoothScroll = function(){
	$(this).each(function(){
		var node = $(this);
		$(node).click(function(e){
			var anchor = $(this).attr('href');
			anchor = anchor.split("#");
			anchor = anchor[1];
			var t = 0;
			var found = false;
			var tName = 'a[name='+anchor+']';
			var tId = '#'+anchor;
			if (!!$(tName).length){
				t = $(tName).offset().top;
				if ($(tName).text() == ""){
					t = $(tName).parent().offset().top;
				}
				found = true;
			} else if(!!$(tId).length){
				t = $(tId).offset().top;
				found = true;
			}
			if (found){
				$("body, html").animate({scrollTop: t}, 500);
			}
			//e.preventDefault();
		});
	});
	var lAnchor = location.hash;
	if (lAnchor.length > 0){
		lAnchor = lAnchor.split("#");
		lAnchor = lAnchor[1];
		if (lAnchor.length > 0){
			$("body, html").scrollTop(0);
			var lt = 0;
			var lfound = false;
			var ltName = 'a[name='+lAnchor+']';
			var ltId = '#'+lAnchor;
			if (!!$(ltName).length){
				lt = $(ltName).offset().top;
				if ($(ltName).text() == ""){
					lt = $(ltName).parent().offset().top;
				}
				lfound = true;
			} else if(!!$(ltId).length){
				lt = $(ltId).offset().top;
				lfound = true;
			}
			if (lfound){
				$("body, html").animate({scrollTop: lt}, 500);
			}
		}
	}
};

function notificarSalvaDeCategoria(){
	$('#notificacaoSalvaCategoria').fadeIn().fadeOut(6000);
}

function notificarNaoSalvaDeCategoria(){
	$('#notificacaoNaoSalvaCategoria').fadeIn().fadeOut(6000);
}



function ajaxSalvaAutomatica(idElemento, url){	
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + url,
		data:{"texto" : $(idElemento).val()},
		success : function(json){
			$('#notificacaoSalvaAutomativa').fadeIn().fadeOut(5000);
		},
		error : function(){
			alert("Atencão! Não foi possível realizar a salva automática do texto, Utilize o botão atualizar para salvar o texto.");			
		}
	});	
}

function travarTextoParaEdicao(elemento){
	var jqueryId = "#" + elemento.id;
	if($(jqueryId).is(":checked")){
		var origem = elemento.id.replace("BtTravarTexto", "");
		var url = "/menu/" + origem + "/travar";
		$.ajax({
			type : 'POST',
			url : $('#contexto').val() + url,
			success : function(){
				$(jqueryId).attr("disabled", "disabled");
			},
			error : function(){
				alert("Atencao! Nao foi possivel realizar a travar do texto.");				
			}
		});	
	}	
}

function travarTextoBlogParaEdicao(elemento){
	var jqueryId = "#" + elemento.id;
	if($(jqueryId).is(":checked")){
		var url = "/blog/travar/" + elemento.id;
		$.ajax({
			type : 'POST',
			url : $('#contexto').val() + url,
			success : function(){
				$(jqueryId).attr("disabled", "disabled");
			},
			error : function(){
				alert("Atencao! Nao foi possivel realizar a travar do texto.");				
			}
		});	
	}	
}

// comando para desabilitar link durante envio de email
// $("a").click(function() { return false; });
function ajaxErroPadrao() {
	//alert("Servidor não esta disponível no momento, por favor tente mais tarde!");
}

function abrirIconeAguarde(elemento) {
	$(elemento).slideDown(500);
}
function fecharIconeAguarde(elemento){
	$(elemento).hide();
}



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

function emConstrucao(){
	alert("pagina em desenvolvimento...");
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
	
	$("a[rel^='prettyPhoto']").prettyPhoto();
	
	$('.closeClick').click(function(){
		$(this).fadeOut(1000);
	});
	
	$('#btLogout').click(function(){
		$('#formLogout').submit();
	});	
});
