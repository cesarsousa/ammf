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
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de textos.</span>

<table class="tamanhoDefault">
	<tr>
	<td class="tdTableIcone">
	<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
	<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
	</form>
	</td>	
	</tr>
</table>

<!-- submit via javascript -->
<form id="formBlogListarTodos" action="<c:url value="/blog/listar" />" method="get"></form>

<div class="separador"></div>

<div style="width: 100%">

	<!-- ADICIONAR UM NOVO TEXTO -->
	<table class="cardViewText">
		<tr>
			<td>
			<div id="btAddTextoBlog" title="Adicionar novo texto" class="ponteiro esquerda"></div>
			<h2>Novo Texto</h2>			
			</td>
		</tr>
		<tr>
			<td id="tdNovoBlog">
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
	
	<br/>
	
	<!-- EDITAR COM CAMPO DE BUSCA -->
	<table class="cardViewText">
		<tr>
			<td>
			<div id="btEdtTextoBlog" title="Editar um texto" class="ponteiro esquerda"></div>
			<h2>Editar Texto</h2>
			</td>
		</tr>
		<tr id="blogAreaBusca" >
			<td  valign="middle" style="padding-left: 50px;">
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
	
	<br/>
		
	<!-- LISTAR TODOS OS TEXTOS -->
	<table class="cardViewText">
		<tr>
			<td>
			<div id="btListarTextosBlog" title="Listar todos" class="ponteiro esquerda"></div>
			<h2>Listar todos os textos</h2>
			</td>
		</tr>
		<tr id="divEditarBlogTodosTextos">
		<td>
		<c:if test="${not empty textosBlog}">
		<div id="divEditarBlogTodosTextos">
		<div align="right">
		<input id="btBlogFecharTextos" type="button" value="fechar" class="backVermelho button">
		</div>
		<table class="display cardViewText superFooter bordaLateral" id="example">
			<thead align="left">
				<tr>
					<th class="metadado">Autor</th>
					<th class="metadado">T&iacute;tulo</th>
					<th class="metadado">Texto</th>
					<th class="metadado">Postagem</th>			
				</tr>
			</thead>
			<tbody>
		 		<c:forEach items="${textosBlog}" var="texto">
					<tr class="zebrado">
						<td class="infoTabela">${texto.autor}</td>
						<td class="infoTabela metadado ponteiro">
						<a class="infoTabela metadado" href="#editarTextoBlog" href="#lerTexto" onclick="visualizarTextoParaEdicao('${texto.uuid}')">${texto.titulo}</a>
						<td class="infoTabela">
							<c:set var="origem"	value="${texto.conteudo}"/>
							<c:out value="${fn:substring(origem,0,50)}"/>...</td>
						<td class="infoTabela"><b>${texto.dataFormatada}</b></td>
					</tr>			
				</c:forEach>		
			</tbody>			
		</table>
		</div>
		</c:if>
		</td>
		</tr>
	</table>	
</div>
	
</div> <!-- div center -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
