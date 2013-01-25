
<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div id="areaLogin">

<c:if test="${not empty erroLogin}">
<div id="boxErroLogin" class=labelFormErro><p>${erroLogin}</p></div>
</c:if>

<form action="<c:url value="/login/autenticacao"></c:url>" method="post">
	<input id="usuarioLogin" type="text" name="login" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<br/><br/>
	<input id="passwordChecker" type="text" value="Senha" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<input id="usuarioSenha" type="password" name="senha" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<br/><br/>
	<input type="submit" value="login"  class="button direita tamanhoPadrao"/>
</form>
</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>