
$(document).ready(function() {
	
	var janelaHtml = $('#contexto').val() + "/telaAguarde.html";
	
	addRemoveDestaque("#pessoaNome");
	addRemoveDestaque("#pessoaEmail");
	
	$('#btnCadastrarPessoa').click(function(){
		abrirJanelaDeEspera(janelaHtml);
	});
	
});