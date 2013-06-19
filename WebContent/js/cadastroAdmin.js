		
function ajaxGet(url, tituloTabela, nomeImagem){
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + url,
		success : function(json){
			$('#tituloPessoasSolicitadas').html('').append(tituloTabela);
			var imagem = $('#imageContexto').val() + nomeImagem;
			$('#iconTituloPessoasSolicitadas').attr('src', imagem);		
				
			$('#bodyPessoasSolicitadas').html('');
			for(var i = 0; i< json.length; i++){				
				var dataCadastro = getDataFormatada(json[i].dataCadastro.time);
				var linkRemover = $('#contexto').val() + "/pessoa/remover/" + json[i].uuid;
				var linkConfirmar = $('#contexto').val() + "/pessoa/confirmar/" + json[i].uuid;
				var tagConfirmar = json[i].status == "PENDENTE" ? '<a href="'+ linkConfirmar + '"><img class="ponteiro" alt="confirmar esta pessoa" src="../image/icone_confirmar.png" width="20px" height="20px" title="confirmar esta pessoa"></a>' : '';
				
				$('#bodyPessoasSolicitadas').append(
					'<tr class="zebrado" class="zebrado">' +
					'<td class="infoTabela">' + json[i].nome + '</td>' +
					'<td class="infoTabela">' + json[i].email + '</td>' +
					'<td class="infoTabela">' + dataCadastro + '</td>' +
					'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
					'<td>' +
					     '<a href="'+ linkRemover + '"><img class="ponteiro" alt="excluir esta pessoa" src="../image/icone_excluir.png" width="20px" height="20px" title="excluir esta pessoa"></a>' + tagConfirmar + '</td>' +
					'</tr>');						
			}					
			
			$('#tabPessoasSolicitadas').slideDown(1000);
			
		},
		error : function(){
			alert("Servidor nao esta disponiel no momento, por favor tente mais tarde!");				
		}
	});	
}


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
		$('#campoBusca').puts("Digite o nome da pessoa");
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
					var linkRemover = $('#contexto').val() + "/pessoa/remover/" + json[i].uuid;
					
					$('#ulConsultadas').append(
						'<tr class="zebrado">' +
						'<td class="infoTabela">' + nome + '</td>' +
						'<td class="infoTabela">' + email + '</td>' +
						'<td class="infoTabela">' + dataCadastro + '</td>' +
						'<td class="'+ json[i].status + ' infoTabela">' + json[i].status + '</td>' +
						'<td><a href="'+ linkRemover + '"><img class="ponteiro" alt="remover" src="../image/icone_excluir.png" width="20px" height="20px" title="excluir esta pessoa"></a></td>' +
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
	
	$('#btnCadastrarPessoa').click(function(){
		$('#divAdmMsgCadCliente').slideUp(500);
		$('#admNomeDoCliente').html($('#pessoaNome').val());	
		abrirJanelaDeEspera("#divPgAdmCadastroCliente", "#telaAguardeAdmCadastroCliente");
	});
	
	$('#btFecharCadastrarPessoa').click(function(){
		$('#tabCadastrarPessoa').slideUp(500);		
	});
	
	//*** LISTAGEM DE PESSOAS SOLICITADAS
	
	$('#tabPessoasSolicitadas').hide();	
	$('#iconPessoasCadastradas').click(function() {
		$('#tabBuscaPessoa').slideUp(500);
		$('#tabCadastrarPessoa').slideUp(500);
		ajaxGet("/pessoa/listar", '<div align="center"><span class="titulo corCinza">Pessoas Cadastradas</span></div>', '/usuario_cinza.png');
	});
	
	$('#iconPessoasConfirmadas').click(function() {
		$('#tabBuscaPessoa').slideUp(500);
		$('#tabCadastrarPessoa').slideUp(500);
		ajaxGet("/pessoa/confirmadas", '<div align="center"><span class="titulo corVerde">Pessoas Confirmadas</span></div>', '/usuario_verde.png');
	});
	
	$('#iconPessoasPendentes').click(function() {
		$('#tabBuscaPessoa').slideUp(500);
		$('#tabCadastrarPessoa').slideUp(500);
		ajaxGet("/pessoa/pendentes", '<div align="center"><span class="titulo corVermelho">Pessoas Pendentes Confirma&ccedil;&atilde;o</span></div>', '/usuario_vermelho.png');				
	});
	
	$('#btFecharPessoasSolicitadas').click(function(){
		$('#tabPessoasSolicitadas').slideUp(500);		
	});
});
