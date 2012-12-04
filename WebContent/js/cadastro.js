
$(document).ready(function() {
	
	var janelaHtml = $('#contexto').val() + "/telaAguarde.html";
	
	addRemoveDestaque("#pessoaNome");
	addRemoveDestaque("#pessoaEmail");
	addRemoveDestaque("#campoBusca");
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera(janelaHtml);
	});
	
	$('#conteudoConsultaPessoas').hide();
	$('#btIniciarBusca').click(function(){	
		$('#conteudoConsultaPessoas').slideUp(500);
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/pessoa/consulta",
			data:{"paramConsulta" : $('#campoBusca').val()},
			success : function(json){
				$('#ulConsultadas').html('');
				for(var i = 0; i< json.length; i++){
					var nome = json[i].nome;
					nome = nome.replace($('#campoBusca').val(),"<b>" + $('#campoBusca').val() + "</b>");
					var email = json[i].email;
					email = email.replace($('#campoBusca').val(),"<b>" + $('#campoBusca').val() + "</b>");
										
					$('#ulConsultadas').append(
						'<tr>' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#conteudoConsultaPessoas').slideDown(1000);					
				
				$('#labelResultadoConsulta').html('').html(json.length + ' ocorrência(s) para a pesquisa: ' + $('#campoBusca').val());
								
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});	
		
	});
	
	$('#conteudoPessoasCadastradas').hide();
	$('#btAbrirConteudoCadastradas').click(function(){		
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/pessoa/listar",
			success : function(json){
				$('#ulPessoas').html('');
				for(var i = 0; i< json.length; i++){					
					$('#ulPessoas').append(
						'<tr>' +
						'<td class="infoTabela">' + json[i].nome + '</td>' +
						'<td class="infoTabela">' + json[i].email + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'</tr>');						
				}				
				
				$('#conteudoPessoasCadastradas').slideDown(1000);
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});				
	});
	$('#btFecharConteudoCadastradas').click(function(){
		$('#conteudoPessoasCadastradas').slideUp(1000);		
	});
	
	$('#conteudoPessoasConfirmadas').hide();	
	$('#conteudoPessoasPendentes').hide();
	
	
	
});