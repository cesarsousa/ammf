
function hidenCamposEdicaoPrincipal(){
	$('#tabTerapeuta, #tabArtesOrientais, #tabCultura, #tabEducacao, #tabPsicologia, #telaAguardeMenu').hide();
}

function fadeoutCamposEdicaoPrincipal(){
	$('#tabTerapeuta, #tabArtesOrientais, #tabCultura, #tabEducacao, #tabPsicologia').fadeOut();
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
		$('#campoFraseIndex').keyup(function() {		
			limitarCaracteres('#campoFraseIndex', '#contadorCaracterShiva', 600);		  
		});		
	});
	$('#btFecharConteudoIndex').click(function(){
		$('#conteudoIndex').slideUp(1000);		
	});
	
	var timer;
	var caracteresDigitado = 0;
	$('#conteudoCampoQuiron').hide();
	$('#btAbrirConteudoQuiron').click(function(){
		$('#conteudoCampoQuiron').slideDown(1000);
		$('#campoConteudoQuiron').keyup(function() {		
			limitarCaracteres('#campoConteudoQuiron', '#contadorCaracterQuiron', 3000);
					
			caracteresDigitado++;
			if(caracteresDigitado == 100){				
				caracteresDigitado = 0;
				ajaxSalvaAutomatica("#campoConteudoQuiron", "/menu/quiron/post");
			}			
		});	
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
	
	addRemoveDestaque('#campoAutorFraseIndex');
	addRemoveDestaque('#campoFraseIndex');	
	addRemoveDestaque('#campoConteudoQuiron');
	
	addRemoveDestaque('#campoContaNome, #campoContaTelefone, #campoContaLogin, #campoContaEmail, #campoContaSenha, #campoContaLinkedin, #campoContaEndereco, #areaLocalizacaoMapa');
	/*$('#campoContaTelefone').mask("(99)9999-9999");*/
	
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
	
	addRemoveDestaque('#edtTituloTerapeuta');
	addRemoveDestaque('#edtInfoTerapeuta');
	addRemoveDestaque('#edtFormacaoTerapeuta');
	addRemoveDestaque('#edtAtuacaoTerapeuta');
	addRemoveDestaque('#edtTratamentoTerapeuta');
	
	addRemoveDestaque('#campoTextoPsicologia');
	addRemoveDestaque('#campoTextoEducacao');
	addRemoveDestaque('#campoTextoCultura');
	addRemoveDestaque('#campoTextoArtesOrientais');
		
	configurarCamposEdicaoPrincipal('#linkEditarTerapeuta', '#btFecharEditarTerapeuta', '#tabTerapeuta');
	configurarCamposEdicaoPrincipal('#linkEditarPsicologia', '#btFecharEditarPsicologia', '#tabPsicologia');
	configurarCamposEdicaoPrincipal('#linkEditarEducacao', '#btFecharEditarEducacao', '#tabEducacao');	
	configurarCamposEdicaoPrincipal('#linkEditarCultura', '#btFecharEditarCultura', '#tabCultura');
	configurarCamposEdicaoPrincipal('#linkEditarOrientais', '#btFecharEditarArtesOrientais', '#tabArtesOrientais');
	
	$('#campoTextoPsicologia, #campoTextoEducacao, #campoTextoCultura, #campoTextoArtesOrientais').keyup(function() {
		var origem  = this.id.replace("campoTexto", "");
		var contadorDeTexto = "#contadorCaracter" + origem;
		
		limitarCaracteres("#" + this.id, contadorDeTexto, 3000);		  
	});
	
	$('#edtInfoTerapeuta, #edtFormacaoTerapeuta, #edtAtuacaoTerapeuta, #edtTratamentoTerapeuta').keyup(function() {
		var origem  = this.id.replace("edt", "");
		var contadorDeTexto = "#contadorCaracter" + origem;
		
		limitarCaracteres("#" + this.id, contadorDeTexto, 3000);		  
	});
		
	// TAMANHO DE FONTE
	
	/*$('#tabelaTerapeuta tr td span').click(function(){
		var idOrigem = this.id;
		
		var tamanho = idOrigem.replace("Terapeuta","");
		
		var tipo = tamanho.substring(tamanho.length - 1, tamanho.length);
		
		var area = tamanho.substring(tamanho.length - 5, tamanho.length - 1);
		
		var tamanhoFinal = tamanho.substring(0, tamanho.length - 1);
		
		alert("tamanho:"+tamanhoFinal+" tipo:"+tipo+" area:"+area);
		
		edtInfoTerapeuta
		edtFormacaoTerapeuta
		edtAtuacaoTerapeuta
		edtTratamentoTerapeuta
		
		alterarTamanhoTexto(origem, '#campoFraseIndex');
	});*/
	
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
	
	// AREA DE TEXTO
	
	$('#sizeSmallAreaIndex, #sizeMediumAreaIndex, #sizeLargeAreaIndex, #sizeXLargeAreaIndex, #sizeXxLargeAreaIndex').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Index","");		
		alterarTamanhoAreaTexto(origem, '#campoFraseIndex');
	});
	
	$('#sizeSmallAreaQuiron, #sizeMediumAreaQuiron, #sizeLargeAreaQuiron, #sizeXLargeAreaQuiron, #sizeXxLargeAreaQuiron').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Quiron","");		
		alterarTamanhoAreaTexto(origem, '#campoConteudoQuiron');
	});
	
	$('#sizeSmallAreaPsicologia, #sizeMediumAreaPsicologia, #sizeLargeAreaPsicologia, #sizeXLargeAreaPsicologia, #sizeXxLargeAreaPsicologia').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Psicologia","");		
		alterarTamanhoAreaTexto(origem, '#campoTextoPsicologia');
	});
	
	$('#sizeSmallAreaEducacao, #sizeMediumAreaEducacao, #sizeLargeAreaEducacao, #sizeXLargeAreaEducacao, #sizeXxLargeAreaEducacao').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Educacao","");		
		alterarTamanhoAreaTexto(origem, '#campoTextoEducacao');
	});
	
	$('#sizeSmallAreaCultura, #sizeMediumAreaCultura, #sizeLargeAreaCultura, #sizeXLargeAreaCultura, #sizeXxLargeCultura').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("Cultura","");		
		alterarTamanhoAreaTexto(origem, '#campoTextoCultura');
	});
	
	$('#sizeSmallAreaArtesOrientais, #sizeMediumArtesOrientais, #sizeLargeAreaArtesOrientais, #sizeXLargeAreaArtesOrientais, #sizeXxLargeAreaArtesOrientais').click(function(){
		var idOrigem = this.id;
		var origem = idOrigem.replace("ArtesOrientais","");		
		alterarTamanhoAreaTexto(origem, '#campoTextoArtesOrientais');
	});
		
	$('.emDesenv').click(function(){
		alert("pagina em desenvolvimento...");
	});
	
});