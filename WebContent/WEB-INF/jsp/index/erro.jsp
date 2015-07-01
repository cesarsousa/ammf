<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div class="tamanhoDefault" align="left">

<div class="separador"></div>



<h1 align="center">P&aacute;gina n&atilde;o encontrada.</h1>

<h2><span style="font-size: 80px; text-align: left;">:(</span><br/>Lamentamos, mas n&atilde;o foi poss&iacute;vel encontrar as informa&ccedil;&otilde;es que voc&ecirc; solicitou.</h2>
<h3>${msgErro}</h3>
<div align="center">
	<form action="<c:url value="/" ></c:url>">
    	<input type="submit" value="Clique aqui para ser redirecionado para a pagina principal" class="btn btn-info"/> 
	</form>

	<c:if test="${RESENHA}">
	<h3>A resenha solicitada foi removida do site.</h3>
	<form action="<c:url value="/resenha/cliente"></c:url>" method="get">
	    <input type="submit" value="Clique aqui para visualizar outras resenhas" class="btn btn-success"/> 
	</form>
	</c:if>
	
	<c:if test="${BLOG}">
	<h3>O texto solicitado foi removido do site.</h3>
	<form action="<c:url value="/blog/cliente"></c:url>" method="get">
	    <input type="submit" value="Clique aqui para visualizar outros textos" class="btn btn-success"/> 
	</form>
	</c:if>

</div>

</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>