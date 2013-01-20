<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">
	
	<c:if test="${not empty msgIndex}">
	<div style="width: 995px;" class="msgBorder msgSucesso closeClick ponteiro"> 
	${msgIndex}
	</div>
	<br/>
	</c:if>
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
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>