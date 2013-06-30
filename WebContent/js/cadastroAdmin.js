		
$(document).ready(function() {
	
	$('#telaAguardeAdmCadastroCliente').hide();
	
	$('#btMenuAdm').click(function(){
		$('#formMenuPrincipal').submit();
	});		
	
	//**** BUSCA
	
	$('#tabBuscaPessoa').hide();
	$('#iconBuscaPessoa').click(function() {
		$('#tabPessoasSolicitadas').slideUp(500);
		$('#tabCadastrarPessoa').slideUp(500);
		$('#tabBuscaPessoa').slideDown(500);
		$('#campoBusca').puts("Digite o nome ou o codigo da pessoa");
		addRemoveDestaque("#campoBusca");
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
					var urlRemover = $('#contexto').val() + "/pessoa/remover/" + json[i].uuid;
					var urlConfirmar = $('#contexto').val() + "/pessoa/confirmar/" + json[i].uuid;
					var linkConfirmar = json[i].status == "PENDENTE" ? '<a href="'+ urlConfirmar + '"><img class="ponteiro" alt="confirmar" src="../image/icone_confirmar.png" width="20px" height="20px" title="confirmar"></a>' : '<img alt="confirmado" src="../image/iconeConfirmarDisabled.png" width="20px" height="20px" title="confirmado">';
					
					$('#ulConsultadas').append(
						'<tr class="zebrado">' +
						'<td class="infoTabela">' +  json[i].id + '</td>' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabela">' + dataCadastro + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'<td class="infoTabela">' + json[i].situacao + '</td>' +
						'<td align="center">' + linkConfirmar + '<a href="'+ urlRemover + '" onclick="return confirmarExclusao()"><img class="ponteiro" alt="remover" src="../image/icone_excluir.png" width="20px" height="20px" title="remover"></a></td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#conteudoConsultaPessoas').slideDown(1000);
				
				var textoBuscado = $('#campoBusca').val();
				$('#campoBusca').attr("value", "").focus();
				
				$('#labelResultadoConsulta').html('').html(json.length + ' ocorrencia(s) para a pesquisa: ' + textoBuscado);
								
			},
			error : function(){
				alert("Servidor nao esta disponivel no momento, por favor tente mais tarde!");				
			}
		});	
		
	});
	
	$('#btFecharBuscaPessoa').click(function(){
		$('#tabBuscaPessoa').slideUp(500);		
	});	
	
	//****** CADASTRAR PESSOA
	
	addRemoveDestaque("#pessoaNome");
	addRemoveDestaque("#pessoaEmail");
	
	$('#tabCadastrarPessoa').hide();
	if($('#flagCadastroPessoaVazio').val()){
		$('#tabCadastrarPessoa').slideDown(500);
	}
	$('#iconAddPessoa').click(function() {
		$('#tabBuscaPessoa').slideUp(500);
		$('#tabPessoasSolicitadas').slideUp(500);
		$('#tabCadastrarPessoa').slideDown(500);		
	});
	
	$('#btnCadastrarPessoa, #btConfirmarPessoa, #btNotificarPessoa').click(function(){
		$('#divAdmMsgCadCliente').slideUp(500);
		$('#admNomeDoCliente').html($('#pessoaNome').val());	
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	$('#btFecharCadastrarPessoa').click(function(){
		$('#tabCadastrarPessoa').slideUp(500);		
	});
	
	//*** LISTAGEM DE PESSOAS SOLICITADAS	
	
	$('#iconPessoasCadastradas').click(function() {
		$('#formListarPessoasCadastradas').submit();
	});
	
	$('#iconPessoasConfirmadas').click(function() {
		$('#formListarPessoasConfirmadas').submit();
	});
	
	$('#iconPessoasPendentes').click(function() {
		$('#formListarPessoasPendentes').submit();				
	});
	
	$('#btFecharPessoasSolicitadas').click(function(){
		$('#tabPessoasSolicitadas').slideUp(500);		
	});
});
