
<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div id="areaLogin">

<c:if test="${not empty erroLogin}">
<div id="boxErroLogin" class="msgBorder msgErro tamanhoErroLogin">${erroLogin}</div>
<br/>
</c:if>

<form action="<c:url value="/login/autenticacao"></c:url>" method="post">
	<input id="usuarioLogin" type="text" name="login" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<br/><br/>
	<input id="passwordChecker" type="text" value="Senha" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<input id="usuarioSenha" type="password" name="senha" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<br/><br/>
	<input type="submit" value="login"  class="button direita tamanhoPadrao"/>
</form>
</div>
</div>

<%@ include file="/footerFixed.jsp" %>