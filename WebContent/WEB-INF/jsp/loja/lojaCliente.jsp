<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div class="jumbotron">
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center">
<h1>Loja Virtual</h1>
<h2>livros</h2>
</div>
</div>


<c:if test="${not empty msgLojaCliente}">
<div align="center">
	<div class="msgBorder msgSucesso ponteiro closeClick">
	${msgLojaCliente}
	</div>
</div>
</c:if>

<c:if test="${not empty msgErroLojaCliente}">
<div align="center">
	<div id="mensagemErroContato" class="msgBorder msgErro ponteiro closeClick">
	${msgErroLojaCliente}
	</div>
</div>
</c:if>


<div id="divPgLojaCliente" align="center">

<c:if test="${flagRequestLivroEmail}">
<div align="center" class="cardViewText bordaPadrao paddingPadrao ">
	<table >
		<tr>
		<td width="120px"  align="left">				
		
			<a href="<c:url value="/loja/visualizador/${livro.uuid}" />" rel="prettyPhoto[livroRequest]" title="${resenha.titulo}">
				<img src="<c:url value="/loja/visualizador/${livro.uuid}" />" class="fotoLivro">
			</a>						
		
		</td>
		
		<td valign="top" class="paddingPadrao">
		<p class="titulo" >${livro.titulo}<br/><span class="subtitulo" >${livro.subtitulo}</span></p>
		<p class="autor" >${livro.autor}</p>
		<p class="fonteSuperGrande titulo azulClaro" >R$ ${livro.precoFormatado}</p>
		</td>
		
		<td valign="bottom">		
			<div align="right">
				<p class="autor" ><b>Data da Oferta: ${livro.dataFormatada}</b></p><br/>			
			</div>		
		</td>		
		</tr>
		
		<tr>
		<td colspan="3" class="paddingPadrao">			
		<table id="tabInfoRequestLivro${livro.uuid}" class="tabLivro">
			
		<tbody>
		<tr >
			<td class="paddingPadrao">
			<label class="tabTitulo" style="font-size: large;">Sinopse</label>
			<p class="tabDescricao">${livro.sinopse}</p>
		
			<label class="tabTitulo" style="font-size: large;">Informa&ccedil;&otilde;es Gerais</label>
			<ul>
			<li>
				<label class="tabTitulo">T&iacute;tulo:</label>
				<p class="tabDescricao">${livro.titulo}</p>
			</li>
			
			<li>
				<label class="tabTitulo">Subt&iacute;tulo:</label>
				<p class="tabDescricao">${livro.subtitulo}</p>
			</li>
			
			<li>
				<label class="tabTitulo">G&ecirc;nero:</label>
				<p class="tabDescricao">${livro.categoria.descricao}</p>
			</li>
			
			<li>
				<label class="tabTitulo">Editora:</label>
				<p class="tabDescricao">${livro.editora}</p>
			</li>
			
			<li>
				<label class="tabTitulo">N&ordm; de p&aacute;ginas:</label>
				<p class="tabDescricao">${livro.paginas}</p>
			</li>
			
			<li>
				<label class="tabTitulo">Edi&ccedil;&atilde;o:</label>
				<p class="tabDescricao">${livro.edicao}</p>
			</li>	
			
			<li>
				<label class="tabTitulo">Ano:</label>
				<p class="tabDescricao">${livro.ano}</p>
			</li>
			
			<li>
				<label class="tabTitulo">Idioma:</label>
				<p class="tabDescricao">${livro.idioma}</p>
			</li>
			
			<li>
				<label class="tabTitulo">C&oacute;digo de barras:</label>
				<p class="tabDescricao">${livro.codigoBarra}</p>
			</li>
			
			<li>
				<label class="tabTitulo">Pre&ccedil;o:</label>
				<p class="tabDescricao">${livro.precoFormatado}</p>
			</li>					
			
			</ul>			
		</td>
		</tr>
		</tbody>
		</table>
		
	</td>
	</tr>
	<tr align="center">
	<td colspan="3" align="center">
	<div class="paddingPadrao">
	<p class="fonteGrande">Ao clicar em 'Comprar este livro' voc&ecirc; ser&aacute; redirecionado para o site de venda do livro.</p>
	<br/>
	<div class="alert alert-info">Aten&ccedil;&atilde;o! os pre&ccedil;os mostrados no site s&atilde;o valores sugeridos, pode
	haver diferen&ccedil;a em rela&ccedil;&atilde;o ao pre&ccedil;o oficial no site de venda do livro.
	
		<div class="paddingPadrao">
		<a href="${livro.linkVenda}" target="_blank" class="btn btn-success">Comprar este livro</a>
		</div>
		
	</div>
	
	</div>
	</td>
	</tr>			
	</table>
	
	<br/><br/>
	
	<div class="superFooter" align="center">
		<div style="width: 1000px; text-align: left; padding: 20px;">
			<a href="<c:url value="/cliente/loja" />" class="info azulClaro altura30 letraGrande destaqueLetraHover ponteiro" >Ir para a loja virtual</a>
		</div>
	</div>
</div>	
</c:if>


<c:if test="${empty flagRequestLivroEmail}">
<div class="mainContainer">
<div class="htmltabs">
	<!-- The tabs -->
	<!-- <ul class="tabs">
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
	</ul> -->
	<!-- <div class="tab1 tabsContent"> -->
		<div class="paddingPadrao">
			
			<div align="center">
			<div style="width: 1000px; text-align: left;" >
			
			<div class="alert alert-info">Aten&ccedil;&atilde;o! os pre&ccedil;os mostrados no site s&atilde;o valores sugeridos, pode
				haver diferen&ccedil;a em rela&ccedil;&atilde;o ao pre&ccedil;o oficial publicado no site de venda do livro.
			</div>				
								
				<div style="width: 100%; background-color: #F8F8FF;" class="cartao paddingPadrao bordaPadrao">
				<c:choose>			
					<c:when test="${empty livrosPublicados}">					
						<p class="textoAutorBlog azulClaro fonteGrande centralizar">N&atilde;o existem livros publicados de Alcindo Miguel Martins Filho a serem exibidos.</p>
					</c:when>
					<c:otherwise>		
						
						<p class="textoAutorBlog azulClaro fonteGrande centralizar">Livros publicados de Alcindo Miguel Martins Filho.</p>
						<p align="center">
						<span class="info">Ao clicar em 'Comprar este livro' voc&ecirc; ser&aacute; redirecionado para o site de venda do livro.</span>
						</p>
						<div class="separador"></div>
										
						<c:forEach items="${livrosPublicados}" var="livro">
						<div align="center">					
						<table style="width: 80%; border-bottom: 1px solid #CCCCCC;" class="paddingPadrao ">
						<tr>
						<td width="120px"  align="left" valign="top">				
							<a href="<c:url value="/loja/visualizador/${livro.uuid}" />" rel="prettyPhoto[livrosMiguel]" title="${resenha.titulo}">
								<img src="<c:url value="/loja/visualizador/${livro.uuid}" />" class="fotoLivro">
							</a>
						</td>
						
						<td valign="top" class="paddingPadrao">
						<p class="titulo" >${livro.titulo}<br/><span class="subtitulo" >${livro.subtitulo}</span></p>
						<p class="autor" >${livro.autor}</p>
						<p class="fonteSuperGrande titulo azulClaro" >R$ ${livro.precoFormatado}
						
						<p align="right">
						<button id="btInformacaoLivro${livro.uuid}" class="btn btn-warning" onclick="abrirInformacaoProduto(this);">Informações do livro</button>
						</p>
						<p align="right">
						<a class="btn btn-success" href="${livro.linkVenda}" target="_blank">Comprar este livro</a>
						</p>
												
						</td>
						</tr>
						
						<tr>
						<td colspan="2">			
						<table id="tabInfoLivro${livro.uuid}" class="tabLivro bordaPadrao modoHidden">
						<thead>
						<tr>
						<td colspan="2"><input id="btFecharInfoLivro${livro.uuid}" onclick="fecharInformacaoProduto(this)" type="button" class="btn btn-default" value="fechar informações sobre o produto"/></td>			
						</tr>			
						</thead>
						
						<tbody>
						<tr>
							<td class="paddingPadrao">
							<label class="tabTitulo" style="font-size: large;">Sinopse</label>
							<ul>
							<li><label class="tabDescricao">${livro.sinopse}</label></li>
							</ul>
						
							<label class="tabTitulo" style="font-size: large;">Informa&ccedil;&otilde;es Gerais</label>
							<ul>
							<li>
								<label class="tabTitulo">T&iacute;tulo:</label>
								<label class="tabDescricao">${livro.titulo}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Subt&iacute;tulo:</label>
								<label class="tabDescricao">${livro.subtitulo}</label>
							</li>
							
							<li>
								<label class="tabTitulo">G&ecirc;nero:</label>
								<label class="tabDescricao">${livro.categoria.descricao}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Editora:</label>
								<label class="tabDescricao">${livro.editora}</label>
							</li>
							
							<li>
								<label class="tabTitulo">N&ordm; de p&aacute;ginas:</label>
								<label class="tabDescricao">${livro.paginas}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Edi&ccedil;&atilde;o:</label>
								<label class="tabDescricao">${livro.edicao}</label>
							</li>	
							
							<li>
								<label class="tabTitulo">Ano:</label>
								<label class="tabDescricao">${livro.ano}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Idioma:</label>
								<label class="tabDescricao">${livro.idioma}</label>
							</li>
							
							<li>
								<label class="tabTitulo">C&oacute;digo de barras:</label>
								<label class="tabDescricao">${livro.codigoBarra}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Pre&ccedil;o:</label>
								<label class="tabDescricao">${livro.precoFormatado}</label>
							</li>					
							
							</ul>			
						</td>
						</tr>
						</tbody>
						</table>
						
						</td></tr>			
						</table>
						</div>
						<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
				
				<!-- --------------------------------------------------------------------------------------------------------- -->
				
				
				<c:choose>			
					<c:when test="${empty livrosTerceirosPublicados}">					
						<p class="textoAutorBlog azulClaro fonteGrande centralizar">N&atilde;o existem livros publicados de outros autores a serem exibidos.</p>
					</c:when>
					<c:otherwise>
						<br>						
						<p class="textoAutorBlog azulClaro fonteGrande centralizar">Livros publicados de outros autores.</p>
						<p align="center">
						<span class="info">Ao clicar em 'Comprar este livro' voc&ecirc; ser&aacute; redirecionado para o site de venda do livro.</span>
						<br/>
						<div class="separador"></div>
										
						<c:forEach items="${livrosTerceirosPublicados}" var="livro">
						<div align="center">					
						<table style="width: 80%; border-bottom: 1px solid #CCCCCC;" class="paddingPadrao ">
						<tr>
						<td width="120px"  align="left" valign="top">				
							<a href="<c:url value="/loja/visualizador/${livro.uuid}" />" rel="prettyPhoto[livrosOutros]" title="${resenha.titulo}">
								<img src="<c:url value="/loja/visualizador/${livro.uuid}" />" class="fotoLivro">
							</a>													
						</td>
						
						<td valign="top" class="paddingPadrao">
						<p class="titulo" >${livro.titulo}<br/><span class="subtitulo" >${livro.subtitulo}</span></p>
						<p class="autor" >${livro.autor}</p>
						<p class="fonteSuperGrande titulo azulClaro" >R$ ${livro.precoFormatado}
						
						<p align="right">
						<button id="btInformacaoLivro${livro.uuid}" onclick="abrirInformacaoProduto(this);" class="btn btn-warning">Informações do livro</button>
						</p>
						<p align="right">
						<a href="${livro.linkVenda}" target="_blank" class="btn btn-success">Comprar este livro</a>
						</p>
						
						</td>
												
						<tr>
						<td colspan="2">			
						<table id="tabInfoLivro${livro.uuid}" class="tabLivro bordaPadrao modoHidden">
						<thead>
						<tr>
						<td colspan="2"><input id="btFecharInfoLivro${livro.uuid}" onclick="fecharInformacaoProduto(this)" type="button" class="btn btn-default" value="fechar informações sobre o produto"/></td>			
						</tr>			
						</thead>
						
						<tbody>
						<tr>
							<td class="paddingPadrao">
							<label class="tabTitulo" style="font-size: large;">Sinopse</label>
							<ul>
							<li><label class="tabDescricao">${livro.sinopse}</label></li>
							</ul>
						
							<label class="tabTitulo" style="font-size: large;">Informa&ccedil;&otilde;es Gerais</label>
							<ul>
							<li>
								<label class="tabTitulo">T&iacute;tulo:</label>
								<label class="tabDescricao">${livro.titulo}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Subt&iacute;tulo:</label>
								<label class="tabDescricao">${livro.subtitulo}</label>
							</li>
							
							<li>
								<label class="tabTitulo">G&ecirc;nero:</label>
								<label class="tabDescricao">${livro.categoria.descricao}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Editora:</label>
								<label class="tabDescricao">${livro.editora}</label>
							</li>
							
							<li>
								<label class="tabTitulo">N&ordm; de p&aacute;ginas:</label>
								<label class="tabDescricao">${livro.paginas}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Edi&ccedil;&atilde;o:</label>
								<label class="tabDescricao">${livro.edicao}</label>
							</li>	
							
							<li>
								<label class="tabTitulo">Ano:</label>
								<label class="tabDescricao">${livro.ano}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Idioma:</label>
								<label class="tabDescricao">${livro.idioma}</label>
							</li>
							
							<li>
								<label class="tabTitulo">C&oacute;digo de barras:</label>
								<label class="tabDescricao">${livro.codigoBarra}</label>
							</li>
							
							<li>
								<label class="tabTitulo">Pre&ccedil;o:</label>
								<label class="tabDescricao">${livro.precoFormatado}</label>
							</li>					
							
							</ul>			
						</td>
						</tr>
						</tbody>
						</table>
						
						</td></tr>			
						</table>
						</div>
						<br/>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				
			</div>			
			</div>		
		
		</div>
		
	<!-- </div> fim tab 1 -->

	<!-- tab 2 -->
	<%-- <div class="tab2 tabsContent">
		<div>
			<c:choose>			
			<c:when test="${empty textosPagos}">
				<h3>N&atilde;o existem textos a serem vendidos.</h3>
			</c:when>
			<c:otherwise>
				<h3>TEXTOS</h3>
			</c:otherwise>
			</c:choose>
		</div>
	</div> --%>
	
	<!-- tab 3 -->
	<%-- <div class="tab3 tabsContent">
		<div>
			<c:choose>			
			<c:when test="${empty cursos}">
				<h3>N&atilde;o existem cursos a serem ministrados.</h3>
			</c:when>
			<c:otherwise>
				<h3>CURSOS</h3>
			</c:otherwise>
			</c:choose>
		</div>
	</div> --%>
	
</div><!-- htmltabs ends here-->	
</div>
</c:if>	
	
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
