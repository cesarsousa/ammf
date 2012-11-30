
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<hr class="separador"  />

<div align="center">

<div class="tamanhoDefault alturaDefault">
	<div class="esquerda">
	<h2>Ol&aacute; ${sessaoUsuario.nome}</h2>
	</div>
	
	<div class="direita">
	<form action="<c:url value="/index/logout" />">
	<input type="submit" class="logout button" value="Sair">
	</form>	
	</div>
	
</div>

<div class="tamanhoDefault alturaDefault">
<p>
	<c:if test="${not empty mensagem}">
	<div id="boxMsgSucesso" class="msgBorder msgSucesso tamanhoEdicaoIndex ponteiro">${mensagem}</div>
	</c:if>
	
	<c:if test="${not empty mensagemErro}">
	<div id="boxMsgErro" class="msgBorder msgErro tamanhoEdicaoIndex ponteiro">${mensagemErro}</div>
	</c:if>
</p>
</div>

<div class="tamanhoDefault">

	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoIndex" type="button" class="button esquerda" value="Editar conte&uacute;do index" />
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
				<input type="submit" value="cadastrar" class="buttonCadastrar">				
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<hr class="separador"  />	
	
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
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">
						<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
						<span id="sizeSmallPsicologia" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumPsicologia" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargePsicologia" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargePsicologia" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargePsicologia" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class=esquerda>
						<span class="paddingPadrao azulClaro">Tamanho da area de digita&ccedil;&atilde;o:</span>
						<span id="sizeSmallAreaPsicologia" style="font-size: small;" class="ponteiro" >1</span>
						<span id="sizeMediumAreaPsicologia" style="font-size: medium;" class="ponteiro" >2</span>
						<span id="sizeLargeAreaPsicologia" style="font-size: large;" class="ponteiro" >3</span>
						<span id="sizeXLargeAreaPsicologia" style="font-size: x-large;" class="ponteiro" >4</span>
						<span id="sizeXxLargeAreaPsicologia" style="font-size: xx-large;" class="ponteiro" >5</span>
					</div>	
				</div>
				</div>
				
				<textarea id="campoTextoPsicologia" class="areaTexto h500 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoPsicologia.conteudo}</textarea>
				
				<p>
				<input type="submit" value="cadastrar" class="buttonCadastrar">
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
				<input type="submit" value="cadastrar" class="buttonCadastrar">
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
				<input type="submit" value="cadastrar" class="buttonCadastrar">
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
				<input type="submit" value="cadastrar" class="buttonCadastrar">
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<hr class="separador"  />
	
	<c:if test="${not empty mensagemMenuSecundario}">
	<div class="tamanhoDefault alturaDefault">
		
		<div id="boxMsgSucesso" class="msgBorder msgSucesso tamanhoEdicaoIndex ponteiro">${mensagemMenuSecundario}</div>
		<div id="espacador"></div>
		
	</div>
	</c:if>
	
	<div align="center">
	<div id="menuLink">		
			<ul id="menuRodape">
				<li>
				<form action="<c:url value="/index/logout/site" />">
				<input type="submit" value="Site" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form>
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
				<form>
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

<div id="espacadorRodape"></div>
<%@ include file="/footerFixed.jsp" %>