<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty msgIndex}">
	<div class="msgBorder msgSucesso closeClick ponteiro">${msgIndex}</div>
	<br/>
</c:if>

<c:if test="${not empty msgErroIndex}">
	<div class="msgBorder msgErro closeClick ponteiro">${msgErroIndex}</div>
	<br/>
</c:if>

<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">	
	
	<div class="cardPrincipal">
		<div id="mensagemIndex">
		
			<table id="tabMensagemIndex">
			<tr>
			<td>
			<label class="descricaoTextoIndex corPrincipal"><span class="xLarge">&ldquo;</span>${sessaoCliente.textoIndex.conteudo}<span class="xLarge">&bdquo;</span></label>
			<br/>
			<label class="autorTextoIndex azulClaro">${sessaoCliente.textoIndex.autor}</label>
			</td>
			</tr>
			</table>	
		
		</div>
		<div id="shiva"></div>
	</div>
	
	<br/>
	
	<c:if test="${not empty news}">
	<div>
		<div id="gatilhoNews" class="tamanhoDefault paddingPadrao" align="left">
		
		<p><span id="btVisualizarTodos" class="info azulClaro altura30 letraGrande"><img src="${imagem}/bandeiraNotificar.jpg"> Ultimas Novidades...</span></p>
			
			
			<c:if test="${not empty blogNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Blog</h3><a class="infoTabela azulClaro" href="<c:url value="/blog/cliente" />">${blogNewsTitulo}</a>
				</div>
				<br/>		 				
			</c:if>			
			
			<c:if test="${not empty resenhaNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Resenha</h3><a class="infoTabela azulClaro" href="<c:url value="/resenha/cliente" />">${resenhaNewsTitulo}</a>
				</div>
				<br/>
			</c:if>
		
			<c:if test="${not empty linkNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Link</h3><a class="infoTabela azulClaro" href="<c:url value="/link/cliente" />">${linkNewsTitulo}</a>
				</div>
				<br/>
			</c:if>
		
			<c:if test="${not empty depoimentoNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Depoimento</h3><a class="infoTabela azulClaro" href="<c:url value="/cliente/depoimentos" />">${depoimentoNewsTitulo}</a>
				</div>
				<br/>
			</c:if>
		
			<c:if test="${not empty lojaNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Loja Virtual</h3><a class="infoTabela azulClaro" href="<c:url value="/cliente/loja" />">${lojaNewsTitulo}</a>
				</div>
				<br/>
			</c:if>
		
			<c:if test="${not empty faqNews}">
				<div class="cardViewText paddingPadrao">
				<h3>Faq</h3><a class="infoTabela azulClaro" href="<c:url value="/cliente/faq" />">${faqNewsTitulo}</a>
				</div>
				<br/>
			</c:if>
			
		</div>					
	</div>	
	</c:if>
	
	
	<%-- <c:if test="${not empty news}">
	<div class="paddingPadrao superFooter" style="background-color: #FFFFFF; border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;">
		<div id="gatilhoNews" class="tamanhoDefault paddingPadrao" align="left">
		
		<span id="btVisualizarTodos" class="info azulClaro altura30 letraGrande"><img src="${imagem}/bandeiraNotificar.jpg"> Ultimas Novidades...</span>
			
			<ul id="ultimasNovidades">
				<c:if test="${not empty blogNews}">
					<li><h3>${blogNews}</h3>
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/blog/cliente" />">${blogNewsTitulo}</a></li></ul></li>			 				
				</c:if>
			
				<c:if test="${not empty resenhaNews}">
					<li><h3>${resenhaNews}</h3>
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/resenha/cliente" />">${resenhaNewsTitulo}</a></li></ul></li>
				</c:if>
			
				<c:if test="${not empty linkNews}">
					<li><h3>${linkNews}</h3>				
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/link/cliente" />">${linkNewsTitulo}</a></li></ul></li>
				</c:if>
			
				<c:if test="${not empty depoimentoNews}">
					<li><h3>${depoimentoNews}</h3>
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/cliente/depoimentos" />">${depoimentoNewsTitulo}</a></li></ul></li>
				</c:if>
			
				<c:if test="${not empty lojaNews}">
					<li><h3>${lojaNews}</h3>
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/cliente/loja" />">${lojaNewsTitulo}</a></li></ul></li>
				</c:if>
			
				<c:if test="${not empty faqNews}">
					<li><h3>${faqNews}</h3>
						<ul style="list-style: none;"><li><a class="infoTabela azulClaro" href="<c:url value="/cliente/faq" />">${faqNewsTitulo}</a></li></ul></li>
				</c:if>
			</ul>
		</div>					
	</div>	
	</c:if> --%>
	
</div>

</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footer.jsp" %>
</div>