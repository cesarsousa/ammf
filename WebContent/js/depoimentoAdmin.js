
function ajaxDepoimentos(url, idTbody){
	
	$.ajax({
		type : 'GET',
		url : url,
		success : function(json){
			$(idTbody).html('');
			for(var i = 0; i< json.length; i++){
				var nome = json[i].autor;
				/*nome = nome.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");*/
				var email = json[i].email;
				/*email = email.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");*/
				
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
			
			/*if(json.length > 0) $(idTbody).slideDown(500);
			else $(idTbody).slideUp(500);	*/		
			
			/*var textoBuscado = $('#campoBuscaDepoimento').val();
			$('#campoBuscaDepoimento').attr("value", "");
			
			$('#labelResultadoConsulta').html('').html(json.length + ' ocorr&ecirc;ncia(s) para a pesquisa: ' + textoBuscado);*/
							
		},
		error : function(){
			alert("Servidor indisponivel no momento, por favor tente mais tarde!");				
		}
	});	
}


function hideAllDepoimentosFields(){
	$('#trAdmTodosDepoimentos').hide();
}

$(document).ready(function() {	
	hideAllDepoimentosFields();
	
	$('#btFecharDepoimentosPendentes').click(function(){
		$('#tabDepoimentosPendentes').slideUp(500);		
	});
	
	$('#campoBuscaDepoimento').puts('DIGITE O NOME DA PESSOA');
	addRemoveDestaque('#campoBuscaDepoimento');
	
	$('#btDepoimentoVerTodos').click(function(event){		
		event.preventDefault();
		$('#trAdmTodosDepoimentos').slideDown(1000);
		var url = $('#contexto').val() + "/adm/depoimentos/cadastrados";
		var idTbody = "#resultTodosDepoimentos";
		
		ajaxDepoimentos(url, idTbody);
	});
	$('#btFecharDepoimentoVerTodos').click(function(){		
		$('#trAdmTodosDepoimentos').slideUp(500);
	});
	
	/*<c:forEach items="${depoimentosSolicitados}" var="depoimento">
	<tr class="zebrado">
	<td class="infoTabela">${depoimento.autor}</td>
	<td class="infoTabela">${depoimento.email}</td>
	<td class="infoTabelaConteudo">${depoimento.conteudo}</td>
	<td class="infoTabelaData">${depoimento.dataFormatada}</td>
	<td class="infoTabela">${depoimento.status}</td>
	<td class="infoTabela" align="center">
		<a href="<c:url value="/menu/depoimentos/confirmar/${depoimento.uuid}" />"><img class="icone" alt="aceitar depoimento" title="aceitar depoimento" src="${imagem}/icone_confirmar.png"></a>
		<a href="<c:url value="/menu/depoimentos/excluir/${depoimento.uuid}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir depoimento" title="excluir depoimento" src="${imagem}/icone_excluir.png"></a>
	</td>
	</c:forEach>*/	
	
	$('#formBuscaDepoimento').submit(function(event){		
		
	});
	
	$('#btFecharDepoimentosSolicitados').click(function(){
		$('#tabDepoimentosSolicitados').slideUp(1000);
	});
	
	$('#btRemoverTodosDepoimentos').click(function(event){
		var decisao = confirm("Tem certeza que deseja excluir todos os depoimentos pendente confirmação?");
		if(!decisao){
			event.preventDefault();
		}		
	});
	
});
