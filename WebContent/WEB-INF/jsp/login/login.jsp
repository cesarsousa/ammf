<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<c:if test="${not empty erroLogin}">
	<div class="alert alert-danger ponteiro closeClick" role="alert">${erroLogin}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div id="areaLogin">

<form action="<c:url value="/login/autenticacao"></c:url>" method="post">

	<input id="usuarioLogin" type="text" name="login" class="form-control" maxlength="100" placeholder="Usuário"/>
	<br/>
	<input id="usuarioSenha" type="password" name="senha" class="form-control" maxlength="100" placeholder="Senha"/>
	<br/>
	<input type="submit" value="login"  class="btn btn-success"/>
	
</form>

<br/>
<a href="<c:url value="/"></c:url>">Ir para o site</a>


</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>