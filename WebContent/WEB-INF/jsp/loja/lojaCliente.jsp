<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty msgLojaCliente}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
	${msgLojaCliente}
	</div>
</c:if>
<c:if test="${not empty msgErroLojaCliente}">
	<div id="mensagemErroContato" class="msgBorder msgErro ponteiro closeClick">
	${msgErroLojaCliente}
	</div>
</c:if>

<%@ include file="/headerSite.jsp"%>

<div id="divPgLojaCliente" align="center">

<%@ include file="/menuPrincipal.jsp" %>

<h2>Loja Virtual</h2>

<div class="mainContainer">
<div class="htmltabs">
	<!-- The tabs -->
	<ul class="tabs">
		<li class="tab1">
			<a class="tab1 tab">
				Livros
			</a>
		</li>
		<li class="tab2">
			<a class="tab2 tab">
				Textos
			</a>
		</li>
		<li class="tab3">
			<a class="tab3 tab">
				Cursos
			</a>
		</li>
	</ul>
	<div class="tab1 tabsContent">
		<div class="paddingPadrao">
		<h3>LIVROS PUBLICADOS</h3>
		
			<table width="80%" class="cartao bordaPadrao paddingPadrao ">
			<tr>
			<td width="120px"  align="left">
			<img src="${imagem}/livro_lendoJoseSaramago.png" class="fotoLivro">			
			</td>
			
			<td valign="top">
			<p class="titulo" >Lendo José Saramago - Levantando do Chão</p>
			<p class="autor" >Alcindo Miguel Martins Filho</p>
			<p class="fonteSuperGrande titulo azulClaro" >R$ 30,00</p>
			
			
			<form id="formDownloadBoleto" action="<c:url value="/downloadboleto"></c:url>" method="get"></form>
			<div align="right">
				<img id="btInformacaoLivro" class="ponteiro destaqueImage" src="${imagem}/iconeInformacoes.jpg">
				<img id="btComprarLivro" class="ponteiro destaqueImage" src="${imagem}/iconeComprar.jpg">
			</div>
			
			</td>		
			</tr>
			
			<tr><td colspan="2">			
			<table id="tabInformacaoLivro" class="tabLivro bordaPadrao">
			<thead>
			<tr>
			<td colspan="2"><input id="btFecharInfoLivro" type="button" class="button" value="fechar informações sobre o produto"/></td>			
			</tr>			
			</thead>
			
			<tbody>			
			<tr>
			<td colspan="2">
			</td>
			</tr>
			
			<tr>
			<td class="tabTitulo">Sinopse</td>
			<td class="tabDescricao">${livro.sinopse}</td>
			</tr>
			<tr>
			<td class="tabTitulo">T&iacute;tulo </td>
			<td class="tabDescricao">${livro.titulo}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Subt&iacute;tulo </td>
			<td class="tabDescricao">${livro.subtituto}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Editora</td>
			<td class="tabDescricao">${livro.editora}</td>
			</tr>
			<tr>
			<td class="tabTitulo">ISBN</td>
			<td class="tabDescricao">${livro.isbn}</td>
			</tr>
			<tr>
			<td class="tabTitulo">N&ordm; de p&aacute;ginas</td>
			<td class="tabDescricao">${livro.paginas}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Edi&ccedil;&atilde;o </td>
			<td class="tabDescricao">${livro.edicao}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Ano</td>
			<td class="tabDescricao">${livro.ano}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Assunto</td>
			<td class="tabDescricao">${livro.assunto}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Idioma</td>
			<td class="tabDescricao">${livro.idioma}</td>
			</tr>
			<tr>
			<td class="tabTitulo">C&oacute;digo de barras </td>
			<td class="tabDescricao">${livro.Barra}</td>
			</tr>
			<tr>
			<td class="tabTitulo">Preco</td>
			<td class="tabDescricao">${livro.precoFormatado}</td>
			</tr>
						
			</tbody>
			</table>
			
			</td></tr>			
			</table>
		
		</div>
	</div>
	
	
	
	<!-- tab 2 -->
	<div class="tab2 tabsContent">
		<div>About content goes here!</div>
	</div>
	
	<!-- tab 3 -->
	<div class="tab3 tabsContent">
		<div>Blog content goes here!</div>
	</div>
	
</div><!-- htmltabs ends here-->	
</div>	
	
</div> <!-- centralizacao -->

<div id="telaAguardeLojaCliente">
	<div align="center">		
		<h2>Loja Virtual</h2>		
		<h3 class="paddingTelaAguarde">Sua solicita&ccedil;&atilde;o est&aacute; sendo enviada. Esta opera&ccedil;&atilde;o pode levar alguns segundos. </h3>
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>		
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
