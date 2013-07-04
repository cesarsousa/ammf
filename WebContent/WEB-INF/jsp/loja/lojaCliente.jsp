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
				About
			</a>
		</li>
		<li class="tab3">
			<a class="tab3 tab">
				Blog
			</a>
		</li>
		<li class="tab4">
			<a class="tab4 tab">
				Career
			</a>
		</li>
		<li class="tab5">
			<a class="tab5 tab">
				Contact
			</a>
		</li>
		<li class="tab6">
			<a class="tab6 tab">
				News
			</a>
		</li>
		<li class="tab7">
			<a class="tab7 tab">
				Events
			</a>
		</li>
	</ul>
	<div class="tab1 tabsContent">
		<div class="paddingPadrao">
		<h3>Livros Publicados</h3>
		
		<div class="cartao paddingPadrao">		
			<table width="100%">
			<tr>
			<td width="120px"  align="left">
			<img src="${imagem}/livro_lendoJoseSaramago.png" class="fotoLivro">			
			</td>
			
			<td valign="top">
			<p class="titulo" >Lendo José Saramago - Levantando do Chão</p>
			<p class="autor" >Alcindo Miguel Martins Filho</p>
			<p class="titulo azulClaro" >R$ 30,00</p>
			
			<a href="<c:url value="/downloadboleto"></c:url>">			
			<div class="divComprarLivro">
				COMPRAR
				<img src="${imagem}/iconeBoleto.gif">
			</div>
			</a>
			
			</td>		
			</tr>
			</table>
			
			<table class="tabLivro bordaPadrao">
			<thead>
			<tr>
			<td colspan="2" id="btAbrirInfoLivro">INFORMA&Ccedil;&Otilde;ES DO PRODUTO</td>
			</tr>
			</thead>
			
			<tbody id="tabInformacaoLivro">
			
			<tr>
			<td colspan="2">
			<input id="btFecharInfoLivro" type="button" class="button direita" value="fechar"/>
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
		</div>
		
		</div>
	</div>
	
	
	
	<!-- tab 2 -->
	<div class="tab2 tabsContent">
		<div>About content goes here!</div>
	</div><!-- end of t2 -->
	<!-- tab 3 -->
	<div class="tab3 tabsContent">
		<div>Blog content goes here!</div>
	</div><!-- end of t3 -->
	<!-- tab 4 -->
	<div class="tab4 tabsContent">
		<div>Career content goes here!</div>
	</div><!-- end of t4 -->
	<!-- tab 5 -->
	<div class="tab5 tabsContent">
		<div>Contact content goes here!</div>
	</div><!-- end of t5 -->
	<!-- tab 6 -->
	<div class="tab6 tabsContent">
		<div>News content goes here!</div>
	</div><!-- end of t6 -->
	<!-- tab 7 -->
	<div class="tab7 tabsContent">
		<div>Events content goes here!</div>
	</div><!-- end of t7 -->
</div><!-- htmltabs ends here-->	
</div>	
	
<br/>
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
