
$(document).ready(function() {	
	
	$('#btFecharDepoimentosPendentes').click(function(){
		$('#tabDepoimentosPendentes').slideUp(500);		
	});
	
	$('#campoBuscaDepoimento').puts('DIGITE O NOME DA PESSOA');
	addRemoveDestaque('#campoBuscaDepoimento');
	
	
	/*$('#metadadoBuscaDepoimento').hide();*/
	/*$('#formBuscaDepoimento').submit(function(event){
		event.preventDefault();
		$('#conteudoConsultaPessoas').slideUp(500);
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/menu/busca/depoimento",
			data:{"paramConsulta" : $('#campoBuscaDepoimento').val()},
			success : function(json){
				$('#resultBuscaDepoimento').html('');
				for(var i = 0; i< json.length; i++){
					var nome = json[i].autor;
					nome = nome.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");
					var email = json[i].email;
					email = email.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");
					
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
					
					$('#resultBuscaDepoimento').append(
						'<tr class="zebrado">' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabelaConteudo">' + json[i].conteudo + '</td>' +
						'<td class="infoTabelaData">' + dataCadastro + '</td>' +
						'<td class="infoTabela ' + json[i].status + '">' + json[i].status + '</td>' +												
						'<td><a href="'+ linkRemover + '"><img class="ponteiro" alt="nao aceitar" src="../image/icone_excluir.png" width="20px" height="20px" title="nao aceitar"></a>' + tagConfirmacao + '</td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#metadadoBuscaDepoimento').show();
				else $('#metadadoBuscaDepoimento').hide();
				
				var textoBuscado = $('#campoBuscaDepoimento').val();
				$('#campoBuscaDepoimento').attr("value", "");
				
				$('#labelResultadoConsulta').html('').html(json.length + ' ocorr&ecirc;ncia(s) para a pesquisa: ' + textoBuscado);
								
			},
			error : function(){
				alert("Servidor indisponivel no momento, por favor tente mais tarde!");				
			}
		});
	});*/
	
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
