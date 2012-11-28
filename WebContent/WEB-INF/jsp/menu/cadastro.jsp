
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<input id="contexto" type="hidden" value="${contextoApp}"/>

<div align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>


<div id="areaLogin">

<c:if test="${not empty msgCadastro}">
<div class="msgBorder msgSucesso tamanhoErroLogin">${msgCadastro}</div>
<br/>
</c:if>

<form action="<c:url value="/menu/cadastrar"/>" method="post">
	 
	
	<c:if test="${not empty nomeEmBranco}">
		<label class="labelFormErro">${nomeEmBranco}</label>
		<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty nomeEmBranco}">
		<label class="labelForm">Nome:</label>
		<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	
	<c:if test="${not empty emailEmBranco}">
		<label class="labelFormErro">${emailEmBranco}</label>
		<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty emailEmBranco}">
		<label class="labelForm">Email:</label>
		<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<input id="btnCadastrarPessoa" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
</form>
</div>
</div>

<div id="espacadorRodape"></div>
<%@ include file="/footerFixed.jsp" %>