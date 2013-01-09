
function ajaxGet(url, ulTabela, divTabela, btFechar){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + url,
		success : function(json){
			$(ulTabela).html('');
			for(var i = 0; i< json.length; i++){				
				var dataCadastro = getDataFormatada(json[i].dataCadastro.time);				
				$(ulTabela).append(
					'<tr>' +
					'<td class="infoTabela">' + json[i].nome + '</td>' +
					'<td class="infoTabela">' + json[i].email + '</td>' +
					'<td class="infoTabela">' + dataCadastro + '</td>' +
					'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
					'</tr>');						
			}			
			
			$(divTabela).slideDown(1000);
			$(btFechar).click(function(){
				$(divTabela).slideUp(1000);		
			});
		},
		error : function(){
			alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
		}
	});	
}


$(document).ready(function() {	
	
	addRemoveDestaque("#pessoaNome");
	addRemoveDestaque("#pessoaEmail");
	addRemoveDestaque("#campoBusca");
	
	
	$('#toolsAreaCadastro').hide();	

	$('#btAbrirToolsCadastro').toggle(function() {
		$('#toolsAreaCadastro').slideDown(500);
	}, function() {
		$('#toolsAreaCadastro').slideUp(500);
	});	
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera($('#contexto').val() + "/telaAguarde.html");
	});
	
	$('#conteudoConsultaPessoas').hide();
	$('#formBuscaPessoa').submit(function(event){
		event.preventDefault();
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
					
					var dataCadastro = getDataFormatada(json[i].dataCadastro.time);
										
					$('#ulConsultadas').append(
						'<tr>' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabela">' + dataCadastro + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#conteudoConsultaPessoas').slideDown(1000);
				
				var textoBuscado = $('#campoBusca').val();
				$('#campoBusca').attr("value", "").focus();
				
				$('#labelResultadoConsulta').html('').html(json.length + ' ocorrência(s) para a pesquisa: ' + textoBuscado);
								
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});	
		
	});
	$('#btFecharConsultaPessoas').click(function(){
		$('#conteudoConsultaPessoas').slideUp(1000);		
	});
	
	$('#conteudoPessoasCadastradas').hide();
	$('#btAbrirConteudoCadastradas').click(function(){		
		ajaxGet("/pessoa/listar", "#ulPessoas", "#conteudoPessoasCadastradas", "#btFecharConteudoCadastradas");					
	});
	
	$('#conteudoPessoasConfirmadas').hide();
	$('#btAbrirConteudoConfirmadas').click(function(){		
		ajaxGet("/pessoa/confirmadas", "#ulPessoasConfirmadas", "#conteudoPessoasConfirmadas", "#btFecharConteudoConfirmadas");					
	});	
	
	$('#conteudoPessoasPendentes').hide();
	$('#btAbrirConteudoPendentes').click(function(){		
		ajaxGet("/pessoa/pendentes", "#ulPessoasPendentes", "#conteudoPessoasPendentes", "#btFecharConteudoPendentes");					
	});	
});
