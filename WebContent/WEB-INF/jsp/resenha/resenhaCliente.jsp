<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div align="center">

<h2 class="tituloPagina">Resenhas</h2>

<p>
<span class="info azulClaro" >Aqui voc&ecirc; vai encontrar minha opni&atilde;o a respeito das coisas.</span>
</p>

<div class="paddingPadrao bordaPadrao tamanhoDefault" style="background-color: #FFFFFF;" align="center">
<c:forEach items="${categoriasResenha}" var="categoria">
<a href="<c:url value="/resenha/listar/categoria/${categoria.id}"></c:url>">
<span class="categoria destaqueLetraHover ponteiro">${categoria.descricao}</span>
</a>
</c:forEach>
</div>

</div>

<c:if test="${not empty resenha}">
	<div class="fullSize" align="center">
		<div style="width: 1000px">
		<h3>${resenha.categoria.descricao} -  ${resenha.titulo}</h3>					
		<p class="textoConteudoDepoimento">&ldquo; ${resenha.descricao} &ldquo;</p>
		<p class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
		<p class="textoPostagemDepoimento negrito">... resenha postada em ${resenha.dataFormatada}</p>
		</div>	
	</div>
	<br/><br/>
</c:if>


<div id="divResenhasTop3" align="center">
	<c:choose>
		<c:when test="${not empty resenhas}">
		
		<h3 style="padding-left: 10px; text-align: center;">&Uacute;ltimas resenhas publicadas.</h3>
				
			<c:forEach items="${resenhas}" var="resenha">
				<div class="cardViewText">
					<h3>${resenha.categoria.descricao} -  ${resenha.titulo}</h3>					
					<p class="textoConteudoDepoimento">&ldquo; ${resenha.descricao} &ldquo;</p>
					<p class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
					<p class="textoPostagemDepoimento negrito">... resenha postada em ${resenha.dataFormatada}</p>	
				</div>
				<br/>
			</c:forEach>			
		</c:when>
		<c:otherwise>
			<div class="cardViewText">
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">Alcindo Miguel n&atilde;o publicou nenhuma resenha ainda.</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>


<input id="flagResenhasRequest" type="hidden" value="${flagResenhasRequest}"/>
<div id="divTodasAsResenhas">

<h3 style="padding-left: 10px; text-align: center;">Encontre a resenha que deseja ler na lista abaixo.<br/>Em seguida basta <span class="azulClaro">clicar no t&iacute;tulo para ler</span> a resenha na íntegra.</h3>

<div align="center">
<table style="width: 90%">
	<thead align="left">
		<tr>
			<th class="metadado">T&iacute;tulo</th>
			<th class="metadado">Tipo da resenha</th>			
			<th class="metadado">Coment&aacute;rio</th>
			<th class="metadado">Postagem</th>			
		</tr>
		
	</thead>
	<tbody>
		<c:forEach items="${resenhasRequest}" var="resenha">
			<tr class="zebrado">
				<td class="infoTabela metadado ponteiro" title="visualizar este texto">
					<a class="infoTabela metadado" href="#lerTexto" onclick="javascript:visualizarTextoResenha('${resenha.uuid}');"><b>${resenha.titulo}</b></a></td>
				<td class="infoTabela" title="clique no titulo para ler texto completo">${resenha.categoria.descricao}</td>
				<td class="infoTabela" title="clique no titulo para ler texto completo">					
					<c:set var="origemResenha"	value="${resenha.descricao}"/>
					<c:out value="${fn:substring(origemResenha,0,100)}"/>...</td>
				<td class="infoTabela" title="clique no titulo para ler texto completo"><b>${resenha.dataFormatadaSimples}</b></td>
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
<table id="resenhaModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			<div class="cardViewText">
				<h3><span id="resenhaCategoria"></span> -  <span id="resenhaTitulo"></span></h3>					
				<p id="resenhaConteudo" class="titulo">&ldquo; ${resenha.descricao} &ldquo;</p>
				<p id="resenhaAutor" class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
				<p id="resenhaData" class="textoPostagemDepoimento negrito">postado em ${resenha.dataFormatada}</p>
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
</table>

</div> 

<br/><br/>

<c:if test="${not empty resenhas or not empty resenhasRequest}">
<div class="superFooter" align="center">
	<div style="width: 1000px; text-align: left; padding: 20px;">
		<a id="btVisualizarOutrasResenhas" href="<c:url value="/resenha/cliente/listarTodas"/>" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Visualizar resenhas anteriores</a>
		<a id="btVisualizarUltimasResenhas" href="<c:url value="/resenha/cliente"/>" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Visualizar ultimas publica&ccedil;&otilde;es</a>
	</div>
</div>
</c:if>


</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
