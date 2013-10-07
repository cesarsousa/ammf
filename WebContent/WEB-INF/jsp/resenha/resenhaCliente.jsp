<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="" align="center">

<h2>Resenhas</h2>

<p>
<span class="info azulClaro" >Aqui voc&ecirc; vai encontrar minha opni&atilde;o a respeito das coisas.</span>
</p>
</div>

<%-- <div align="center">
<div id="ultimaPublicacao" class="cardViewText">	
	<c:choose>
		<c:when test="${empty ultimaPublicacao}">
			<c:choose>
				<c:when test="${emailRequest}">
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">A resenha solicitada foi removida deste mural.</p>
				</c:when>
				<c:otherwise>
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">Alcindo Miguel n&atilde;o publicou nenhuma resenha ainda.</p>
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:otherwise>
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">${ultimaPublicacao.titulo}</p>
			<p class="textoPostagemBlog aEsquerda negrito">postado em ${ultimaPublicacao.dataFormatada}</p>	
			<c:forEach items="${paragrafos}" var="paragrafo">
				<p class="textoConteudoBlog">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${paragrafo.trechoTexto}</p>		
			</c:forEach>
		</c:otherwise>
	</c:choose>
</div>
</div> --%>


<div id="divResenhasTop3" align="center">
	<c:forEach items="${resenhas}" var="resenha">
	<div class="cardViewText">
		<h3>${resenha.categoria.descricao} -  ${resenha.titulo}</h3>					
		<p class="textoConteudoDepoimento">&ldquo; ${resenha.descricao} &ldquo;</p>
		<p class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
		<p class="textoPostagemDepoimento negrito">postado em ${resenha.dataFormatada}</p>	
	</div>
	<br/>
	</c:forEach>
</div>


<div id="divTodasAsResenhas">

<h3 style="padding-left: 10px; text-align: center;">Encontre a resenha que deseja ler na lista abaixo, ou utilize o campo 'buscar'. Em seguida basta clicar no t&iacute;tulo para ler a resenha na íntegra.</h3>

<div align="center">
<div class="cardViewText superFooter bordaLateral">
<table class="display dataTable">
	<thead align="left">
		<tr>
			<th class="metadado">Tipo da resenha</th>
			<th class="metadado">T&iacute;tulo</th>
			<th class="metadado">Coment&aacute;rio</th>
			<th class="metadado">Data de Postagem</th>			
		</tr>
	</thead>
	<tbody id="bodyResenhasCliente">
 				
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4" align="center"><h2>Celebre a Vida !</h2></th>			
		</tr>		
	</tfoot>
</table>
<br/>
</div>
</div>

<!-- <a name="irTopo"></a>
<a name="lerTexto"></a>
<table id="textoModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			<div class="cardViewText">
			<p id="textoblogTitulo" class="textoAutorBlog azulClaro fonteGrande centralizar">&ldquo; titulo &ldquo;</p>
			<p id="textoblogData" class="textoPostagemBlog aEsquerda negrito">postado em 01/01/2012 12:00:00</p>			
			<p id="textoblogConteudo" class="textoConteudoBlog">conteudo</p>
			</div>
			</td>		
		</tr>		
	</tbody>
	<tfoot>		
		<tr>
			<th colspan="4" align="center">
				<h2><a id="goTopo" href="#irTopo">ler outras resenhas</a></h2>
			</th>			
		</tr>		
	</tfoot>
</table> -->

</div> 

<br/><br/>

<%-- <input id="emailRequest" type="hidden" value="${emailRequest}" /> --%>
<div class="superFooter" align="center">
	<div style="width: 1000px; text-align: left; padding: 20px;">
		<span id="btVisualizarOutrasResenhas" class="info azulClaro altura30 xLarge destaqueLetraHover ponteiro" >Visualizar resenhas anteriores.</span>
	</div>
</div>

<%-- <div id="telaAguardeCadastroDepoimento">
	<div align="center">
		
		<h2>Depoimentos</h2>
		<span class="info azulClaro" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>

		<h3 class="paddingTelaAguarde"><span id="nomeDoCliente"></span> seu depoimento esta sendo processado.</h3>
		
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>			
		<br />
		<br />			
	</div>
</div> --%>

</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
