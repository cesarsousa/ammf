
<%@ include file="/headerLib.jsp" %>
<div class="paddingHeader"></div>
<%@ include file="/headerSite.jsp" %>

<div align="center">
<div style="width: 1000px">

<c:if test="${not empty pessoaInvalida}">
	<h2>Remo&ccedil;&atilde;o de Cadastro</h2>
	<h3>O cadastro desta solicita&ccedil;&atilde;o de cancelamento foi removido de nossos regitro de uma das seguintes maneiras, listadas abaixo.</h3>
	<ul style="text-align: left;">
	<li><h4>Atrav&eacute;s do link de remo&ccedil;&atilde;o de email.</h4></li>
	<li><h4>O link utilizado para remover este cadastro pode ter sido usado de forma err&ocirc;nea. Certifique-se que o email contendo o link de remo&ccedil;&atilde;o n&atilde;o tenha sido encaminhado para outra pessoa, pois esta pode ter efetuado a remo&ccedil;&atilde;o.</h4></li>
	<li><h4>O administrador do site pode ter removido este cadastro.</h4></li>
	</ul>
	
	<div align="right">
	<form action="<c:url value="/cliente/cadastro" />" method="get">
	<input class="buttonCadastrar" type="submit" value="Gostaria de me cadastrar novamente" />
	</form>
	</div>
</c:if>

<c:if test="${not empty pessoa}">
	<h2>REMO&Ccedil;&Atilde;O DE CADASTRO</h2>
	<h3>Aten&ccedil;&atilde;o <b>${pessoa.nome}</b>, voc&ecirc; est&aacute; prestes a cancelar o cadastro do email <b>${pessoa.email}</b> de nosso sistema.</h3>
	<h3>Tem certeza que deseja efetuar este cancelamento?</h3>
	
	<table width="100%">
	<tr>
	<td width="50%" align="center">
	<form action="<c:url value="/pessoa/confirmaRemocao/email/" />" method="get">
	<input type="hidden" value="${pessoa.uuid}" name="uuid">
	<input class="buttonCadastrar" type="submit" value="SIM, Quero cancelar o cadastro" />
	</form>
	</td>
	<td width="50%" align="center">
	<form action="<c:url value="/site" />" method="get"> 
	<input class="button" type="submit" value="NAO, Desejo manter o cadastro" />
	</form>
	</td>
	</tr>
	</table>
</c:if>










</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>