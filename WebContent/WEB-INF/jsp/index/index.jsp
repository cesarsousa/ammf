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
	<div class="paddingPadrao superFooter" style="background-color: #FFFFFF; border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC;">
		<div id="gatilhoNews" class="tamanhoDefault paddingPadrao" align="left">
		
			<div align="center"><img class="icone50" src="${imagem}/icone_noticias.png" /><h2>Publica&ccedil;&otilde;es Recentes</h2></div>
			<%-- 
			<p><span id="btVisualizarTodos" class="info azulClaro altura30 letraGrande"><img src="${imagem}/bandeiraNotificar.jpg"> &Uacute;ltimas Publica&ccedil;&otilde;es...</span></p>
			 --%>			
			<c:if test="${not empty blogNews}">
				<table id="tabBlogNews" width="100%" class="paddingPadrao">
				  <tr align="center">
				    <td width="25%" align="center"><h3 class="tituloPagina">Blog</h3></td>
				   	<td width="75%"> 
				    	<table style="border-left: 1px solid #cccccc;" width="100%">
				    		<tr>
				    			<td align="center"><p class="azulClaro fonteGrande">${blogNewsTitulo}</p></td>
				    		</tr>
				    		<tr>
				    			<td align="center" class="textoConteudoBlog">${blogNewsConteudo}</td>
				    		</tr>
				    		<tr>
				    			<td align="right" class="textoPostagemBlog aDireita negrito">${blogNewsPostagem}</td>
				    		</tr>
				    	</table>
				  	</td>
				  </tr>
				</table>			
			</c:if>			
			
			<c:if test="${not empty resenhaNews}">
				<table id="tabResenhaNews" width="100%" class="paddingPadrao">
				  <tr>
				    <td width="25%" align="center"><h3 class="tituloPagina">Resenha</h3></td>
				  	<td width="75%">
				  		<table style="border-left: 1px solid #cccccc;" width="100%">
				  			<tr>				    
						    	<td align="center"><p class="azulClaro fonteGrande">${resenhaNewsTitulo}</p></td>
						  	</tr>
						  	<tr>  
						    	<td align="center" class="textoConteudoBlog">${resenhaNewsConteudo}</td>
						  	</tr>
						  	<tr>
						    	<td align="right" class="textoPostagemBlog aDireita negrito">${resenhaNewsPostagem}</td>
						  	</tr>
				  		</table>
				  	</td>
				  </tr>				  
				</table>			
			</c:if>
		
			<c:if test="${not empty linkNews}">
				<table id="tabLinkNews" width="100%" class="paddingPadrao">
				  <tr>
				    <td width="25%" align="center"><h3 class="tituloPagina">Link</h3></td>
				    <td width="75%">
				    	<table style="border-left: 1px solid #cccccc;" width="100%">
				    		<tr>				    
						    	<td  align="center"><p class="azulClaro fonteGrande">${linkNewsTitulo}</p></td>
						  	</tr>
						  	<tr>  
						    	<td  align="center" class="textoConteudoBlog">${linkNewsConteudo}</td>
						  	</tr>
						  	<tr>
						    	<td  align="right" class="textoPostagemBlog aDireita negrito">${linkNewsPostagem}</td>
						  	</tr>
				    	</table>
				    </td>
				  </tr>				 
				</table>				
			</c:if>
		
			<c:if test="${not empty depoimentoNews}">
				<table id="tabDepoimentoNews" width="100%" class="paddingPadrao">
				  <tr>
				    <td width="25%" align="center"><h3 class="tituloPagina">Depoimento</h3></td>
				    <td width="75%">
				    	<table style="border-left: 1px solid #cccccc;" width="100%">
				    		<tr>				    
						    	<td  align="center"><p class="azulClaro fonteGrande">${depoimentoNewsTitulo}</p></td>
						  	</tr>
						  	<tr>  
						    	<td  align="center" class="textoConteudoBlog">${depoimentoNewsConteudo}</td>
						  	</tr>
						  	<tr>
						    	<td  align="right" class="textoPostagemBlog aDireita negrito">${depoimentoNewsPostagem}</td>
						  	</tr>
				    	</table>
				    </td>
				  </tr>				 
				</table>
			</c:if>
		
			<c:if test="${not empty lojaNews}">
				<table id="tabLojaNews" width="100%" class="paddingPadrao">
				  <tr>
				    <td width="25%" align="center"><h3 class="tituloPagina">Loja Virtual</h3></td>
				    <td width="75%">
				    	<table style="border-left: 1px solid #cccccc;" width="100%">
				    		<tr>				    
						    	<td  align="center"><p class="azulClaro fonteGrande">${lojaNewsTitulo}</p></td>
						  	</tr>
						  	<tr>  
						    	<td  align="center" class="textoConteudoBlog">${lojaNewsConteudo}</td>
						  	</tr>
						  	<tr>
						    	<td  align="right" class="textoPostagemBlog aDireita negrito">${lojaNewsPostagem}</td>
						  	</tr>
				    	</table>
				    </td>
				  </tr>				 
				</table>
			</c:if>
		
			<c:if test="${not empty faqNews}">
				<table id="tabFaqNews" width="100%" class="paddingPadrao">
				  <tr>
				    <td width="25%" align="center"><h3 class="tituloPagina">Faq</h3></td>
				    <td width="75%">
				    	<table style="border-left: 1px solid #cccccc;" width="100%">
				    		<tr>				    
						    	<td  align="center"><p class="azulClaro fonteGrande">${faqNewsTitulo}</p></td>
						  	</tr>
						  	<tr>  
						    	<td  align="center" class="textoConteudoBlog">${faqNewsConteudo}</td>
						  	</tr>
						  	<tr>
						    	<td  align="right" class="textoPostagemBlog aDireita negrito">${faqNewsPostagem}</td>
						  	</tr>
				    	</table>
				    </td>
				  </tr>				 
				</table>
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