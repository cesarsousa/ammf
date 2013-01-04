
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
	
	var janelaHtml = $('#contexto').val() + "/telaAguarde.html";
	
	addRemoveDestaque("#campoBuscaTxtEdtBlog, #blogTituloNovoTexto, #blogConteudoNovoTexto");
	$('#blogConteudoNovoTexto').autoResize();
	
	$('#divBlogNovoTexto').hide();
	$('#btAddTextoBlog').click(function(){
		$('#divBlogNovoTexto').slideDown(500);		
	});
	
	$('#btBlogCancelNovoTexto').click(function(){
		$('#blogTituloNovoTexto').val('');
		$('#blogConteudoNovoTexto').val('');
		$('#blogAutorNovoTexto').val('Alcindo Miguel Martins Filho');
		$('#divBlogNovoTexto').slideUp(500);		
	});
	
	$('#formBlogNovoTexto').submit(function(event){
		
		if($('#blogTituloNovoTexto').val()== "" || $('#blogConteudoNovoTexto').val()== ""){
			event.preventDefault();
			alert("Por favor digite o título do texto e o conteúdo antes de cadastrar o novo texto");
		}
		
	});
	
	$('#formBlogEdtTexto').submit(function(event){
		event.preventDefault();
		$('#resultBuscaTxtBlog').slideUp(500);
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/blog/busca/texto",
			data:{"paramConsulta" : $('#campoBuscaTxtEdtBlog').val()},
			success : function(json){
				$('#tabEdtTextoBlog').html('');
				for(var i = 0; i< json.length; i++){
					var nome = json[i].titulo;
					nome = nome.replace($('#campoBuscaTxtEdtBlog').val(),"<b>" + $('#campoBuscaTxtEdtBlog').val() + "</b>");
					var conteudo = 	json[i].conteudo.substring(0, 50);		
					var dataCadastro = getDataFormatada(json[i].postagem.time);
										
					$('#tabEdtTextoBlog').append(
						'<tr>' +
						'<td class="headTabelaBlog2Info">' + dataCadastro + '</td>' +
						'<td class="headTabelaBlog1Info">' + nome + '</td>' +
						'<td class="headTabelaBlog1Info">' + conteudo + '</td>' +
						'</tr>');						
				}
				
				if(json.length > 0) $('#resultBuscaTxtBlog').slideDown(1000);
				
				var textoBuscado = $('#campoBuscaTxtEdtBlog').val();
				$('#campoBuscaTxtEdtBlog').attr("value", "").focus();
				
				$('#labelBuscaTexto').html('').html(json.length + ' ocorrência(s) para a pesquisa: ' + textoBuscado);
								
			},
			error : function(){
				alert("Servidor não esta disponível no momento, por favor tente mais tarde!");				
			}
		});	
		
	});
	
	
	
	
	/*$('#toolsAreaCadastro').hide();	

	$('#btAbrirToolsCadastro').toggle(function() {
		$('#toolsAreaCadastro').slideDown(500);
	}, function() {
		$('#toolsAreaCadastro').slideUp(500);
	});
	
	
	$('#btAbrirToolsCadastro').click(function(){
		
	});
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera(janelaHtml);
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
	});	*/
});
