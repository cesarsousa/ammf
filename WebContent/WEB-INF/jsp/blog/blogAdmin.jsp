<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty blogMensagemSucesso}">
	<div class="msgBorder msgSucesso">
		${blogMensagemSucesso} 
	</div>
	<div id="separador"></div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>Blog do Miguel</h2>

<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li class="itemMenuPrincipal">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
	</li>
	<li>
		<img id="btAddTextoBlog" alt="adicionar texto" title="adicionar texto" src="${imagem}/iconeAddHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btEdtTextoBlog" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btListarTextosBlog" alt="" title="" src="${imagem}/iconeListarHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<!-- submit via javascript -->
<form id="formBlogListarTodos" action="<c:url value="/blog/listar" />" method="get"></form>

<div class="separador"></div>

<!-- ADICIONAR UM NOVO TEXTO -->
<table id="tdNovoBlog" class="cardViewText">		
	<tr>
		<td >
		<h2>Novo Texto</h2>
		<div align="right">
		<input id="btFecharAddTextoBlog" type="button" value="fechar" class="backVermelho button">
		</div>
		<form id="formBlogNovoTexto" action="<c:url value="/blog/novo"/>" method="post">				
			 				
			<h3>T&iacute;tulo :</h3>
			<input id="blogTituloNovoTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" />
				
			<h3>Autor :</h3>
			<input id="blogAutorNovoTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="Alcindo Miguel Martins Filho"/>	
							
			<h3>Texto:</h3>												
			
			<table width="100%">
				<tr>
				<td><span id="sizeSmallBlogNovo" style="font-size: small;" class="ponteiro" >A</span></td>
				<td><span id="sizeMediumBlogNovo" style="font-size: medium;" class="ponteiro" >A</span></td>
				<td><span id="sizeLargeBlogNovo" style="font-size: large;" class="ponteiro" >A</span></td>
				<td><span id="sizeXLargeBlogNovo" style="font-size: x-large;" class="ponteiro" >A</span></td>
				<td><span id="sizeXxLargeBlogNovo" style="font-size: xx-large;" class="ponteiro" >A</span></td>
				
				<td><span id="sizeSmallAreaBlogNovo" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeMediumAreaBlogNovo" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeLargeAreaBlogNovo" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeXLargeAreaBlogNovo" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeXxLargeAreaBlogNovo" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
				</tr>				
			</table>	
					
			<textarea id="blogConteudoNovoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo"></textarea>		
			
			<p>
			<input id="btCadBlogTexto" type="submit" value="cadastrar" class="buttonCadastrar">
			<input id="btBlogCancelNovoTexto" type="button" value="cancelar" class="button">				
			</p> 
		</form>			
		
		</td>
	</tr>		
</table>

<!-- EDITAR COM CAMPO DE BUSCA -->
<table id="blogAreaBusca" class="cardViewText">		
	<tr>
		<td  valign="middle" style="padding-left: 50px;">
		<h2>Editar Texto</h2>
		<div align="right">
		<input id="btFecharEdtTextoBlog" type="button" value="fechar" class="backVermelho button">
		</div>
		<form id="formBlogBuscaTexto">
		<input id="campoBuscaTxtEdtBlog" type="text" class="fundoLupa sizebtGenerico areaTitulo3 bordaPadrao esquerda" />
		
		<span class="info azulClaro" ><label id="labelBuscaTexto"></label></span>
		
		</form>
		</td>
	</tr>
	<tr id="resultBuscaTxtBlog">
		<td>
			<br/>
			<table width="100%">
				<thead>
					<tr>						
					<td class="headTabelaBlog2">data da postagem</td>
					<td class="headTabelaBlog1">t&iacute;tulo</td>
					<td class="headTabelaBlog1">Conte&uacute;do</td>
					<td class="headTabelaBlog1">a&ccedil;&otilde;es</td>						
					</tr>
				</thead>
					
				<tbody id="tabEdtTextoBlog">						
				</tbody>
				
			</table>			
		</td>
	</tr>
	
	<tr id="divBlogEditarTexto">
	<td>
		<!-- AREA DE EDICAO DE UM TEXTO -->
		<hr class="hrClass">
		<a name="editarTextoBlog"></a>
		
		<div align="right">
		<input id="btFecharEdtEdtTextoBlog" type="button" value="fechar" class="backVermelho button">
		</div>
		
		<h2>Editar Texto</h2>
		<form id="formBlogEditarTexto" action="<c:url value="/blog/atualiza"/>" method="post">
							
			<input id="blogEdtUuidTexto" type="hidden" name="texto.uuid" />				
							
			<h3>T&iacute;tulo :</h3>
			<input id="blogEdtTituloTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" />
				
			<h3>Autor :</h3>
			<input id="blogEdtAutorTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor"/>	
							
			<h3>Texto:</h3>
			
			<table width="100%">
				<tr>
				<td><span id="sizeSmallBlogEdit" style="font-size: small;" class="ponteiro" >A</span></td>
				<td><span id="sizeMediumBlogEdit" style="font-size: medium;" class="ponteiro" >A</span></td>
				<td><span id="sizeLargeBlogEdit" style="font-size: large;" class="ponteiro" >A</span></td>
				<td><span id="sizeXLargeBlogEdit" style="font-size: x-large;" class="ponteiro" >A</span></td>
				<td><span id="sizeXxLargeBlogEdit" style="font-size: xx-large;" class="ponteiro" >A</span></td>
				
				<td><span id="sizeSmallAreaBlogEdit" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeMediumAreaBlogEdit" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeLargeAreaBlogEdit" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeXLargeAreaBlogEdit" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
				<td><span id="sizeXxLargeAreaBlogEdit" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
				</tr>				
			</table>				
						
			<textarea id="blogEdtConteudoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo"></textarea>		
			
			<p>
			<input id="btCadEdtTexto" type="submit" value="confirmar atualização" class="buttonCadastrar">
			<input id="btBlogCancelEdtTexto" type="button" value="cancelar atualização" class="button">
			<input id="btBlogExcluirEdtTexto" type="button" value="Excluir este texto" class="backVermelho button">
			</p>
						
		</form>
		<form id="formBtBlogExcluirEdtTexto" method="get"></form>			
	</td>
	</tr>		
</table>

<!-- LISTAR TODOS OS TEXTOS -->
<input id="flagTextosblog" type="hidden" value="${flagTextosblog}">
<table id="divEditarBlogTodosTextos" class="fullSize">	
	<tr>
	<td>
	<div align="right">		
	<input id="btBlogFecharTextos" type="button" value="fechar" class="backVermelho button">
	</div>
	<c:if test="${empty textosBlog}">
	<h3>N&atilde;o existem textos cadastrados</h3>
	</c:if>
	<c:if test="${not empty textosBlog}">
	<h3 align="center">Textos Cadastrados.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Autor</th>
				<th class="metadado">T&iacute;tulo</th>
				<th class="metadado">Texto</th>
				<th class="metadado" style="width: 160px;">Postagem</th>
				<th class="metadado" style="width: 80px;">A&ccedil;&atilde;o</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${textosBlog}" var="texto">
				<tr class="zebrado">
					<td class="infoTabela">${texto.autor}</td>
					<td class="infoTabela metadado">${texto.titulo}</td>
					<td class="infoTabela">
						<c:set var="origem"	value="${texto.conteudo}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>...</td>
					<td class="infoTabela" style="width: 160px;"><b>${texto.dataFormatada}</b></td>
					<td class="infoTabelaData" style="width: 80px;">
						<a id="linkPadrao" class="ponteiro" href="#editarTextoBlog" onclick="visualizarTextoParaEdicao('${texto.uuid}')"><img class="ponteiro icone" alt="editar" src="../image/iconeEditarHover.png" title="editar este texto"></a>
						<a href="<c:url value="/blog/remover/${texto.uuid}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir texto" title="excluir texto" src="${imagem}/icone_excluir.png"></a>
						</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>

</div> <!-- div center -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>