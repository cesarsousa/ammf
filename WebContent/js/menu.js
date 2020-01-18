
function getCheckValue(elementId){
	if($(elementId).is(":checked")){
        return true;
    }else{
    	return false;
    }
}

function atualizarDadosContaDeUsuario(){
	
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/usuario/configuracao",
		data:{
			"usuario.uuid" : $('#usuarioUuid').val(),
			"usuario.administrativo" : getCheckValue('#usuarioAdministrativo'),
			"usuario.dominioPadrao" : getCheckValue('#usuarioDominioPadrao'),
			"usuario.imagemPadrao" : getCheckValue('#usuarioImagemPadrao'),
			"usuario.nome" : $('#campoContaNome').val(),
			"usuario.telefone" : $('#campoContaTelefone').val(),
			"usuario.login" : $('#campoContaLogin').val(),
			"usuario.email" : $('#campoContaEmail').val(),
			"usuario.senha" : $('#campoContaSenha').val(),
			"usuario.emailAtivado" : getCheckValue('#usuarioEmailAtivado'),
			"usuario.emailNotificacao" : $('#campoContaEmailNotificacao').val(),
			"usuario.linkedin" : $('#campoContaLinkedin').val(),
			"usuario.endereco" : $('#campoContaEndereco').val(),
			"usuario.mostrarMapa" : getCheckValue('#checkHabilitarMapa'),
			"usuario.localizacao" : $('#areaLocalizacaoMapa').val()
			},
		success : function(json){
			$('#modalEditarConfiguracaoConta').modal('hide');
			
		},
		error : function(){
			alert("Erro :( Não foi possível atualizar dados da conta!");				
		}
	});
}

function atualizarConstelacaoNiteroi(elemento){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/menu/constelacao/atualizar",
		data:{
			"constelacao.localEvento" : $('#constelacaoNiteroiLocalEvento').val(),
			"constelacao.textoInicial" : $('#constelacaoNiteroiTextoInicial').val(),
			"constelacao.formaPagamento" : $('#constelacaoNiteroiFormaPagamento').val(),
			"constelacao.textoFinal" : $('#constelacaoNiteroiTextoFinal').val(),
			"constelacao.data" : $('#constelacaoNiteroiData').val(),
			"constelacao.localizacao" : $('#constelacaoNiteroiLocalizacao').val(),
			"constelacao.localMapa" : $('#constelacaoNiteroiLocalMapa').val(),
			"constelacao.linkMapa" : $('#constelacaoNiteroiLinkMapa').val(),
			"constelacao.informacao" : $('#constelacaoNiteroiInformacao').val(),
			"constelacao.dadosPessoais" : $('#constelacaoNiteroiDadosPessoais').val(),
			},
		success : function(json){
			var idIconeOk = "#icone" + elemento;
			$(idIconeOk).show().fadeOut(4000);
		},
		error : function(){
			alert("Erro :( Não foi possível atualizar dados da contelação!");				
		}
	});
}

function atualizarConstelacaoBarra(elemento){
	$.ajax({
		type : 'POST',
		url : $('#contexto').val() + "/menu/constelacao/atualizar",
		data:{
			"constelacao.localEvento" : $('#constelacaoBarraLocalEvento').val(),
			"constelacao.textoInicial" : $('#constelacaoBarraTextoInicial').val(),
			"constelacao.formaPagamento" : $('#constelacaoBarraFormaPagamento').val(),
			"constelacao.textoFinal" : $('#constelacaoBarraTextoFinal').val(),
			"constelacao.data" : $('#constelacaoBarraData').val(),
			"constelacao.localizacao" : $('#constelacaoBarraLocalizacao').val(),
			"constelacao.localMapa" : $('#constelacaoBarraLocalMapa').val(),
			"constelacao.linkMapa" : $('#constelacaoBarraLinkMapa').val(),
			"constelacao.informacao" : $('#constelacaoBarraInformacao').val(),
			"constelacao.dadosPessoais" : $('#constelacaoBarraDadosPessoais').val(),
			},
		success : function(json){
			var idIconeOk = "#icone" + elemento;
			$(idIconeOk).show().fadeOut(4000);
		},
		error : function(){
			alert("Erro :( Não foi possível atualizar dados da contelação!");				
		}
	});
}

function enviarNotificacaoConstelacaoPara(local, email, campo){
	
	hidenCamposMensagemAjaxNiteroi();
	
	$('#aguardeNotificacaoConstelacaoNiteroi, #aguardeNotificacaoConstelacaoBarra').slideDown(500);
	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/menu/constelacao/notificar",
		data:{
			"local": local,
			"email" : email
			},
		success : function(json){
			if(local === "NITEROI"){
				$('#aguardeNotificacaoConstelacaoNiteroi').slideUp(500);
				$(campo).val("");
				$('#msgSucessoAjaxNiteroi').html("Operação realizada com sucesso!").show();
			}else{
				$('#aguardeNotificacaoConstelacaoBarra').slideUp(500);
				$(campo).val("");
				$('#msgSucessoAjaxBarra').html("Operação realizada com sucesso!").show();
			}
		},
		error : function(){
			if(local === "NITEROI"){
				$('#aguardeNotificacaoConstelacaoNiteroi').slideUp(500);
				$(campo).val("");
				$('#msgErroAjaxNiteroi').html("Erro :( Não foi possível enviar a notificação da contelação para: " + email).show();
			}else{
				$('#aguardeNotificacaoConstelacaoBarra').slideUp(500);
				$(campo).val("");
				$('#msgErroAjaxBarra').html("Erro :( Não foi possível enviar a notificação da contelação para: " + email).show();
			}
		}
	});
	
}

function enviarNotificacaoConstelacaoEm(local){
	
	hidenCamposMensagemAjaxNiteroi();
	
	if(local === "NITEROI"){
		$('#aguardeNotificacaoConstelacaoNiteroi').slideDown(500);
	}else{
		$('#aguardeNotificacaoConstelacaoBarra').slideDown(500);
	}
	
	$.ajax({
		type : 'GET',
		url : $('#contexto').val() + "/menu/constelacao/notificar/todos",
		data:{
			"local": local
			},
		success : function(json){
			
			console.log(json)
			
			$('#aguardeNotificacaoConstelacaoNiteroi').slideUp(500);
			
			$('#msgSucessoAjaxNiteroi').html("Total de pessoas cadastradas: " + json.totalGeral + ".<br/>Operação realizada com sucesso para " + json.totalInformado + " pessoas!").show();
			
			if(json.totalErros > 0){
				
				var dataDiv = '<p>Erro no envio para ' + json.totalErros + ' emails.</p>';
				
				dataDiv += '<ul>';
								
				for(var i = 0; i < json.emailsNaoInformados.length; i++){
					
					dataDiv += '<li>' + json.emailsNaoInformados[i].email + '</li>';
				}
				
				dataDiv += '</lu>'
				
				$('#msgErroAjaxNiteroi').html(dataDiv).show();
			}
			
		},
		error : function(){
			$('#aguardeNotificacaoConstelacaoNiteroi').slideUp(500);
			$('#msgErroAjaxNiteroi').html("Erro :( Não foi possível enviar a notificação da contelação.").show();
		}
	});
	
}

function hidenCamposEdicaoPrincipal(){
	$('#tabTerapeuta, #tabArtesOrientais, #tabCultura, #tabEducacao, #tabPsicologia, #telaAguardeMenu').hide();
}

function hidenIconesAjaxComSucesso(){
	$('#iconeconstelacaoNiteroiTextoInicial, #iconeconstelacaoNiteroiFormaPagamento, #iconeconstelacaoNiteroiTextoFinal, #iconeconstelacaoNiteroiData, #iconeconstelacaoNiteroiLocalizacao, #iconeconstelacaoNiteroiLocalMapa, #iconeconstelacaoNiteroiLinkMapa, #iconeconstelacaoNiteroiInformacao, #iconeconstelacaoNiteroiDadosPessoais').hide();
	$('#iconeconstelacaoBarraTextoInicial, #iconeconstelacaoBarraFormaPagamento, #iconeconstelacaoBarraTextoFinal, #iconeconstelacaoBarraData, #iconeconstelacaoBarraLocalizacao, #iconeconstelacaoBarraLocalMapa, #iconeconstelacaoBarraLinkMapa, #iconeconstelacaoBarraInformacao, #iconeconstelacaoBarraDadosPessoais').hide();
	$('#iconeAtualizarUsuarioerro, #iconeAtualizarUsuariosucesso').hide();
}

function hidenCamposMensagemAjaxNiteroi(){
	$('#msgSucessoAjaxNiteroi, #msgErroAjaxNiteroi').hide();
}
function hidenCamposMensagemAjaxBarra(){
	$('#msgSucessoAjaxBarra, #msgErroAjaxBarra').hide();
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
	
	hidenIconesAjaxComSucesso();
	
	$('#aguardeNotificacaoConstelacaoNiteroi').hide();
	$('#aguardeNotificacaoConstelacaoBarra').hide();
	hidenCamposMensagemAjaxNiteroi();
	hidenCamposMensagemAjaxBarra();

	$('#constelacaoNiteroiTextoInicial, #constelacaoNiteroiFormaPagamento, #constelacaoNiteroiTextoFinal, #constelacaoNiteroiData, #constelacaoNiteroiLocalizacao, #constelacaoNiteroiLocalMapa, #constelacaoNiteroiLinkMapa, #constelacaoNiteroiInformacao, #constelacaoNiteroiDadosPessoais').blur(function() {		
		atualizarConstelacaoNiteroi(this.id);		  
	});
	$('#constelacaoBarraTextoInicial, #constelacaoBarraFormaPagamento, #constelacaoBarraTextoFinal, #constelacaoBarraData, #constelacaoBarraLocalizacao, #constelacaoBarraLocalMapa, #constelacaoBarraLinkMapa, #constelacaoBarraInformacao, #constelacaoBarraDadosPessoais').blur(function() {		
		atualizarConstelacaoBarra(this.id);		  
	});
	
	$('#constelacaoNiteroiEmailAdicional').blur(function(){
		
		var constelacaoNiteroiEmailAdicional = $('#constelacaoNiteroiEmailAdicional').val();
		
		if(constelacaoNiteroiEmailAdicional !== ""){
			enviarNotificacaoConstelacaoPara("NITEROI", constelacaoNiteroiEmailAdicional, "#constelacaoNiteroiEmailAdicional");
		}
				
	});
	$('#constelacaoBarraEmailAdicional').blur(function(){
		
		var constelacaoBarraEmailAdicional = $('#constelacaoBarraEmailAdicional').val();
		
		if(constelacaoBarraEmailAdicional !== ""){
			enviarNotificacaoConstelacaoPara("BARRA", constelacaoBarraEmailAdicional, "#constelacaoBarraEmailAdicional");
		}
				
	});
	
	$('#constelacaoNiteroiEnviarEmails').click(function(){
		enviarNotificacaoConstelacaoEm("NITEROI");
	});
	$('#constelacaoBarraEnviarEmails').click(function(){
		enviarNotificacaoConstelacaoEm("BARRA");
	});
	
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
	$('#btAtualizarTextoIndex').click(function(){
		$('#formAtualizarTextoIndex').submit();		
	});
	$('#btAtualizarTextoQuiron').click(function(){
		$('#formAtualizarTextoQuiron').submit();		
	});
	
	$('#btAlterarUsuario').click(function(){
		abrirJanelaDeEspera("#divPgMenu", "#telaAguardeMenu");
		$('#formAlterarUsuario').submit();
		//atualizarDadosContaDeUsuario();
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
	
	$('#conteudoCampoConstelacao, #conteudoCampoConstelacaoBarra').hide();
	$('#btAbrirConteudoConstelacao').click(function(){
		$('#conteudoCampoConstelacao').slideDown(1000);		
	});
	$('#btFecharConteudoConstelacao').click(function(){
		$('#conteudoCampoConstelacao').slideUp(1000);		
	});
	
	$('#btAbrirConteudoConstelacaoBarra').click(function(){
		$('#conteudoCampoConstelacaoBarra').slideDown(1000);		
	});
	$('#btFecharConteudoConstelacaoBarra').click(function(){
		$('#conteudoCampoConstelacaoBarra').slideUp(1000);		
	});
		
	configurarCamposEdicaoPrincipal('#linkEditarTerapeuta, #imglinkTerapeuta', '#btFecharEditarTerapeuta', '#tabTerapeuta');
	configurarCamposEdicaoPrincipal('#linkEditarPsicologia, #imglinkPsicologia', '#btFecharEditarPsicologia', '#tabPsicologia');
	configurarCamposEdicaoPrincipal('#linkEditarEducacao, #imglinkEducacao', '#btFecharEditarEducacao', '#tabEducacao');	
	configurarCamposEdicaoPrincipal('#linkEditarCultura, #imglinkCultura', '#btFecharEditarCultura', '#tabCultura');
	configurarCamposEdicaoPrincipal('#linkEditarOrientais, #imglinkOrientais', '#btFecharEditarArtesOrientais', '#tabArtesOrientais');
	
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
	
});