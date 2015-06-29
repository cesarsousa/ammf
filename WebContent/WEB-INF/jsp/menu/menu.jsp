<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div align="center">
<c:if test="${not empty erroConfConta}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">
	Verifique dado(s) obrigat&oacute;rio(s) de configura&ccedil;&atilde;o da conta n&atilde;o preenchido(s)
	</div>
</c:if>

<c:if test="${not empty mensagemErro}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">${mensagemErro}</div>
</c:if>

<c:if test="${not empty mensagemAviso}">
	<div class="msgBorder msgAlerta">${mensagemAviso}</div>
</c:if>

<c:if test="${not empty mensagem}">
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagem}</div>
</c:if>

<c:if test="${not empty mensagemMenuSecundario}">		
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagemMenuSecundario}</div>
</c:if>

<c:if test="${not empty sessaoUsuario.notificacoes}">
	<div class="msgBorder msgAlerta">
	<c:forEach items="${sessaoUsuario.notificacoes}" var="notificacao">
		${notificacao}<br/>
	</c:forEach>
	</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgMenu" align="center">

<h2>Menu Principal</h2>

<div class="tamanhoDefault">

	<table class="tamanhoDefault">
		<tr>
			<td>			
			<c:if test="${not empty usuarioUuidBranco}">
			<div id="boxMsgErro" class="msgBorder msgErro tamanhoEdicaoIndex ponteiro">${usuarioUuidBranco}</div>
			</c:if>				
			</td>
		</tr>				
	</table>
	
	<table class="tamanhoDefault">
	<tr>
	<td>
	
	<a href="<c:url value="/menu/adm" ></c:url>">
	<img id="btMenuRefresh" alt="atualizar pagina" title="atualizar pagina" src="${imagem}/iconeRefresh.png" class="icone50 ponteiro esquerda clarear">
	</a>
	</td>
	</tr>
	</table>

	<!-- EDITAR CONTEUDO SHIVA -->
	<table class="tamanhoDefault">
		<tr>
			<td id="btAbrirConteudoIndex" class="headerSlide">
			<span  class="esquerda">Shiva</span>
			<span class="info azulClaro" >Altere o nome do autor e a frase que os da imagem do Shiva.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoIndex" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoIndex" type="button" class="btn btn-danger direita" value="fechar">			
			<img align="left" src="${imagem}/Shiva500.jpg" class="esquerda icone50">			
			<h2 align="center">Atualiza&ccedil;&atilde;o da frase e autor da p&aacute;gina do Shiva</h2>
			
			<form action="<c:url value="/menu/index/atualizar"/>" method="post" class="paddingPadrao">			
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallIndex" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumIndex" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeIndex" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeIndex" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeIndex" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaIndex" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaIndex" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaIndex" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaIndex" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaIndex" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>						
				
				<h3>Frase:</h3>
				<textarea id="campoFraseIndex" class="areaTexto h200 bordaPadrao" name="texto.conteudo" >${sessaoUsuario.textoIndex.conteudo}</textarea>				
								
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterShiva">600</span> caracteres na frase.
				</h4>
				
				<h3>Autor:</h3>
				<input id="campoAutorFraseIndex" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="${sessaoUsuario.textoIndex.autor}">
				
				<p class="paddingPadrao">
				<input id="btAtualizarTextoIndex" type="submit" value="atualizar" class="btn btn-success direita" >			
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<!-- EDITAR CONTEUDO QUIRON -->	
	<table class="tamanhoDefault">
		<tr>
			<td id="btAbrirConteudoQuiron" class="headerSlide">
			<span  class="esquerda">Quiron</span>
			<span class="info azulClaro" >Altere o conte&uacute;do do texto da p&aacute;gina sobre quiron.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoCampoQuiron" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoQuiron" type="button" class="btn btn-danger direita" value="fechar">
			<img align="left" src="${imagem}/quiron.jpg" class="esquerda icone50">
			<h2 align="center">Atualiza&ccedil;&atilde;o do conte&uacute;do da p&aacute;gina sobre Quiron</h2>
			<form action="<c:url value="/menu/quiron/atualizar"/>" method="post" class="paddingPadrao">			
								
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallQuiron" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumQuiron" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeQuiron" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeQuiron" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeQuiron" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaQuiron" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaQuiron" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaQuiron" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaQuiron" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaQuiron" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoQuiron.confirmado}">
						<label class="labelForm2"><input id="quironBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
				
				
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="texto.conteudo" >${sessaoUsuario.textoQuiron.conteudo}</textarea>				
				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
								
				<p class="paddingPadrao">
				<input id="btAtualizarTextoQuiron" type="submit" value="atualizar e destravar texto" class="btn btn-success direita" >			
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<!-- CONFIGURACOES DA CONTA -->
	<input id="flagEditarUsuario" type="hidden" value="${editarUsuario}"/> 
	<table class="tamanhoDefault">
		<tr>
			<td id="btAbrirConteudoConta" class="headerSlide">
			<span  class="esquerda">Configura&ccedil;&otilde;es da Conta</span>
			<span class="info azulClaro" >Verifique seus dados de acesso ao sistema.</span>
			</td>
		</tr>
		<tr>
			<td>			
			<div id="conteudoConta" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoConta" type="button" class="btn btn-danger direita" value="fechar">
			<img align="left" src="${imagem}/icone_setting.png" class="esquerda icone50">
			<h2 align="center">Configura&ccedil;&atilde;o dos dados da conta e acesso ao sistema</h2>
			<form action="<c:url value="/usuario/configuracao"/>" method="post" class="paddingPadrao">								
				
				<input type="hidden" name="usuario.uuid" value="${sessaoUsuario.usuario.uuid}" />
								
				<h3>Nome Completo:</h3>
				<c:if test="${not empty usuarioNomeBranco}">
				<label class="labelFormErro">${usuarioNomeBranco}</label>
				<input id="campoContaNome" type="text" class="areaTitulo bordaPadraoErro" name="usuario.nome" value="${sessaoUsuario.usuario.nome}" />
				</c:if>
				<c:if test="${empty usuarioNomeBranco}">
				<input id="campoContaNome" type="text" class="areaTitulo bordaPadrao" name="usuario.nome" value="${sessaoUsuario.usuario.nome}" />
				</c:if>
				
				<h3>Telefone:</h3>
				<c:if test="${not empty usuarioTelefoneBranco}">
				<label class="labelFormErro">${usuarioTelefoneBranco}</label>
				<input id="campoContaTelefone" type="text" class="areaTitulo bordaPadraoErro" name="usuario.telefone" value="${sessaoUsuario.usuario.telefone}" />
				</c:if>
				<c:if test="${empty usuarioTelefoneBranco}">
				<input id="campoContaTelefone" type="text" class="areaTitulo bordaPadrao" name="usuario.telefone" value="${sessaoUsuario.usuario.telefone}" />
				</c:if>
				
				
				<h3>Login:</h3>
				<c:if test="${not empty usuarioLoginBranco}">
				<label class="labelFormErro">${usuarioLoginBranco}</label>
				<input id="campoContaLogin" type="text" class="areaTitulo bordaPadraoErro" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				<c:if test="${empty usuarioLoginBranco}">
				<input id="campoContaLogin" type="text" class="areaTitulo bordaPadrao" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				
				
				<h3>Email de envio: <span class="info azulClaro">utilizado para enviar as notifica&ccedil;&otilde;es aos usu&aacute;rios.</span></h3>
				<div class="msgBorderInterno msgAlerta t100">
				<b>Aten&ccedil;&atilde;o !</b><br/>
				&Eacute; obrigat&oacute;rio o uso de um email fornecido pelo servidor (<i>site@quiron.psc.br</i>) para o funcionamento correto do site.
				</div>
				<p>
				<c:if test="${not empty usuarioErroEmail}">				
				<label class="labelFormErro">${usuarioErroEmail}</label>
				<input id="campoContaEmail" type="text" class="areaTitulo bordaPadraoErro" name="usuario.email" value="${sessaoUsuario.usuario.email}" />
				</c:if>				
				<c:if test="${empty usuarioErroEmail}">
				<input id="campoContaEmail" type="text" class="areaTitulo bordaPadrao" name="usuario.email" value="${sessaoUsuario.usuario.email}" />
				</c:if>
				</p>
				
				<h3>Senha:
				<label id="checkMostrarSenha" class="info azulClaro ponteiro"> Mostrar Senha</label>
				<label id="checkOcultarSenha" class="info azulClaro ponteiro"> Ocultar Senha</label>
				</h3>				
				<div class="msgBorderInterno msgAlerta t100">				
				<b>Lembrete !</b><br/>
				&Eacute; obrigat&oacute;rio que a senha seja a mesma do email cadastrado no servidor do site no site (<i>270879cm</i>).				
				</div>
				
				<c:if test="${not empty usuarioSenhaBranco}">				
				<label class="labelFormErro">${usuarioSenhaBranco}</label>
				<br/>
					<p>
					<input id="campoContaSenha" type="password" class="areaTitulo2 bordaPadraoErro" name="usuario.senha" value="${sessaoUsuario.usuario.senha}">
					<input id="campoContaSenhaTexto" type="text" class="areaTitulo2 bordaPadrao" value="${sessaoUsuario.usuario.senha}" readonly="readonly" disabled="disabled">
					</p>
				</c:if>				
				<c:if test="${empty usuarioSenhaBranco}">
					<p>
					<input id="campoContaSenha" type="password" class="areaTitulo2 bordaPadrao" name="usuario.senha" value="${sessaoUsuario.usuario.senha}">
					<input id="campoContaSenhaTexto" type="text" class="areaTitulo2 bordaPadrao" value="${sessaoUsuario.usuario.senha}" readonly="readonly" disabled="disabled">
					</p>
				</c:if>
				
				<h3>Email de recebimento: <span class="info azulClaro">utilizado para receber as notifica&ccedil;&otilde;es dos usu&aacute;rios.</span></h3> 	
				<table>
				<tr>
				<td align="left">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.emailAtivado}">
							<input type="checkbox" name="usuario.emailAtivado" checked="checked" />
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="usuario.emailAtivado" />
						</c:otherwise>
					</c:choose>				
				</td>
				<td align="left"><h3 class="info azulClaro letraPequena">Ativar o envio de email pelo site para os clientes e para o administrador dos eventos ocorridos no sistema.</h3></td>
				</tr>
				</table>
				<div class="msgBorderInterno msgAlerta t100">
				<b>Aten&ccedil;&atilde;o !</b><br/>
				&Eacute; obrigat&oacute;rio o uso de um email para o recebimento das notifica&ccedil;&otilde;es disparadas pelo site.
				</div>
				<p>
				<c:if test="${not empty usuarioErroEmailNotificacao}">				
				<label class="labelFormErro">${usuarioErroEmailNotificacao}</label>
				<input id="campoContaEmail" type="text" class="areaTitulo bordaPadraoErro" name="usuario.emailNotificacao" value="${sessaoUsuario.usuario.emailNotificacao}" />
				</c:if>				
				<c:if test="${empty usuarioErroEmailNotificacao}">
				<input id="campoContaEmail" type="text" class="areaTitulo bordaPadrao" name="usuario.emailNotificacao" value="${sessaoUsuario.usuario.emailNotificacao}" />
				</c:if>
				</p>	
				
				<p>
				<span id="linked">Linked</span> <span id="in">in</span>
				</p>
				<p>
				<input id="campoContaLinkedin" type="text" class="areaTitulo bordaPadrao" name="usuario.linkedin" value="${sessaoUsuario.usuario.linkedin}">
				</p>
				
				<!-- <p>http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364</p>
				<p>http://www.linkedin.com/pub/cesar-sousa-junior/66/583/a43</p>
				
				<textarea rows="10" cols="100">
				<iframe width="1000" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com.br/maps?f=q&amp;source=s_q&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+da+Concei%C3%A7%C3%A3o,+13,+Niter%C3%B3i+-+Rio+de+Janeiro&amp;aq=0&amp;oq=Rua+da+Concei%C3%A7%C3%A3o+13,+Niter%C3%B3i+-+Rio+de+Janeiro&amp;sll=-22.894233,-43.12092&amp;sspn=0.008441,0.009645&amp;ie=UTF8&amp;hq=&amp;hnear=R.+da+Concei%C3%A7%C3%A3o,+13+-+Centro,+Niter%C3%B3i+-+Rio+de+Janeiro,+24020-080&amp;t=m&amp;ll=-22.894204,-43.120909&amp;spn=0.027674,0.085831&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
				</textarea>
				 -->				
				
				<hr style="width: 100%; border: 1px dashed #CCCCCC;" />			
					
				<h3>Dados de localiza&ccedil;&atilde;o e configura&ccedil;&atilde;o do Google Maps</h3>
				
				<h3>Endere&ccedil;o:<span class="info azulClaro" >Entre com as informa&ccedil;&otilde;es que voc&ecirc; deseja que os clientes visualizem.</span></h3>
				<c:if test="${not empty usuarioLoginBranco}">
				<label class="labelFormEndereco">${usuarioLoginBranco}</label>
				<input id="campoContaEndereco" type="text" class="areaTitulo bordaPadraoErro" name="usuario.endereco" value="${sessaoUsuario.usuario.endereco}" />
				</c:if>
				<c:if test="${empty usuarioLoginBranco}">
				<input id="campoContaEndereco" type="text" class="areaTitulo bordaPadrao" name="usuario.endereco" value="${sessaoUsuario.usuario.endereco}" />
				</c:if>	
				
				<h3>Google Maps</h3>
				<table>
				<tr>
				<td align="left">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.mostrarMapa}">
							<input id="checkHabilitarMapa" type="checkbox" name="usuario.mostrarMapa" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="checkHabilitarMapa" type="checkbox" name="usuario.mostrarMapa" />
						</c:otherwise>
					</c:choose>				
				</td>
				<td align="left"><h3 class="info azulClaro letraPequena">Habilitar mapa com a visualiza&ccedil;&atilde;o do endere&ccedil;o na p&aacute;gina de contato do site.</h3></td>
				</tr>
				</table>
				
				<div id="divGeoLocalizacao">
				<div class="msgBorderInterno msgAlerta t100">
				Ao marcar a op&ccedil;&atilde;o de <b>visualiza&ccedil;&atilde;o com Google Maps</b> ser&aacute; habilitado para o usu&aacute;rio o mapa contendo o endere&ccedil;o da empresa. Para desabilitar esta funcionalidade mantenha a op&ccedil;&atilde;o desmarcada.
				</div>				
				<h3>Insira o HTML contendo a localiza&ccedil;&atilde;o do endere&ccedil;o.</h3>
				<textarea id="areaLocalizacaoMapa" rows="10" class="areaTitulo bordaPadrao" name="usuario.localizacao">${sessaoUsuario.usuario.localizacao}</textarea>
				</div>
							
				<p class="paddingPadrao">
				<input type="submit" value="atualizar" class="btn btn-success direita">				
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<!-- EDITAR CONTEUDO CONSTELACAO -->	
	<table class="tamanhoDefault">
		<tr>
			<td id="btAbrirConteudoConstelacao" class="headerSlide">
			<span  class="esquerda">Constela&ccedil;&otilde;es</span>
			<span class="info azulClaro" >Altere o conte&uacute;do dos textos da p&aacute;gina sobre constela&ccedil;&otilde;es.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoCampoConstelacao" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoConstelacao" type="button" class="btn btn-danger direita" value="fechar">
			<img align="left" src="${imagem}/fundoConstelacao.jpg" class="esquerda icone50">
			<h2 align="center">Atualiza&ccedil;&atilde;o do conte&uacute;do da p&aacute;gina Constela&ccedil;&otilde;es</h2>
			<img align="left" src="${imagem}/iconeEditarHover.png" class="esquerda icone50">
			
			<form action="<c:url value="/menu/constelacao/atualizar"/>" method="post" class="paddingPadrao">			
				
				<!-- <table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallQuiron" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumQuiron" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeQuiron" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeQuiron" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeQuiron" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaQuiron" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaQuiron" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaQuiron" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaQuiron" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaQuiron" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table> -->
				
				<%-- <p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoQuiron.confirmado}">
						<label class="labelForm2"><input id="quironBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p> --%>
				
				<h3>Texto Inicial:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.textoInicial" >${sessaoUsuario.constelacao.textoInicial}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
				
				<h3>Forma de Pagamento:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.formaPagamento" >${sessaoUsuario.constelacao.formaPagamento}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
				
				<h3>Texto Final:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.textoFinal" >${sessaoUsuario.constelacao.textoFinal}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
				
				<h3>Localiz&ccedil;&atilde;o:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.localizacao" >${sessaoUsuario.constelacao.localizacao}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
				
				<h3>Informa&ccedil;&otilde;es:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.informacao" >${sessaoUsuario.constelacao.informacao}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
				
				<h3>Dados Pessoais:</h3>
				<textarea id="campoConteudoQuiron" class="areaTexto h200 bordaPadrao" name="constelacao.dadosPessoais" >${sessaoUsuario.constelacao.dadosPessoais}</textarea>				
				<h4 class="azulClaro" align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
				</h4>
								
				<p class="paddingPadrao">
				<input id="btAtualizarTextoQuiron" type="submit" value="atualizar e destravar texto" class="btn btn-success direita" >			
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<table id="tabMenuPrincipal">
	<tr>
		<td align="center">
			<ul id="menu">
				<li>
					<img id="imglinkTerapeuta" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeFreud.png"/>
					<a id="linkEditarTerapeuta" href="">O Terapeuta</a></li>
				<li>
					<img id="imglinkPsicologia" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconePsicologiaHover.png"/>
					<a id="linkEditarPsicologia" href="">Psicologia</a></li>
				<li>
					<img id="imglinkEducacao" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeEducacaoHover.png"/>
					<a id="linkEditarEducacao" href="">Educa&ccedil;&atilde;o</a></li>
				<li>
					<img id="imglinkCultura" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeCulturaHover.png"/>
					<a id="linkEditarCultura" href="">Cultura</a></li>
				<li>
					<img id="imglinkOrientais" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeOrientalHover.png"/>
					<a id="linkEditarOrientais" href="">Artes Orientais</a></li>
			</ul>
		</td>
	</tr>
</table>	
	
	<table id="tabTerapeuta" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconeFreud.png"/>			
			<label class="tituloEdicao"> O Terapeuta </label>
			<h3>Altera&ccedil;&atilde;o das informa&ccedil;&otilde;es que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre o terapeuta.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="">			
			
			<form action="<c:url value="/usuario/atualizar/terapeuta"/>" method="post" class="paddingPadrao">
			
				<table class="largura80">
				<tr>
					<td>	
					<div align="left">		
						<img src="${imagem}/owner.jpg" class="destaqueFoto">
					</div>
					</td>
					<td>
					<h2>Alcindo Miguel Martins Filho.</h2>										
					<input id="edtTituloTerapeuta" type="text" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100" name="terapeuta.titulo" value="${sessaoUsuario.terapeuta.titulo}">
					</td>
				</tr>
				</table>
				
				<div class="bordaInferior">
				<h3>
					Texto com informa&ccedil;&otilde;es gerais. (at&eacute; 2000 caracteres).
				</h3>	
			
				<!-- <table id="tabelaTerapeuta" class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmall1Terapeuta" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMedium1Terapeuta" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLarge1Terapeuta" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLarge1Terapeuta" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLarge1Terapeuta" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallArea1Terapeuta" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumArea1Terapeuta" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeArea1Terapeuta" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeArea1Terapeuta" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeArea1Terapeuta" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table> -->						
													
				<textarea id="edtInfoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.informacao">${sessaoUsuario.terapeuta.informacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterInfoTerapeuta">2000</span></h4>	
				</div>
				
				<div class="bordaInferior">
				<h3>
					Texto com as forma&ccedil;&otilde;es. (at&eacute; 2000 caracteres).
				</h3>
									
				<!-- <table id="tabelaTerapeuta" class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmall2Terapeuta" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMedium2Terapeuta" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLarge2Terapeuta" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLarge2Terapeuta" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLarge2Terapeuta" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallArea2Terapeuta" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumArea2Terapeuta" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeArea2Terapeuta" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeArea2Terapeuta" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeArea2Terapeuta" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table> -->						
													
				<textarea id="edtFormacaoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.formacao">${sessaoUsuario.terapeuta.formacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterFormacaoTerapeuta">2000</span></h4>	
				</div>
				
				<div class="bordaInferior">
				<h3>
					&Aacute;reas de Atua&ccedil;&atilde;o: (at&eacute; 2000 caracteres).
				</h3>
				
				<span class="info azulClaro">Utilize o caracter ponto '.' para delimitar par&aacute;grafos. <b>Para a &uacute;ltima &Aacute;rea de Atua&ccedil;&atilde;o N&Atilde;O utilize ponto.</b> </span>	
			
				<!-- <table id="tabelaTerapeuta" class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmall3Terapeuta" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMedium3Terapeuta" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLarge3Terapeuta" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLarge3Terapeuta" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLarge3Terapeuta" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallArea3Terapeuta" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumArea3Terapeuta" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeArea3Terapeuta" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeArea3Terapeuta" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeArea3Terapeuta" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table> -->						
													
				<textarea id="edtAtuacaoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.atuacao">${sessaoUsuario.terapeuta.atuacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterAtuacaoTerapeuta">2000</span></h4>	
				</div>
				
				<div>
				<h3>
					&Aacute;reas de Tratamento: (at&eacute; 2000 caracteres).
				</h3>
				
				<span class="info azulClaro">Utilize o caracter ponto '.' para delimitar par&aacute;grafos. <b>Para a &uacute;ltima &Aacute;rea de Tratamento N&Atilde;O utilize ponto.</b> </span>	
							
				<!-- <table id="tabelaTerapeuta" class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmall4Terapeuta" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMedium4Terapeuta" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLarge4Terapeuta" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLarge4Terapeuta" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLarge4Terapeuta" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallArea4Terapeuta" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumArea4Terapeuta" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeArea4Terapeuta" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeArea4Terapeuta" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeArea4Terapeuta" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table> -->						
													
				<textarea id="edtTratamentoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.tratamento">${sessaoUsuario.terapeuta.tratamento}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterTratamentoTerapeuta">2000</span></h4>	
				</div>
				
				<p class="paddingPadrao">
				<input id="brAlterarDadosTerapeuta" type="submit" class="btn btn-success" value="Atualizar">
				<input id="btFecharEditarTerapeuta" type="button" class="btn btn-default" value="Cancelar">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>	
	
	<table id="tabPsicologia" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconePsicologiaHover.png"/>			
			<label class="tituloEdicao"> Psicologia </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre psicologia.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoPsicologia">						
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">			
			<form action="<c:url value="/menu/psicologia/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterPsicologia">3000</span> caracteres no texto sobre psicologia.
				</h3>	
			
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallPsicologia" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumPsicologia" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargePsicologia" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargePsicologia" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargePsicologia" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaPsicologia" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaPsicologia" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaPsicologia" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaPsicologia" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaPsicologia" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>			
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoPsicologia.confirmado}">
						<label class="labelForm2"><input id="psicologiaBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
													
				<textarea id="campoTextoPsicologia" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoPsicologia.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="brAlterarTxtPsicologia" type="submit"  class="btn btn-success" value="atualizar e destravar texto">
				<input id="btFecharEditarPsicologia" type="button" class="btn btn-default" value="Cancelar">
				</p>
			
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabEducacao" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemEducacao" class="imgMenuPrincipal" src="${imagem}/iconeEducacaoHover.png"/>			
			<label class="tituloEdicao"> Educa&ccedil;&atilde;o </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre educa&ccedil;&atilde;o.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoEducacao">			
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/educacao/atualizar" />" method="post" class="paddingPadrao">
				
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterEducacao">3000</span> caracteres no texto sobre Educa&ccedil;&atilde;o.
				</h3>
			
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallEducacao" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumEducacao" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeEducacao" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeEducacao" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeEducacao" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaEducacao" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaEducacao" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaEducacao" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaEducacao" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaEducacao" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoEducacao.confirmado}">
						<label class="labelForm2"><input id="educacaoBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
								
				<textarea id="campoTextoEducacao" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoEducacao.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarTxtEducacao" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarEducacao" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabCultura" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeCulturaHover.png"/>			
			<label class="tituloEdicao"> Cultura </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre cultura.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoCultura">
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/cultura/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterCultura">3000</span> caracteres no texto sobre cultura.
				</h3>
				
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallCultura" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumCultura" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeCultura" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeCultura" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeCultura" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaCultura" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaCultura" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaCultura" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaCultura" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaCultura" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoCultura.confirmado}">
						<label class="labelForm2"><input id="culturaBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
				
				<textarea id="campoTextoCultura" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoCultura.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarTxtCultura" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarCultura" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabArtesOrientais" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeOrientalHover.png"/>			
			<label class="tituloEdicao"> Artes Orientais </label>
			<div class="bordaPadrao" align="center">
				<h3>LOKAH SAMASTAH SUKHINO BHAVANTHU</h3>
				<h4 class="azulClaro">"Que todos os seres sejam felizes"</h4>
			</div>
			
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre artes orientais.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoArtesOrientais">
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/artesorientais/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterArtesOrientais">3000</span> caracteres no texto sobre artes orientais.
				</h3>
								
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallArtesOrientais" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumArtesOrientais" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeArtesOrientais" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeArtesOrientais" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeArtesOrientais" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaArtesOrientais" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaArtesOrientais" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaArtesOrientais" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaArtesOrientais" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaArtesOrientais" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoArtesOrientais.confirmado}">
						<label class="labelForm2"><input id="artesorientaisBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
				
				<textarea id="campoTextoOrientais" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoArtesOrientais.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarArtOriental" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarArtesOrientais" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
		
	<div align="center">	
	
	<div id="menuLink">		
			<ul id="menuRodape" >
				<li>
				<form action="<c:url value="/logout/site" />">
				<input type="submit" value="Site" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/blog" />" method="get">
				<input type="submit" value="Blog" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/resenha" />" method="get">
				<input type="submit" value="Resenhas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/constelacao" />" method="get">
				<input type="submit" value="Constelação" class="buttonFooter">
				</form>
				</li>				
				
				<li>
				<form action="<c:url value="/menu/link" />" method="get" >
				<input type="submit" value="Links" class="buttonFooter">
				</form>
				</li>				
				
				<li>
				<form action="<c:url value="/menu/cadastro" />" method="get" >
				<input type="submit" value="Cadastro" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/loja" />" method="get" >
				<input type="submit" value="Loja Virtual" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/erroAplicacao" />" method="get" >
				<input type="submit" value="ERRO" class="buttonFooter">
				</form>
				</li>
			</ul>		
				
		</div>
	</div>	
	
</div>
</div>

<div id="telaAguardeMenu">
	<div align="center">						
		<h3 class="paddingTelaAguarde">Neste momento o sistema esta notificando as pessoas da altera&ccedil;&atilde;o no texto.
		<br/>
		Esta opera&ccedil;&atilde;o pode levar alguns minutos porque v&aacute;rios emails est&atilde;o sendo enviados...</h3>			
		
		<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
