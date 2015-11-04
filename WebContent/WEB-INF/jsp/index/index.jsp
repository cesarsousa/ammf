<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div class="jumbotron">
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
</div>

<div align="center">
<c:if test="${not empty msgIndex}">
	<div class="msgBorder msgSucesso closeClick ponteiro">${msgIndex}</div>
	<br/>
</c:if>

<c:if test="${not empty msgErroIndex}">
	<div class="msgBorder msgErro closeClick ponteiro">${msgErroIndex}</div>
	<br/>
</c:if>
</div>

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
</div>	

<form id="formBlogNews" action="<c:url value="/blog/cliente" />" method="get"></form>
<form id="formResenhaNews" action="<c:url value="/resenha/cliente" />" method="get"></form>
<form id="formLinkNews" action="<c:url value="/link/cliente" />" method="get"></form>
<form id="formLojaNews" action="<c:url value="/cliente/loja" />" method="get"></form>

<div align="center" class="fundoPadrao">
<table class="tamanhoDefault">
  <tr>
    <th>
    <c:if test="${not empty news}">
		<div align="center"> 
		<div id="gatilhoNews" class="jumbotron" align="left">
			
			
			
			
			<table class="tamanhoDefault">
				<tr>	
					<td class="paddingPadrao">
					<c:if test="${not empty lojaNews}">
	  				<h1 align="center">Livros Publicados</h1>
	  				<h2>Loja Virtual</h2>
				  	<h3 class="azulClaro" >${lojaNewsTitulo}</h3>
				  	<a id="tabLojaNews" class="btn btn-primary btn-lg" role="button">Entrar na Loja</a>
					</c:if>		
					</td>
				</tr>
				<tr>
					<td class="paddingPadrao">
					<c:if test="${not empty blogNews}">			
	  				<h1 align="center">Blog</h1>
	  				<h2>Blog</h2>				  	
				  	<h3 class="azulClaro" >${blogNewsTitulo}</h3>
				  	<a id="tabBlogNews" class="btn btn-primary btn-lg" role="button">Ler Blog</a>
					</c:if>	
					</td>
				</tr>
				<tr>					
					<td class="paddingPadrao">
					<c:if test="${not empty resenhaNews}">
	  				<h1 align="center">Resenha</h1>
	  				<h2>Resenha</h2>
				  	<h3 class="azulClaro" >${resenhaNewsTitulo}</h3>
				  	<a id="tabResenhaNews" class="btn btn-primary btn-lg" role="button">Ler Resenha</a>
					</c:if>
					</td>
				</tr>
			</table>			
				
		</div>
		</div>					
	</c:if>
	</th>
  </tr>  
</table>
</div>	

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>

</div> <!-- main -->
</div> <!-- wrap -->


