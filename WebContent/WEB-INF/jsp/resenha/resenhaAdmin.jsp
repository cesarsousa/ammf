<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty resenhaMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${resenhaMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty resenhaMensagemErro}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${resenhaMensagemErro} 
	</div>
</c:if>
<c:if test="${resenhaErroCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	Verifique campos obrigat&oacute;rios n&atilde;o preenchidos<br/>
	${a}${b}${c}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>RESENHA</h2>
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de resenhas.</span>

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
		<img id="btAddNovaResenha" alt="adicionar texto" title="adicionar resenha" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btBuscarResenha" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="" alt="listar todos os textos" title="listar todos os textos" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<!-- submit via javascript -->
<%-- <form id="formBlogListarTodos" action="<c:url value="/blog/listar" />" method="get"></form>
 --%>
<div class="separador"></div>

<!-- ADICIONAR UMA NOVA RESENHA -->
<input id="flagCadastrarResenhaVazia" type="hidden" value="${flagCadastrarResenhaVazia}" >
	
	<table id="tabNovaResenha" class="cardViewText">		
		<tr>
			<td>
			<div align="right">
			<input id="btFecharAddResenha" type="button" value="fechar" class="backVermelho button">
			</div>
			<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
			<h2 align="center">Nova Resenha</h2>
			
			<form id="formNovaResenha" action="<c:url value="/resenha/nova"/>" method="post" class="paddingPadrao">				
								
				<h3>T&iacute;tulo :</h3>
				<input id="" type="text" class="areaTitulo bordaPadrao corAzul" name="" />
					
				<h3>Autor :</h3>
				<input id="" type="text" class="areaTitulo bordaPadrao" name="" />	
								
				<h3>Coment&aacute;rio:</h3>
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">						
						<span id="sizeSmallResenhaNovo" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumResenhaNovo" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeResenhaNovo" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeResenhaNovo" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeResenhaNovo" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				<textarea id="textoComentarioResenha" class="areaTexto bordaPadrao" rows="20" name=""></textarea>		
				
				<p>
				<input id="btCadastrarResenha" type="submit" value="cadastrar" class="buttonCadastrar">
				<input id="btCancelarResenha" type="button" value="cancelar" class="button">				
				</p>
			</form>			
			</td>
		</tr>
	</table>

<!-- EDITAR COM CAMPO  DE BUSCA -->	
	<table id="divResenhaBuscarTexto" class="cardViewText">		
		<tr>
			<td valign="middle">
			<div align="right">
			<input id="btFecharEdtResenha" type="button" value="fechar" class="backVermelho button">
			</div>
			<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
			<h2 align="center">Buscar Resenha</h2>
			
			<form id="formResenhaBuscaTexto">
			<div align="center">
				<input id="campoBuscaTxtResenha" type="text" class="fundoLupa w500px bordaPadrao" />
				<p>
				<span class="info azulClaro" ><label id="labelBuscaResenha"></label></span>
				</p>
			</div>	
			</form>
			</td>
		</tr>		
	</table>

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
						<td class="headTabelaBlog1">a&ccedil;&otilde;es</td>						
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
<a name="editarTextoBlog"></a>
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
				
				<p>
				<input id="btCadEdtTexto" type="submit" value="confirmar atualização" class="buttonCadastrar">
				<input id="btBlogCancelEdtTexto" type="button" value="cancelar atualização" class="button">
				<input id="btBlogExcluirEdtTexto" type="button" value="Excluir este texto" class="backVermelho button">
				</p>
				
				</div>
			</form>
			<form id="formBtBlogExcluirEdtTexto" method="get"></form>			
			</td>
		</tr>
		<tr>
		<td class="paddingPadrao"><div class="separador"></div></td>
		</tr>
	</table>
</div>
	
</div> <!-- div center -->

<!-- LISTAR TODOS OS TEXTOS -->
<input id="flagAdmBlogListar" type="hidden" value="${flagAdmBlogListar}" />
<c:if test="${not empty textosBlog}">
<div id="divEditarBlogTodosTextos">
<div align="center">
<table class="tamanhoDefault">
	<tr>
		<td><label class="h1">Listar todos os textos</label></td>
	</tr>
</table>
</div>
<table class="display" id="example">
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

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
