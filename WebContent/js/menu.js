
function hidenCamposEdicaoPrincipal(){
	$('#tabArtesOrientais, #tabCultura, #tabEducacao, #tabPsicologia, #telaAguardeMenu').hide();
}

function fadeoutCamposEdicaoPrincipal(){
	$('#tabArtesOrientais, #tabCultura, #tabEducacao, #tabPsicologia').fadeOut();
}

function abrirCampoEdicao(elemento){
	$(elemento).fadeIn(1000);
}

function fecharCampoEdicao(elemento){
	$(elemento).fadeOut(1000);
}

function configurarCamposEdicaoPrincipal(elementoAbertura, elementoFechamento, tabela){
	$(elementoAbertura).click(function(evento){
		evento.preventDefault();
		fadeoutCamposEdicaoPrincipal();
		abrirCampoEdicao(tabela);		
	});
	$(elementoFechamento).click(function(evento){
		evento.preventDefault();
		fecharCampoEdicao(tabela);		
	});
}

$(document).ready(function() {	
	
	hidenCamposEdicaoPrincipal();
	
	$('#conteudoIndex').hide();
	$('#btAbrirConteudoIndex').click(function(){
		$('#conteudoIndex').slideDown(1000);		
	});
	$('#btFecharConteudoIndex').click(function(){
		$('#conteudoIndex').slideUp(1000);		
	});
	
	$('#conteudoCampoQuiron').hide();
	$('#btAbrirConteudoQuiron').click(function(){
		$('#conteudoCampoQuiron').slideDown(1000);		
	});
	$('#btFecharConteudoQuiron').click(function(){
		$('#conteudoCampoQuiron').slideUp(1000);		
	});
	
	$('#btAtualizarTextoIndex, #btAtualizarTextoQuiron, #brAlterarTxtPsicologia, #btAlterarTxtEducacao, #btAlterarTxtCultura, #btAlterarArtOriental').click(function(){
		abrirJanelaDeEspera("#divPgMenu", "#telaAguardeMenu");		
	});	
	
	if($('#flagEditarUsuario').val() == "true"){
		$('#conteudoConta').show();
	}else{
		$('#conteudoConta').hide();
	}	
	
	$('#btAbrirConteudoConta').click(function(){
		$('#conteudoConta').slideDown(1000);		
	});
	
	addRemoveDestaque('#campoContaNome, #campoContaTelefone, #campoContaLogin, #campoContaEmail, #campoContaSenha, #campoContaLinkedin, #campoContaEndereco, #areaLocalizacaoMapa');
	$('#campoContaTelefone').mask("(99)9999-9999");
	
	$('#campoContaSenhaTexto').hide();
	$('#checkOcultarSenha').hide();
	$('#checkMostrarSenha').click(function(){
		$('#checkMostrarSenha').hide();
		$('#checkOcultarSenha').show();
		$('#campoContaSenhaTexto').slideDown();		
	});
	$('#checkOcultarSenha').click(function(){
		$('#checkOcultarSenha').hide();
		$('#checkMostrarSenha').show();
		$('#campoContaSenhaTexto').slideUp();		
	});
	
	// primeira execucao checa o estado inicial
	if ($('#checkHabilitarMapa').is(":checked")) {
		$('#divGeoLocalizacao').slideDown(500);
	} else {
		$('#divGeoLocalizacao').slideUp(500);
	}
	// checagem durante cliques no checkbox
	$('#checkHabilitarMapa').click(function() {
		if ($('#checkHabilitarMapa').is(":checked")) {
			$('#divGeoLocalizacao').slideDown(500);
		} else {
			$('#divGeoLocalizacao').slideUp(500);
		}
	});
		
	$('#btFecharConteudoConta').click(function(){
		$('#conteudoConta').slideUp(1000);		
	});
	
	addRemoveDestaque('#campoAutorFraseIndex');
	addRemoveDestaque('#campoFraseIndex');
	$('textarea#campoFraseIndex').autoResize();
	
	addRemoveDestaque('#campoTextoPsicologia');
	//$('textarea#campoTextoPsicologia').autoResize();
	
	addRemoveDestaque('#campoTextoEducacao');
	$('textarea#campoTextoEducacao').autoResize();
	
	addRemoveDestaque('#campoTextoCultura');
	$('textarea#campoTextoCultura').autoResize();
	
	addRemoveDestaque('#campoTextoArtesOrientais');
	$('textarea#campoTextoArtesOrientais').autoResize();
	
	
	
	configurarCamposEdicaoPrincipal('#linkEditarPsicologia', '#btFecharEditarPsicologia', '#tabPsicologia');
	configurarCamposEdicaoPrincipal('#linkEditarEducacao', '#btFecharEditarEducacao', '#tabEducacao');	
	configurarCamposEdicaoPrincipal('#linkEditarCultura', '#btFecharEditarCultura', '#tabCultura');
	configurarCamposEdicaoPrincipal('#linkEditarOrientais', '#btFecharEditarArtesOrientais', '#tabArtesOrientais');
		
	$('#sizeSmallIndex, #sizeMediumIndex, #sizeLargeIndex, #sizeXLargeIndex, #sizeXxLargeIndex').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Index","");		
		alterarTamanhoTexto(origem, '#campoFraseIndex');
		alterarTamanhoTexto(origem, '#campoAutorFraseIndex');
	});
	
	$('#sizeSmallQuiron, #sizeMediumQuiron, #sizeLargeQuiron, #sizeXLargeQuiron, #sizeXxLargeQuiron').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Quiron","");		
		alterarTamanhoTexto(origem, '#campoConteudoQuiron');
	});
	
	$('#sizeSmallPsicologia, #sizeMediumPsicologia, #sizeLargePsicologia, #sizeXLargePsicologia, #sizeXxLargePsicologia').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Psicologia","");		
		alterarTamanhoTexto(origem, '#campoTextoPsicologia');
	});
	
	$('#sizeSmallEducacao, #sizeMediumEducacao, #sizeLargeEducacao, #sizeXLargeEducacao, #sizeXxLargeEducacao').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Educacao","");		
		alterarTamanhoTexto(origem, '#campoTextoEducacao');
	});
	
	$('#sizeSmallCultura, #sizeMediumCultura, #sizeLargeCultura, #sizeXLargeCultura, #sizeXxLargeCultura').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Cultura","");		
		alterarTamanhoTexto(origem, '#campoTextoCultura');
	});
	
	$('#sizeSmallArtesOrientais, #sizeMediumArtesOrientais, #sizeLargeArtesOrientais, #sizeXLargeArtesOrientais, #sizeXxLargeArtesOrientais').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("ArtesOrientais","");		
		alterarTamanhoTexto(origem, '#campoTextoArtesOrientais');
	});
	
	$('#sizeSmallAreaPsicologia, #sizeMediumAreaPsicologia, #sizeLargeAreaPsicologia, #sizeXLargeAreaPsicologia, #sizeXxLargeAreaPsicologia').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Psicologia","");		
		alterarTamanhoAreaTexto(origem, '#campoTextoPsicologia');
	});
	
	$('#sizeSmallAreaQuiron, #sizeMediumAreaQuiron, #sizeLargeAreaQuiron, #sizeXLargeAreaQuiron, #sizeXxLargeAreaQuiron').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Quiron","");		
		alterarTamanhoAreaTexto(origem, '#campoConteudoQuiron');
	});
});