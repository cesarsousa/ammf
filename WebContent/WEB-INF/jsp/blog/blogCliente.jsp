<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="" align="center">

<h2 class="tituloPagina">Blog do Miguel</h2>

<p>
<span class="info azulClaro letraGrande" >Aqui voc&ecirc; vai encontrar os meus textos e saber um pouco mais sobre o que gosto de escrever e compartilhar com meu p&uacute;blico.</span>
</p>
</div>

<div align="center">
<div id="ultimaPublicacao" class="cardViewText">	
	<c:choose>
		<c:when test="${empty ultimaPublicacao}">
			<c:choose>
				<c:when test="${emailRequest}">
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">O texto solicitado foi removido deste blog ou est&aacute; sendo atualizado.</p>
				</c:when>
				<c:otherwise>
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">Este texto est&aacute; sendo atualizado... Logo estar&aacute; dispon&iacute;vel.</p>
				</c:otherwise>
			</c:choose>
		</c:when>
		
		<c:otherwise>
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">${ultimaPublicacao.titulo}</p>
				
			<c:forEach items="${paragrafos}" var="paragrafo">
				<p class="textoConteudoBlog">${paragrafo.trechoTexto}</p>		
			</c:forEach>
			<p class="textoPostagemBlog aEsquerda negrito">... texto postado em ${ultimaPublicacao.dataFormatada}</p>
		</c:otherwise>
	</c:choose>
</div>
</div>

<div id="divTodosTextos">

<h3 style="padding-left: 10px; text-align: center;">Encontre o texto que deseja ler na lista abaixo.<br/>Em seguida basta <span class="azulClaro">clicar no t&iacute;tulo para ler</span> o texto na íntegra.</h3>

<div align="center">
<table style="width: 90%">
	<thead align="left">
		<tr>
			<th class="metadado">T&iacute;tulo</th>
			<th class="metadado">Texto</th>
			<th class="metadado">Postagem</th>			
		</tr>
	</thead>
	<tbody>
 		<c:forEach items="${textosBlog}" var="texto">
			<tr class="zebrado">
				<td class="infoTabela metadado ponteiro" title="visualizar este texto">
				<a class="infoTabela metadado" href="#lerTexto" onclick="javascript:visualizarTextoBlog('${texto.uuid}');">${texto.titulo}</a>
				</td>
				<td class="infoTabela">
					<c:set var="origem"	value="${texto.conteudo}"/>
					<c:out value="${fn:substring(origem,0,100)}"/>...</td>
				<td class="infoTabela">${texto.dataFormatadaSimples}</td>
			</tr>			
		</c:forEach>		
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4" align="center"><h2>Celebre a Vida !</h2></th>			
		</tr>		
	</tfoot>
</table>
<br/>
</div>

<a name="irTopo"></a>
<a name="lerTexto"></a>
<table id="textoModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			<div class="cardViewText">
			<p id="textoblogTitulo" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
			<p id="textoblogData" class="textoPostagemBlog aEsquerda negrito"></p>			
			<p id="textoblogConteudo" class="textoConteudoBlog"></p>
			</div>
			</td>		
		</tr>		
	</tbody>
	<tfoot>		
		<tr>
			<th colspan="4" align="center">
				<h2><a id="goTopo" href="#irTopo">ler outros textos</a></h2>
			</th>			
		</tr>		
	</tfoot>
</table>
</div> 

<br/><br/>
<c:if test="${not empty textosBlog}">
<input id="emailRequest" type="hidden" value="${emailRequest}" />
<div class="superFooter" align="center">
	<div style="width: 1000px; text-align: left; padding: 20px;">
		<span id="btVisualizarTodos" class="info azulClaro altura30 letraGrande destaqueLetraHover ponteiro">Visualizar textos anteriores.</span>
	</div>
</div>
</c:if>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
