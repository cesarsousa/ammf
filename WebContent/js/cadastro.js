
function ajaxGet(url, ulTabela, divTabela, btFechar){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + url,
		success : function(json){
			$(ulTabela).html('');
			for(var i = 0; i< json.length; i++){				
				var dataCadastro = getDataFormatada(json[i].dataCadastro.time);				
				$(ulTabela).append(
					'<tr class="zebrado" class="zebrado">' +
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
	
	$('#telaAguardeAdmCadastroCliente').hide();
	
	$('#btnCadastrarPessoa').click(function(){
		$('#admNomeDoCliente').html($('#pessoaNome').val());	
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera($('#contexto').val() + "/telaAguarde.html");
	});
	
	$('#campoBusca').puts("Digite o nome da pessoa");	
	
	$('#tabBuscaPessoa').hide();	
	$('#iconBuscaPessoa').toggle(function() {
		$('#tabBuscaPessoa').slideDown(500);
	}, function() {
		$('#tabBuscaPessoa').slideUp(500);
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
					var linkRemover = $('#contexto').val() + "/pessoa/remover/" + json[i].uuid;
					
					$('#ulConsultadas').append(
						'<tr class="zebrado">' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabela">' + dataCadastro + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'<td><a href="'+ linkRemover + '"><img class="ponteiro" alt="remover" src="../image/icone_excluir.png" width="20px" height="20px"></a></td>' +
						'<td><img class="ponteiro" alt="editar" src="../image/icone_editar.png" width="20px" height="20px"></td>' +
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
	
	$('#tabPessoasCadastradas').hide();	
	$('#iconPessoasCadastradas').toggle(function() {
		$('#tabPessoasCadastradas').slideDown(500);
		ajaxGet("/pessoa/listar", "#ulPessoas", "#tabPessoasCadastradas", "#btFecharConteudoCadastradas");		
	}, function() {
		$('#tabPessoasCadastradas').slideUp(500);
	});
	
	$('#tabPessoasConfirmadas').hide();	
	$('#iconPessoasConfirmadas').toggle(function() {
		$('#tabPessoasConfirmadas').slideDown(500);
		ajaxGet("/pessoa/confirmadas", "#ulPessoasConfirmadas", "#tabPessoasConfirmadas", "#btFecharConteudoConfirmadas");
	}, function() {
		$('#tabPessoasConfirmadas').slideUp(500);
	});
	
	$('#tabPessoasPendentes').hide();	
	$('#iconPessoasPendentes').toggle(function() {
		$('#tabPessoasPendentes').slideDown(500);
		ajaxGet("/pessoa/pendentes", "#ulPessoasPendentes", "#tabPessoasPendentes", "#btFecharConteudoPendentes");					
		
	}, function() {
		$('#tabPessoasPendentes').slideUp(500);
	});	
		
});
