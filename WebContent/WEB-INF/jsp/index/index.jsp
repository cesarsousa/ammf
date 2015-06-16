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

	<form id="formBlogNews" action="<c:url value="/blog/cliente" />" method="get"></form>
	<form id="formResenhaNews" action="<c:url value="/resenha/cliente" />" method="get"></form>
	<form id="formLinkNews" action="<c:url value="/link/cliente" />" method="get"></form>
	<form id="formDepoimentoNews" action="<c:url value="/cliente/depoimentos" />" method="get"></form>
	<form id="formLojaNews" action="<c:url value="/cliente/loja" />" method="get"></form>
	<form id="formFaqNews" action="<c:url value="/cliente/faq" />" method="get"></form>

	<c:if test="${not empty news}">
		<div id="gatilhoNews">		
						
			<c:if test="${not empty blogNews}">			
				<div class="jumbotron">
	  				<h1>Blog</h1>
				  	<h4>${blogNewsPostagem}</h4>
				  	<h2 class="azulClaro" >${blogNewsTitulo}</h2>
				  	<h3>${blogNewsConteudo}</h3>
				  	<a id="tabBlogNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>
				</div>						
			</c:if>			
			
			<c:if test="${not empty resenhaNews}">
				<div class="jumbotron">
	  				<h1>Resenha</h1>
				  	<h4>${resenhaNewsPostagem}</h4>
				  	<h2 class="azulClaro" >${resenhaNewsTitulo}</h2>
				  	<h3>${resenhaNewsConteudo}</h3>
				  	<a id="tabResenhaNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>
				</div>							
			</c:if>
		
			<c:if test="${not empty linkNews}">
				<div class="jumbotron">
	  				<h1>Links &Uacute;teis</h1>
				  	<h4>${linkNewsPostagem}</h4>
				  	<h2 class="azulClaro" >${linkNewsTitulo}</h2>
				  	<h3>${linkNewsConteudo}</h3>
				  	<a id="tabLinkNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>
				</div>
			</c:if>
		
			<c:if test="${not empty depoimentoNews}">
				<div class="jumbotron">
	  				<h1>Depoimento</h1>
				  	<h4>${depoimentoNewsPostagem}</h4>
				  	<h2 class="azulClaro" >${depoimentoNewsTitulo}</h2>
				  	<h3>${depoimentoNewsConteudo}</h3>
				  	<a id="tabDepoimentoNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>
				</div>
			</c:if>
		
			<c:if test="${not empty lojaNews}">
				<div class="jumbotron">
	  				<h1>Loja Virtual</h1>
	  				<h4>${lojaNewsPostagem}</h4>
				  	<h2 class="azulClaro" >${lojaNewsTitulo}</h2>
				  	<h3>${lojaNewsConteudo}</h3>
				  	<a id="tabLojaNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>
				</div>
			</c:if>
		
			<c:if test="${not empty faqNews}">
				<div class="jumbotron">
					<h1>Faq</h1>
					<h4>${faqNewsPostagem}</h4>
					<h2 class="azulClaro">${faqNewsTitulo}</h2>
					<h3>${faqNewsConteudo}</h3>
					<a id="tabFaqNews" class="btn btn-primary btn-lg" role="button">Saber mais...</a>					
				</div>
			</c:if>
		</div>					
	</c:if>
</div>

</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footer.jsp" %>
</div>