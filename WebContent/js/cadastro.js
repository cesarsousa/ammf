
$(document).ready(function() {
	
	var janelaHtml = $('#contexto').val() + "/telaAguarde.html";
	
	addRemoveDestaque("#pessoaNome");
	addRemoveDestaque("#pessoaEmail");
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera(janelaHtml);
	});
	
	$('#conteudoPessoasCadastradas').hide();
	$('#btAbrirConteudoCadastradas').click(function(){
		$.ajax({
			type : 'GET',
			url : $('#contexto').val() + "/pessoa/listar",
			success : function(json){
				$('#ulPessoas').html('');
				for(var i = 0; i< json.length; i++){
					$('#ulPessoas').append('<li>' + json[i].nome + ' - ' + json[i].email + ' - ' + json[i].status + '</li>');
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
	
});