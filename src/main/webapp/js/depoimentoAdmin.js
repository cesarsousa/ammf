
function ajaxDepoimentos(url, idTbody){
	
	$.ajax({
		type : 'GET',
		url : url,
		success : function(json){
			$(idTbody).html('');
			for(var i = 0; i< json.length; i++){
				var nome = json[i].autor;
				var email = json[i].email;
				var dataCadastro = getDataFormatada(json[i].postagem.time);
				var linkRemover = $('#contexto').val() + "/menu/depoimentos/excluir/" + json[i].uuid;
				var tagConfirmacao;
				var confirmado = json[i].status == "CONFIRMADO" ? true : false;
				if(confirmado){
					tagConfirmacao = '';
				}else{
					var linkconfirmar = $('#contexto').val() + "/menu/depoimentos/confirmar/" + json[i].uuid;
					tagConfirmacao = '<a href="'+ linkconfirmar + '"><img class="ponteiro" alt="aceitar" src="../image/icone_confirmar.png" width="20px" height="20px" title="aceitar"></a>';
				}
				
				$(idTbody).append(
					'<tr class="zebrado">' +
					'<td class="infoTabelaConteudo">' + nome + '</td>' +
					'<td class="infoTabelaConteudo">' + email + '</td>' +
					'<td class="infoTabelaConteudo">' + json[i].conteudo + '</td>' +
					'<td class="infoTabela">' + dataCadastro + '</td>' +
					'<td class="infoTabela ' + json[i].status + '">' + json[i].status + '</td>' +												
					'<td><a href="'+ linkRemover + '" onclick="return confirmarExclusao()"><img class="ponteiro" alt="nao aceitar" src="../image/icone_excluir.png" width="20px" height="20px" title="nao aceitar"></a>' + tagConfirmacao + '</td>' +
					'</tr>');						
			}
			
			$(idTbody).slideDown(500);
							
		},
		error : function(){
			alert("Servidor indisponivel no momento, por favor tente mais tarde!");				
		}
	});	
}


function hideAllDepoimentosFields(){
	$('#tabBuscaDepoimento').hide();
}

$(document).ready(function() {	
	hideAllDepoimentosFields();
	
	if($('#flagMostrarBusca').val()){
		$('#tabBuscaDepoimento').show();
	}
	$('#btBuscaDepoimento').click(function() {
		$('#tabDepoimentosCadastrados').slideUp(500);
		$('#tabBuscaDepoimento').slideDown(500);
	});
	
	$('#btFecharDepoimentosSolicitados').click(function(){
		$('#tabDepoimentosCadastrados').slideUp(500);
	});
	
	var texto = "Digite parte do nome ou email da pessoa e pressione a tecla ENTER";
	$('#campoBuscaDepoimento').puts(texto);
	
	$('#btFecharBuscarDepoimentos').click(function(){
		$('#tabBuscaDepoimento').slideUp(500);
	});
	
	$('#btDepoimentoVerTodos').click(function(){
		$('#formDepoimentoVerTodos').submit();
	});
	
	$('#btDepoimentosConfirmados').click(function(){
		$('#formDepoimentosConfirmados').submit();
	});
	
	$('#btDepoimentosPendentes').click(function(){
		$('#formDepoimentosPendentes').submit();
	});	
	
});
