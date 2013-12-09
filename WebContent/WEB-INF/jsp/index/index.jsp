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
			<label class="descricaoTextoIndex corPrincipal"><span class="xLarge">&ldquo;</span> ${sessaoCliente.textoIndex.conteudo} <span class="xLarge">&bdquo;</span></label>
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
	<div class="fundoAzulClaro cartao tamanhoDefault paddingPadrao">
		<h3 style="color: #000000">Ultimas Novidades...</h3>
			
			<c:if test="${not empty blogNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/blog/cliente" />">${blogNews}</a></h4>				
			</c:if>
		
			<c:if test="${not empty resenhaNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/resenha/cliente" />">${resenhaNews}</a></h4>
			</c:if>
		
			<c:if test="${not empty linkNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/link/cliente" />">${linkNews}</a></h4>
			</c:if>
		
			<c:if test="${not empty depoimentoNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/cliente/depoimentos" />">${depoimentoNews}</a></h4>
			</c:if>
		
			<c:if test="${not empty lojaNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/cliente/loja" />">${lojaNews}</a></h4>
			</c:if>
		
			<c:if test="${not empty faqNews}">
				<h4 class="cinzaEscuro"><a href="<c:url value="/cliente/faq" />">${faqNews}</a></h4>
			</c:if>					
	</div>	
	</c:if>
	
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<br/>

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>