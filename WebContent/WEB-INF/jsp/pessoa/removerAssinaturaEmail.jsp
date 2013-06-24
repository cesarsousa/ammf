
<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div style="width: 1000px">

<c:if test="${not empty pessoaInvalida}">
<h2>CADASTRO INEXISTENTE</h2>
<h3>O cadastro desta solicita&ccedil;&atilde;o de cancelamento n&atilde;o consta em nossos regitro.</h3>
<div align="right">
<input class="buttonCadastrar" type="button" value="Cadastrar-se" />
</div>
</c:if>

<c:if test="${not empty pessoaRemovidaCliente}">
<h2>CADASTRO REMOVIDO</h2>
<h3>O link utilizado para remover este cadastro j&aacute; foi utilizado. Certifique-se que o email contendo o link de remo&ccedil;&atilde;o n&ccedil;&atilde;o tenha sido encaminhado para outra pessoa, pois esta pode ter efetuado a remo&ccedil;&atilde;o</h3>
<div align="right">
<input class="buttonCadastrar" type="button" value="Cadastrar-se" />
</div>
</c:if>

<c:if test="${not empty pessoaRemovidaCliente}">
<h2>CADASTRO REMOVIDO</h2>
<h3>O administrador do site pode ter removido este cadastro.</h3>
<div align="right">
<input class="buttonCadastrar" type="button" value="Cadastrar-se" />
</div>
</c:if>

<c:if test="${not empty pessoa}">
<h2>REMO&Ccedil;&Atilde;O DE CADASTRO</h2>
<h3>Aten&ccedil;&atilde;o ${pessoa.nome}, voc&ecirc; est&aacute; prestes a cancelar o cadastro do email ${pessoa.email} de nosso sistema.</h3>
<h3>Tem certeza que deseja efetuar este cancelamento?</h3>
<input class="buttonCadastrar" type="button" value="SIM, Quero cancelar o cadastro" />
<input class="button" type="button" value="NAO, Desejo manter o cadastro" />
</c:if>







<%-- <form action="<c:url value=""></c:url>" method="post">
	<input id="usuarioLogin" type="text" name="login" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<br/><br/>
	<input id="passwordChecker" type="text" value="Senha" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<input id="usuarioSenha" type="password" name="senha" class="letraCinza largura100 altura30 bordaPadrao paddingInput" maxlength="100"/>
	<br/><br/>
	<input type="submit" value="login"  class="button direita tamanhoPadrao"/>
</form> --%>


</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>