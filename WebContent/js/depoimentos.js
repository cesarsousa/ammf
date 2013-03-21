
$(document).ready(function() {	
	
	$('#btFecharDepoimentosPendentes').click(function(){
		$('#tabDepoimentosPendentes').slideUp(500);		
	});
	
	$('#campoBuscaDepoimento').puts('DIGITE O NOME DA PESSOA');
	addRemoveDestaque('#campoBuscaDepoimento');
	
	/*$('#conteudoConsultaPessoas').hide();*/
	$('#formBuscaDepoimento').submit(function(event){
		event.preventDefault();
		/*$('#conteudoConsultaPessoas').slideUp(500);*/
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/menu/busca/depoimento",
			data:{"paramConsulta" : $('#campoBuscaDepoimento').val()},
			success : function(json){
				$('#resultBuscaDepoimento').html('');
				for(var i = 0; i< json.length; i++){
					var nome = json[i].nome;
					nome = nome.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");
					var email = json[i].email;
					email = email.replace($('#campoBuscaDepoimento').val(),"<b>" + $('#campoBuscaDepoimento').val() + "</b>");
					
					var dataCadastro = getDataFormatada(json[i].dataCadastro.time);
					var linkRemover = $('#contexto').val() + "/pessoa/remover/" + json[i].uuid;
					
					$('#resultBuscaDepoimento').append(
						'<tr class="zebrado">' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabela">' + dataCadastro + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'<td><a href="'+ linkRemover + '"><img class="ponteiro" alt="remover" src="../image/icone_excluir.png" width="20px" height="20px" title="excluir esta pessoa"></a></td>' +
						'</tr>');						
				}
				
				/*if(json.length > 0) $('#conteudoConsultaPessoas').slideDown(1000);*/
				
				var textoBuscado = $('#campoBuscaDepoimento').val();
				$('#campoBuscaDepoimento').attr("value", "").focus();
				
				/*$('#labelResultadoConsulta').html('').html(json.length + ' ocorrência(s) para a pesquisa: ' + textoBuscado);*/
								
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});
	});
	
});
