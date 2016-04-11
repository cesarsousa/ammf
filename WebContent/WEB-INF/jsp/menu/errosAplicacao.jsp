<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>
<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmFaq" align="center" class="paddingPadrao">

<h2>Erros da Aplica&ccedil;&atilde;o</h2>

<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li class="itemMenuPrincipal">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<c:if test="${not empty errosAplicacao}">	
<table class="display dataTable cardViewText superFooter bordaLateral">
	<thead>
		<tr>
		<th class="metadado" style="width: 20px">ID</th>
		<th class="metadado" style="width: 100px">Data</th>
		<th class="metadado">descricaoErro</th>
		</tr>
	</thead>
	
	<tbody>
		<c:forEach items="${errosAplicacao}" var="erro">
			<tr class="zebrado">
			<td class="infoTabelaConteudo" style="width: 20px">${erro.id}</td>
			<td class="infoTabelaConteudo" style="width: 100px">${erro.dataHora}</td>
			<td class="infoTabelaConteudo">${erro.descricaoErro}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</c:if>
<c:if test="${empty errosAplicacao}">	
<p class="textoAutorBlog azulClaro fonteGrande centralizar">Não existem erros a serem exibidos.</p>
</c:if>

</div> <!-- centralizacao -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
