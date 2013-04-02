<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>


<div align="center">

<h2>Blog do Miguel</h2>
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de textos.</span>

<c:if test="${not empty blogMensagemSucesso}">
<table class="tamanhoDefault">
	<tr>
	<td align="center">
	<div class="msgBorder msgSucesso">
		${blogMensagemSucesso} 
	</div>
</td>
</tr>
</table>
<div id="separador"></div>
</c:if>

<table class="tamanhoDefault">
	<tr>
	<td class="tdTableIcone">
	<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
	<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
	</form>
	</td>
	
	<td class="tdTableIcone">
	<div id="btAddTextoBlog" title="Adicionar novo texto" class="ponteiro esquerda"></div>
	</td>
	
	<td class="tdTableIcone">
	<div id="btEdtTextoBlog" title="Editar um texto" class="ponteiro esquerda"></div>
	</td>
	
	</tr>
</table>

<div class="separador"></div>

<!-- ADICIONAR UM NOVO TEXTO -->
<div id="divBlogNovoTexto">	
	
	<table class="tamanhoDefault">
		<tr>
		<td><label class="h1">Novo Texto</label></td>
		</tr>
		<tr>
			<td>
			<div class="cartao tamanhoEdicaoIndex" >
			<form id="formBlogNovoTexto" action="<c:url value="/blog/novo"/>" method="post" class="paddingPadrao">				
								
				<h3>T&iacute;tulo :</h3>
				<input id="blogTituloNovoTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" />
					
				<h3>Autor :</h3>
				<input id="blogAutorNovoTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="Alcindo Miguel Martins Filho"/>	
								
				<h3>Texto:</h3>
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">						
						<span id="sizeSmallBlogNovo" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumBlogNovo" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeBlogNovo" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeBlogNovo" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeBlogNovo" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				<textarea id="blogConteudoNovoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo"></textarea>		
				
				<p>
				<input id="btCadBlogTexto" type="submit" value="cadastrar" class="buttonCadastrar">
				<input id="btBlogCancelNovoTexto" type="button" value="cancelar" class="button">				
				</p>
			</form>			
			</div>
			</td>
		</tr>
		<tr>
		<td class="paddingPadrao"><div class="separador"></div></td>
		</tr>
	</table>
</div>

<!-- BUSCA DE TEXTO PELO TITULO -->
<div id="divBlogBuscarTexto">
	
	<table class="tamanhoDefault">
		<tr>
		<td><label class="h1">Buscar Texto</label></td>
		</tr>
		<tr>
			<td valign="middle">
			<form id="formBlogBuscaTexto">
			<input id="campoBuscaTxtEdtBlog" type="text" class="fundoLupa sizebtGenerico areaTitulo3 bordaPadrao esquerda" />
			<label id="labelBuscaTexto"></label>	
			<input id="btFecharBuscaTextoBlog" type="button" class="button direita" value="fechar">
			</form>
			</td>
		</tr>		
	</table>
</div>
<!-- RESULTADO DA BUSCA DE TEXTO PELO TITULO -->
<div id="resultBuscaTxtBlog">	
	<table class="tamanhoDefault">
		<tr>
			<td colspan="3">
			<ul>
			<li><span class="info azulClaro" >Clique no t&iacute;tulo do texto para editar</span></li>
			</ul>
			</td>			
		</tr>
		<tr>
			<td>
			<div class="cartao" >							
				<table width="100%">
					<thead>
						<tr>						
						<td class="headTabelaBlog2">data da postagem</td>
						<td class="headTabelaBlog1">t&iacute;tulo</td>
						<td class="headTabelaBlog1">Conte&uacute;do</td>						
						</tr>
					</thead>
						
					<tbody id="tabEdtTextoBlog">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
		<tr>
		<td class="paddingPadrao"><div class="separador"></div></td>
		</tr>
	</table>
</div>

<!-- EDITAR UM TEXTO -->
<div id="divBlogEditarTexto">	
	<table class="tamanhoDefault">
		<tr>
		<td><label class="h1">Editar Texto</label></td>
		</tr>
		<tr>
			<td>
			
			<form id="formBlogEditarTexto" action="<c:url value="/blog/atualiza"/>" method="post" class="paddingPadrao">
				<div class="cartao tamanhoEdicaoIndex" >
				<input id="blogEdtUuidTexto" type="hidden" name="texto.uuid" />				
								
				<h3>T&iacute;tulo :</h3>
				<input id="blogEdtTituloTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" />
					
				<h3>Autor :</h3>
				<input id="blogEdtAutorTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor"/>	
								
				<h3>Texto:</h3>
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">						
						<span id="sizeSmallBlogEdit" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumBlogEdit" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeBlogEdit" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeBlogEdit" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeBlogEdit" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				<textarea id="blogEdtConteudoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo"></textarea>		
				</div>
				<div class="cartao tamanhoEdicaoIndex" style="background: #CCCCCC; padding-top: 20px; padding-bottom: 20px;">
				<input id="btCadEdtTexto" type="submit" value="confirmar atualização" class="buttonCadastrar">
				<input id="btBlogCancelEdtTexto" type="button" value="cancelar atualização" class="button">
				<input id="btBlogExcluirEdtTexto" type="button" value="Excluir este texto" class="backVermelho button">
				</div>
				
			</form>			
			</td>
		</tr>
		<tr>
		<td class="paddingPadrao"><div class="separador"></div></td>
		</tr>
	</table>
</div>
	
</div> <!-- div center -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
