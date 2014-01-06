<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty blogMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${blogMensagemSucesso} 
	</div>
</c:if>

<c:if test="${not empty blogMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${blogMensagemErro} 
	</div>
</c:if>
<c:if test="${flagCadastrarBlogVazio}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${tituloEmBranco}${autorEmBranco}${conteudoEmBranco}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgBlogAdmin" align="center">

<h2>BLOG</h2>

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
		<img id="btAddTextoBlog" alt="adicionar texto" title="adicionar texto" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btEdtTextoBlog" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btListarTextosBlog" alt="listar todos os textos" title="listar todos os textos" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentarios" alt="visualizar comentários" title="visualizar comentários" src="${imagem}/iconeComentarioTodos.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosConfirmados" alt="comentários confirmados" title="comentários confirmados" src="${imagem}/iconeComentarioConfirmados.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosPendentes" alt="comentários pendentes" title="comentários pendentes" src="${imagem}/iconeComentarioPendentes.png" width="50" height="50" class="ponteiro esquerda">
	</li>
		
</ul>
</td>
</tr>
</table>
</div>

<!-- submit via javascript -->
<form id="formBlogListarTodos" action="<c:url value="/blog/listar" />" method="get"></form>
<form id="formVerComentariosBlog" action="<c:url value="/blog/comentarios/TODOS" />" method="get"></form>
<form id="formVerComentariosBlogConfirmados" action="<c:url value="/blog/comentarios/CONFIRMADO" />" method="get"></form>
<form id="formVerComentariosBlogPendentes" action="<c:url value="/blog/comentarios/PENDENTE" />" method="get"></form>

<div class="separador"></div>

<!-- ADICIONAR UM NOVO TEXTO -->
<input id="flagCadastrarBlogVazio" type="hidden" value="${flagCadastrarBlogVazio}" />
<table id="tdNovoBlog" class="cardViewText">		
	<tr>
		<td >
		<div align="right">
		<input id="btFecharAddTextoBlog" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Novo Texto</h2>
		
		<form id="formBlogNovoTexto" action="<c:url value="/blog/novo"/>" method="post">				
			 				
			<h3>T&iacute;tulo :</h3>
			<input id="blogTituloNovoTexto" type="text" class="areaTitulo bordaPadrao corAzul negrito" name="texto.titulo" value="${textoBlog.titulo}"/>
				
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
			
			<div class="paddingPadrao">
			
				<span id="btAbrirTextoTrava" class="info AzulClaro destaqueLetraHover ponteiro">Trava para textos novos...</span>
			
				<div id="infoTravaTexto" class="hidden">
				<div class="paddingPadrao">
				<p>
				&Eacute; necess&aacute;rio primeiro cadastrar o texto. Para travar este texto, siga os passos abaixo.
				<p>
				<ul>
				<li>Primeiramente pressione o bot&atilde;o cadastrar. </li>
				<li>Depois de cadastrado voc&ecirc; pode acessar o texto clicando em 'buscar e editar' <img src="${imagem}/iconeEditarHover.png" class="icone20"> e utilize o t&iacute;tulo para realizar a busca.</li>
				<li>Se preferir utilize a op&ccedil;&atilde;o de 'listar todos os textos' <img src="${imagem}//iconeListarHover.png" class="icone20"> para encontrar o novo texto cadastrado.</li>
				<li>Ao localizar o texto basta clicar em 'editar este texto' <img src="${imagem}/iconeEditarHover.png" class="icone20"> na listagem exibida.</li>
				</ul>
				</div>
				
				<span id="btFecahrTextoTrava" class="info AzulClaro destaqueLetraHover ponteiro">Fechar 'Trava para textos novos...'</span>
				</div>
						 
			</div>
						
			<textarea id="blogConteudoNovoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo">${textoBlog.conteudo}</textarea>		
			<h4 align="left" class="azulClaro">
			Voc&ecirc; pode digitar <span id="contadorCaracterNovoBlog">10000</span> caracteres em seu texto.
			</h4>
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
		<td  valign="middle">
		<div align="right">
		<input id="btFecharEdtTextoBlog" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
		<h2 align="center">Buscar Texto</h2>		
		
		<form id="formBlogBuscaTexto">
		<div align="center">
			<input id="campoBuscaTxtEdtBlog" type="text" class="fundoLupa w500px bordaPadrao" />
			<input type="submit" class="buttonCadastrar" value="Pesquisar">
			<p>
			<span class="info letraGrande" ><label id="labelBuscaTexto"></label></span>
			</p>
		</div>
		</form>
		</td>
	</tr>
	<tr id="resultBuscaTxtBlog">
		<td>
			<br/>
			<table width="100%" class="card">
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
</table>


<input id="flagAbrirEdicaoTexto" type="hidden" value="${flagAbrirEdicaoTexto}" />
<div id="divBlogEditarTexto" class="cardViewText">
	<!-- AREA DE EDICAO DE UM TEXTO -->
	<div align="right">
		<input id="btFecharEdtEdtTextoBlog" type="button" value="fechar" class="backVermelho button">
	</div>

	<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
	<h2 align="center">Edi&ccedil;&atilde;o de Texto</h2>
		
	<form id="formBlogEditarTexto" action="<c:url value="/blog/atualiza"/>" method="post">
							
		<input id="blogEdtUuidTexto" type="hidden" name="texto.uuid" value="${texto.uuid}"/>				
						
		<h3>T&iacute;tulo :</h3>
		<input id="blogEdtTituloTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" value="${texto.titulo}"/>
			
		<h3>Autor :</h3>
		<input id="blogEdtAutorTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="${texto.autor}"/>	
						
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
		
		<p>				
		<c:choose>
			<c:when test="${texto.confirmado}">
				<label class="labelForm2"><input id="${texto.uuid}" type="checkbox" onclick="javascript: travarTextoBlogParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
			</c:when>
			<c:otherwise>
				<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
			</c:otherwise>
		</c:choose>
		</p>
					
		<textarea id="blogEdtConteudoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo">${texto.conteudo}</textarea>		
		<h4 align="left" class="azulClaro">
		Voc&ecirc; pode digitar <span id="contadorCaracterEdtBlog">10000</span> caracteres em seu texto.
		</h4>
		
		<p>
		<input id="btCadEdtTexto" type="submit" value="atualizar e destravar texto" class="buttonCadastrar">
		<input id="btBlogCancelEdtTexto" type="button" value="cancelar atualização" class="button">
		<input id="btBlogExcluirEdtTexto" type="button" value="Excluir este texto" class="backVermelho button">
		</p>
					
	</form>
	<form id="formBtBlogExcluirEdtTexto" method="get"></form>

</div><!-- fechar abrirEdicaoTexto -->



<!-- LISTAR TODOS OS TEXTOS -->
<input id="flagTextosblog" type="hidden" value="${flagTextosblog}">
<table id="divEditarBlogTodosTextos" class="fullSize">	
	<tr>
	<td>
	<div align="right">		
	<input id="btBlogFecharTextos" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty textosBlog}">
	<h3 align="center">N&atilde;o existem textos cadastrados</h3>
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
					<td class="infoTabelaConteudo">${texto.autor}</td>
					<td class="infoTabelaConteudo metadado">${texto.titulo}</td>
					<td class="infoTabelaConteudo">
						<c:set var="origem"	value="${texto.conteudo}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>...</td>
					<td class="infoTabelaConteudo" style="width: 160px;">${texto.dataFormatada}</td>
					<td class="infoTabelaData" style="width: 80px;">
						<a href="<c:url value="/blog/editar/${texto.uuid}" />">
							<c:choose>
								<c:when test="${texto.confirmado}">
									<img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar este texto">
								</c:when>
								<c:otherwise>
									<img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHoverTrava.png" title="editar este texto">
								</c:otherwise>
							</c:choose>					
						</a>				
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

<!-- LISTAR TODOS OS COMENTARIOS -->
<input id="flagComentariosBlog" type="hidden" value="${flagComentariosBlog}">
<table id="tabComentariosAdmin" class="fullSize">	
	<tr>
	<td>
	<div align="right">		
	<input id="btFecharComentarios" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/${iconeVerComentarios}" class="icone50 esquerda">
	<c:if test="${empty comentariosBlog}">
	<h3 align="center" class="${cssCorTitulo}">N&atilde;o existem coment&aacute;rios a serem visualizados</h3>
	</c:if>
	<c:if test="${not empty comentariosBlog}">
	<h3 align="center" class="${cssCorTitulo}">${tituloVerComentarios}</h3>
	<p class="info azulClaro letraGrande" align="center">Clique no t&iacute;tulo do texto de refer&ecirc;ncia para visualiz&aacute;-lo</p>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Local</th>
				<th class="metadado">Texto refer&ecirc;ncia</th>
				<th class="metadado">Nome</th>
				<th class="metadado">Email</th>
				<th class="metadado">Conte&uacute;do</th>
				<th class="metadado">Situa&ccedil;&atilde;o</th>
				<th class="metadado" style="width: 160px;">Postagem</th>
				<th class="metadado" style="width: 80px;">A&ccedil;&atilde;o</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${comentariosBlog}" var="comentario">
				<tr class="zebrado">
					<td class="infoTabelaConteudo"><b>${comentario.local}</b></td>
					<td class="infoTabelaConteudo ponteiro" title="visualizar este texto">
						<a id="goTextoView" class="infoTabela azulClaro letraMedia" href="#lerTextoView" onclick="abrirTextoView('${comentario.texto.uuid}')">${comentario.texto.titulo}</a>				
					</td>
					<td class="infoTabelaConteudo">${comentario.nome}</td>
					<td class="infoTabelaConteudo">${comentario.email}</td>
					<td class="infoTabelaConteudo">${comentario.conteudo}
						<%-- <c:set var="origem"	value="${comentario.conteudo}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>... --%>
					</td>
					<td class="infoTabelaConteudo ${comentario.status}">${comentario.status}</td>
					<td class="infoTabelaConteudo" style="width: 160px;">${comentario.dataHora}</td>
					<td class="infoTabelaData" style="width: 80px;">						
						<c:choose>
							<c:when test="${comentario.confirmado}">
								<img class="icone" alt="editar" src="${imagem}/iconeConfirmarDisabled.png" title="editar este texto">
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/blog/comentario/confirmar/${comentario.uuid}/${flagTitulo}" />">
								<img class="ponteiro icone" alt="editar" src="${imagem}/icone_confirmar.png" title="editar este texto">
								</a>
							</c:otherwise>
						</c:choose>					
										
						<a href="<c:url value="/blog/comentario/remover/${comentario.uuid}/${flagTitulo}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir texto" title="excluir texto" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>


<a name="lerTextoView"></a>
<div id="divTextoView" class="fullSize paddingPadrao">
	<div class="cardViewText">
		<input id="btFecharTextoView" type="button" value="fechar" class="backVermelho button direita">
		<h2>Visualiza&ccedil;&atilde;o de texto referente a um coment&aacute;rio</h2>
		
		<p id="textoTituloView" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
		<p id="textoDataView" class="textoPostagemBlog aEsquerda negrito"></p>			
		<p id="textoConteudoView" class="textoConteudoBlog"></p>
	</div>
</div>

</div> <!-- div center -->

<div id="telaAguardeAdmBlogCadastrar">
	<div align="center">
		
		<h2>BLOG</h2>    
		<span class="info azulClaro letraGrande" >Texto sendo cadastrado ou atualizado.</span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
		
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
