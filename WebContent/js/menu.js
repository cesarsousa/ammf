
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
	
	var caracteresQuiron = 0;
	$('#conteudoCampoQuiron').hide();
	$('#btAbrirConteudoQuiron').click(function(){
		$('#conteudoCampoQuiron').slideDown(1000);
		$('#campoConteudoQuiron').keyup(function() {		
			limitarCaracteres('#campoConteudoQuiron', '#contadorCaracterQuiron', 3000);
					
			caracteresQuiron++;
			if(caracteresQuiron == 100){				
				caracteresQuiron = 0;
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
	
	
	$('#conteudoCampoConstelacao').hide();
	$('#btAbrirConteudoConstelacao').click(function(){
		$('#conteudoCampoConstelacao').slideDown(1000);		
	});
	$('#btFecharConteudoConstelacao').click(function(){
		$('#conteudoCampoConstelacao').slideUp(1000);		
	});
		
	configurarCamposEdicaoPrincipal('#linkEditarTerapeuta', '#btFecharEditarTerapeuta', '#tabTerapeuta');
	configurarCamposEdicaoPrincipal('#linkEditarPsicologia', '#btFecharEditarPsicologia', '#tabPsicologia');
	configurarCamposEdicaoPrincipal('#linkEditarEducacao', '#btFecharEditarEducacao', '#tabEducacao');	
	configurarCamposEdicaoPrincipal('#linkEditarCultura', '#btFecharEditarCultura', '#tabCultura');
	configurarCamposEdicaoPrincipal('#linkEditarOrientais', '#btFecharEditarArtesOrientais', '#tabArtesOrientais');
	
	var contadorDeCaracteres = 0;
	$('#campoTextoPsicologia, #campoTextoEducacao, #campoTextoCultura, #campoTextoOrientais').keyup(function() {
		var origem  = this.id.replace("campoTexto", "");
		var contadorDeTexto = "#contadorCaracter" + origem;		
		limitarCaracteres("#" + this.id, contadorDeTexto, 3000);
		
		contadorDeCaracteres++;
		if(contadorDeCaracteres == 100){				
			contadorDeCaracteres = 0;
			ajaxSalvaAutomatica("#" + this.id, "/menu/" + origem + "/post");
		}
	});
	
	$('#edtInfoTerapeuta, #edtFormacaoTerapeuta, #edtAtuacaoTerapeuta, #edtTratamentoTerapeuta').keyup(function() {
		var origem  = this.id.replace("edt", "");
		var contadorDeTexto = "#contadorCaracter" + origem;
		
		limitarCaracteres("#" + this.id, contadorDeTexto, 3000);		  
	});
	
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
		alterarTamanhoTexto(origem, '#campoTextoOrientais');
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
		alterarTamanhoAreaTexto(origem, '#campoTextoOrientais');
	});
		
	$('.emDesenv').click(function(){
		alert("pagina em desenvolvimento...");
	});
	
});