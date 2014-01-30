<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>
<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmFaq" align="center">

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
	<%-- <li>
		<img id="btAddNovaResenha" alt="adicionar texto" title="adicionar resenha" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btBuscarResenha" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btListarResenhas" alt="listar todos os textos" title="listar todos os textos" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenha" alt="visualizar comentários" title="visualizar comentários" src="${imagem}/iconeComentarioTodos.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenhaConfirmados" alt="comentários confirmados" title="comentários confirmados" src="${imagem}/iconeComentarioConfirmados.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenhaPendentes" alt="comentários pendentes" title="comentários pendentes" src="${imagem}/iconeComentarioPendentes.png" width="50" height="50" class="ponteiro esquerda">
	</li> --%>	
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
