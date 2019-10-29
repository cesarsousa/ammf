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
		
		<c:if test="${not empty videos}">
			
			<div class="jumbotron">
			<h1 align="center">Videos</h1>
			
			<c:forEach var="video" items="${videos}">
				<h2>${video.titulo}</h2>
				<h3>${video.descricao}</h3>
				<div>${video.url}</div>
			</c:forEach>
			
			<br>
			<div class="separador"></div>
			
			</div>
		</c:if> 
		
		<c:if test="${empty livroNaoDisponivel}">		
		<div id="gatilhoNews" class="jumbotron" align="left">			
			<h1 align="center">Livros publicados</h1>			
			<c:if test="${not empty resenhaNews}">
	  				<table>
	  				<tr>
	  				<td class="paddingPadrao" valign="top">
	  				<a href="<c:url value="/loja/visualizador/${livroNewsUuid}" />">
						<img src="<c:url value="/loja/visualizador/${livroNewsUuid}" />" class="fotoLivro">
					</a>
	  				</td>
	  				<td class="paddingPadrao" valign="top">
	  				<h4 class="justificado">${livroNewsSinopse}</h4>
				  	<div align="right">
				  	<a id="tabLojaNews" class="btn btn-primary btn-lg" role="button">Visitar Loja Virtual</a>
	  				</div>
	  				</td>
	  				</tr>
	  				</table>
					</c:if>
					
					<br>
					<div class="separador"></div>			
		</div>	
		</c:if>	
			
		<div id="gatilhoNews" class="jumbotron" align="left">	
			<h1 align="center">&Uacute;timas publica&ccedil;&otilde;es do site</h1>
			
			
			<table class="tamanhoDefault">
				<tr align="left">
					<td class="paddingPadrao">
					<c:if test="${not empty blogNews}">			
	  				<h2>Blog</h2>				  	
				  	<h3 class="justificado" >${blogNewsConteudo}</h3>
				  	<div align="right">
				  	<a id="tabBlogNews" class="btn btn-primary btn-lg" role="button">Continuar lendo...</a>
					</div>
					</c:if>	
					</td>
				</tr>
				<tr align="left">	
					<td class="paddingPadrao">
					<c:if test="${not empty resenhaNews}">
	  				<h2>Resenha</h2>
	  				
	  				<table>
	  				<tr>
	  				<td>
	  				<a href="<c:url value="/resenha/visualizador/${resenhaNewsUuid}" />">
						<img src="<c:url value="/resenha/visualizador/${resenhaNewsUuid}" />" class="fotoLivro">
					</a>
	  				</td>
	  				<td class="paddingPadrao">
	  				<h3 class="justificado">${resenhaNewsConteudo}</h3>
				  	<div align="right">
				  	<a id="tabResenhaNews" class="btn btn-primary btn-lg" role="button">Continuar lendo...</a>
	  				</div>
	  				</td>
	  				</tr>
	  				</table>
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


