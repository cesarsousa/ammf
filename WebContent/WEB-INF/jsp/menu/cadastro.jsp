
<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>


<div id="areaLogin">

<c:if test="${not empty msgCadastro}">
<div class="msgBorder msgSucesso tamanhoErroLogin">${msgCadastro}</div>
<br/>
</c:if>

<form action="<c:url value="/menu/cadastrar"/>" method="post">
	<label class="labelForm">Nome:</label> 
	<input id="pessoaNome" type="text" name="pessoa.nome" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<br/><br/>
	<label class="labelForm">Email:</label>
	<input id="pessoaEmail" type="text" name="pessoa.email" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<br/><br/>
	
	<input type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
</form>
</div>
</div>

<div id="espacador"></div>

<%@ include file="/footer.jsp" %>