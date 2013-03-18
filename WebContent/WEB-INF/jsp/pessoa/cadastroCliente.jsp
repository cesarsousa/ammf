<div id="divMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro closeClick">
	${nomeEmBranco}<br/>${emailEmBranco}</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="divPgCadastroCliente" align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>


<div id="areaLogin">

<form action="<c:url value="/cliente/cadastrar"/>" method="post">	 
	
	<label class="labelForm">Nome:</label>
	<c:if test="${not empty nomeEmBranco}">		
		<input id="cadastroClienteNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty nomeEmBranco}">		
		<input id="cadastroClienteNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<label class="labelForm">Email:</label>
	<c:if test="${not empty emailEmBranco}">		
		<input id="cadastroClienteEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty emailEmBranco}">		
		<input id="cadastroClienteEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<input id="btnClienteCadastrar" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
</form>
</div>

<%-- <table class="tamanhoDefault">
	<tr>
		<td class="tdTableIcone">
		<form id="formMenuCliente" action="<c:url value="/"/>" method="post">
			<img id="btMenuCliente" alt="Menu Principal" title="Menu Principal" src="${imagem}/icone_menu.png" width="50" height="50" class="ponteiro esquerda">
		</form>
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
	</tr>
</table> --%>


</div>

<div id="telaAguardeCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>
		<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>						
		
		<h3 class="paddingTelaAguarde"><span id="nomeDoCliente"></span> seu cadastro esta sendo realizado.</h3>
		
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>		
					
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
