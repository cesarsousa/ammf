
<div class="msgBorder msgInfo">
ADMINISTRADOR - Voc&ecirc; est&aacute; logado como ${sessaoUsuario.usuario.nome} (${sessaoUsuario.usuario.email}). <span id="btLogout">Sair</span>
<form id="formLogout" action="<c:url value="/logout" />"></form>
</div>

<c:if test="${not empty mensagem}">
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagem}</div>
</c:if>

<c:if test="${not empty mensagemMenuSecundario}">		
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagemMenuSecundario}</div>
</c:if>
	
<c:if test="${not empty mensagemErro}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">${mensagemErro}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
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

	<!-- EDITAR CONTEUDO INDEX -->
	<table class="tamanhoDefault">
		<tr>
			<td id="btAbrirConteudoIndex" class="headerSlide">
			<span  class="esquerda">Editar conte&uacute;do index</span>
			<span class="info azulClaro" >Altere o nome do autor e a frase que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina inicial.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoIndex" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoIndex" type="button" class="button direita" value="fechar">
			<form action="<c:url value="/menu/index/atualizar"/>" method="post" class="paddingPadrao">			
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">
						<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
						<span id="sizeSmallIndex" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumIndex" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeIndex" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeIndex" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeIndex" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>				
								
				<h3>Frase:</h3>
				<textarea id="campoFraseIndex" class="areaTexto h50 bordaPadrao" name="texto.conteudo" maxlength="255">${sessaoUsuario.textoIndex.conteudo}</textarea>				
				
				<p>
				<h3>Autor:</h3>
				<input id="campoAutorFraseIndex" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="${sessaoUsuario.textoIndex.autor}">
				</p>
				
				<p>
				<input id="btAtualizarTextoIndex" type="submit" value="atualizar" class="buttonCadastrar" >			
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
			<input id="btFecharConteudoConta" type="button" class="button direita" value="fechar">
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
				
				
				<h3>Login:</h3>
				<c:if test="${not empty usuarioLoginBranco}">
				<label class="labelFormErro">${usuarioLoginBranco}</label>
				<input id="campoContaLogin" type="text" class="areaTitulo bordaPadraoErro" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				<c:if test="${empty usuarioLoginBranco}">
				<input id="campoContaLogin" type="text" class="areaTitulo bordaPadrao" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				
				
				<h3>Email:</h3>
				<div class="msgBorder msgAlerta t100">
				<b>Aten&ccedil;&atilde;o !</b><br/>
				&Eacute; obrigat&oacute;rio o uso de um email do Google (<i>seu_email@gmail.com</i>) para o funcionamento correto do site.
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
				<div class="msgBorder msgAlerta t100">				
				<b>Lembrete !</b><br/>
				&Eacute; obrigat&oacute;rio que a senha seja a mesma do gmail cadastrado no site.				
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
				
				<p>
				<span id="linked">Linked</span> <span id="in">in</span>
				</p>
				<p>
				<input id="campoContaLinkedin" type="text" class="areaTitulo bordaPadrao" name="usuario.linkedin" value="${sessaoUsuario.usuario.linkedin}">
				</p>			
								
				<p>
				<input type="submit" value="atualizar" class="buttonCadastrar">				
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>	
	
	<table id="tamanhoDefault" >
		<tr>
			<td>
				<ul id="menu">
					<li><a id="linkEditarPsicologia" href="">Psicologia</a></li>
					<li><a id="linkEditarEducacao" href="">Educa&ccedil;&atilde;o</a></li>
					<li><a id="linkEditarCultura" href="">Cultura</a></li>
					<li><a id="linkEditarOrientais" href="">Artes Orientais</a></li>
				</ul>
			</td>
		</tr>		
	</table>	
	
	
	<table id="tabPsicologia" class="tamanhoDefault">
		<tr>
			<td>
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconePsicologia.png"/>			
			<label class="tituloEdicao"> Psicologia </label>
			<span class="info azulClaro" >Altere o texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre psicologia.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoPsicologia" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharEditarPsicologia" type="button" class="button direita" value="fechar">
						
			<form action="<c:url value="/menu/psicologia/atualizar" />" method="post" class="paddingPadrao">			
			
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
								
				<textarea id="campoTextoPsicologia" class="areaTexto h500 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoPsicologia.conteudo}</textarea>
				
				<p>
				<input id="brAlterarTxtPsicologia" type="submit" value="atualizar" class="buttonCadastrar">
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabEducacao" class="tamanhoDefault">
		<tr>
			<td>
			<img id="imagemEducacao" class="imgMenuPrincipal" src="${imagem}/iconeEducacao.png"/>			
			<label class="tituloEdicao"> Educa&ccedil;&atilde;o </label>
			<span class="info azulClaro" >Altere o texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre educa&ccedil;&atilde;o.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoEducacao" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharEditarEducacao" type="button" class="button direita" value="fechar">
			<form action="<c:url value="/menu/educacao/atualizar" />" method="post" class="paddingPadrao">
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">
						<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
						<span id="sizeSmallEducacao" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumEducacao" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeEducacao" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeEducacao" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeEducacao" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				
				<textarea id="campoTextoEducacao" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoEducacao.conteudo}</textarea>
				
				<p>
				<input id="btAlterarTxtEducacao" type="submit" value="atualizar" class="buttonCadastrar">
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabCultura" class="tamanhoDefault">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeCultura.png"/>			
			<label class="tituloEdicao"> Cultura </label>
			<span class="info azulClaro" >Altere o texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre cultura.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoCultura" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharEditarCultura" type="button" class="button direita" value="fechar">
			<form action="<c:url value="/menu/cultura/atualizar" />" method="post" class="paddingPadrao">
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">
						<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
						<span id="sizeSmallCultura" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumCultura" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeCultura" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeCultura" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeCultura" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				
				<textarea id="campoTextoCultura" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoCultura.conteudo}</textarea>
				
				<p>
				<input id="btAlterarTxtCultura" type="submit" value="atualizar" class="buttonCadastrar">
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabArtesOrientais" class="tamanhoDefault">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeOriental.png"/>			
			<label class="tituloEdicao"> Artes Orientais </label>
			<span class="info azulClaro" >Altere o texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre artes orientais.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoArtesOrientais" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharEditarArtesOrientais" type="button" class="button direita" value="fechar">
			<form action="<c:url value="/menu/artesorientais/atualizar" />" method="post" class="paddingPadrao">
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">
						<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
						<span id="sizeSmallArtesOrientais" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumArtesOrientais" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeArtesOrientais" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeArtesOrientais" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeArtesOrientais" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				
				<textarea id="campoTextoArtesOrientais" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoArtesOrientais.conteudo}</textarea>
				
				<p>
				<input id="btAlterarArtOriental" type="submit" value="atualizar" class="buttonCadastrar">
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<div align="center">
	<div id="menuLink">		
			<ul id="menuRodape">
				<li>
				<form action="<c:url value="/logout/site" />">
				<input type="submit" value="Site" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/blog/editar" />" method="get">
				<input type="submit" value="Blog" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Resenhas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Consultas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Calendario" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Links" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/depoimentos" />" method="get" >
				<input type="submit" value="Depoimentos" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Cursos" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/cadastro" />" method="get" >
				<input type="submit" value="Cadastro" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Contato" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="Loja Virtual" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
				<input type="submit" value="FAQ" class="buttonFooter">
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
		<h3>Por favor, aguarde...</h3>
		<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>