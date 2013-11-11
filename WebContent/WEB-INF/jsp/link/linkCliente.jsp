<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div align="center">

	<h2 class="tituloPagina">LINKS &Uacute;TEIS </h2>

	<p>
	<span class="info azulClaro" >Aqui voc&ecirc; vai encontrar links &uacute;teis.</span>
	</p>
	
	<c:choose>
		<c:when test="${not empty links}">
			<div class="cardViewText">
			<ul style="list-style: none;">
		
			<c:forEach items="${links}" var="link">
				<li class="paddingPadrao">			
					<a class="textoAutorDepoimento azulClaro" style="font-size: medium;" href="${link.url}" target="_blank">${link.titulo}</a>
					<ul style="list-style: none;">
						<li><p class="textoPostagemDepoimento negrito" style="font-size: large;">&ldquo; ${link.descricao} &ldquo;</p></li>
						<li><p class="textoConteudoDepoimento">link postado em ${link.dataFormatada}</p></li>
					</ul>
				</li>
			</c:forEach>
				
			</ul>
			</div>		
		</c:when>
		<c:otherwise>
			<div class="cardViewText">
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">Alcindo Miguel n&atilde;o publicou nenhum link ainda.</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>

<br/><br/>

</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
