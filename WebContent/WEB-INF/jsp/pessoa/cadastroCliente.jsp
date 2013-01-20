

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>


<div id="divPgCadastroCliente" align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>


<div id="areaLogin">

<c:if test="${not empty msgCadastro}">
<div class="msgBorder msgSucesso tamanhoErroLogin closeClick">${msgCadastro}</div>
<br/>
</c:if>

<c:if test="${not empty msgErroCadastro}">
<div class="msgBorder msgErro tamanhoErroLogin closeClick">${msgCadastro}</div>
<br/>
</c:if>
<form action="<c:url value="/cliente/cadastrar"/>" method="post">	 
	
	<c:if test="${not empty nomeEmBranco}">
		<label class="labelFormErro">${nomeEmBranco}</label>
		<input id="cadastroClienteNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty nomeEmBranco}">
		<label class="labelForm">Nome:</label>
		<input id="cadastroClienteNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	
	<c:if test="${not empty emailEmBranco}">
		<label class="labelFormErro">${emailEmBranco}</label>
		<input id="cadastroClienteEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty emailEmBranco}">
		<label class="labelForm">Email:</label>
		<input id="cadastroClienteEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<input id="btnClienteCadastrar" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
</form>
</div>


</div>

<div id="telaAguardeCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>
		<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>						
		
		<h3 class="paddingTelaAguarde"><span id="nomeDoCliente"></span> seu cadastro esta sendo realizado.</h3>
		<h3>Por favor, aguarde...</h3>
		<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
