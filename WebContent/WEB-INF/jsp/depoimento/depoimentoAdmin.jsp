<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty msgDepoimento}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgDepoimento}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>DEPOIMENTO</h2>

<!-- Barra de Icones
<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li>Menu Principal</li>
	<li>Busca</li>
	<li>Cadastrados</li>
	<li>Confirmados</li>
	<li>Pendentes</li>	
</ul>
</td>
</tr>
</table>
</div> -->

<!-- Barra de Icones -->
<form id="formDepoimentoVerTodos" action="<c:url value="/adm/depoimentos/cadastrados" />" method="get"></form>
<form id="formDepoimentosConfirmados" action="<c:url value="/adm/depoimentos/confirmados" />" method="get"></form>
<form id="formDepoimentosPendentes" action="<c:url value="/adm/depoimentos/pendentes" />" method="get"></form>

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
	<li>
		<img id="btBuscaDepoimento" alt="buscar" title="buscar" src="${imagem}/iconeComentarioBuscar.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btDepoimentoVerTodos" alt="depoimentos cadastrados" title="depoimentos cadastrados" src="${imagem}/iconeComentarioTodos.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btDepoimentosConfirmados" alt="depoimentos confirmados" title="depoimentos confirmados" src="${imagem}/iconeComentarioConfirmados.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btDepoimentosPendentes" alt="depoimentos pendentes" title="depoimentos pendentes" src="${imagem}/iconeComentarioPendentes.png" width="50" height="50" class="ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<table id="tabBuscaDepoimento" class="grid fullSize">
<thead>
<tr>	
	<td colspan="5">
	<div align="right">
	<input id="btFecharBuscarDepoimentos" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/iconeComentarioBuscar.png" class="icone50 esquerda">
	<h2 align="center">Buscar Depoimento</h2>
	</td>	
</tr>
<tr>	
	<td colspan="5" align="center" valign="middle"><p class="info azulClaro">Busca de depoimentos pelo nome ou email</p></td>	
</tr>
<tr>
	<td colspan="5" style="padding: 20px;">
		<div align="left">
		<input id="flagMostrarBusca" type="hidden" value="${flagMostrarBusca}">
		<form id="formBuscaDepoimento" action="<c:url value="/menu/busca/depoimento" />" method="get">
		
		<div align="center">
		<input id="campoBuscaDepoimento" type="text" name="paramConsulta" class="fundoLupa w500px bordaPadrao"/>
		</div>
		
		</form>
		</div>
	</td>
</tr>
<tr>	
	<td colspan="5" align="center" valign="middle" style="padding-bottom: 10px;"><p id="labelResultadoConsulta" class="info azulClaro">${labelResultadoConsulta}</p></td>	
</tr>
</thead>
</table>

<c:if test="${not empty depoimentosRequest}">
<table id="tabDepoimentosCadastrados" class="fullSize" >
	<tr>
	<td>
	<div align="right">
		<input id="btFecharDepoimentosSolicitados" type="button" value="fechar" class="backVermelho button">
	</div>
	
	<c:if test="${isDepoimentosCadastrados}">
		<img src="${imagem}/iconeComentarioTodos.png" class="icone50 esquerda">
	</c:if>
	<c:if test="${isDepoimentosConfirmados}">
		<img src="${imagem}/iconeComentarioConfirmados.png" class="icone50 esquerda">
	</c:if>
	<c:if test="${isDepoimentosPendentes}">
		<img src="${imagem}/iconeComentarioPendentes.png" class="icone50 esquerda">
	</c:if>
		
	<div align="center">
		<span class="titulo ${backgroundTitulo}">${tituloDepoimentosSolicitados}</span>
	</div>
	
	</td>
	</tr>
	<tr>
	<td>
		<table class="display dataTable cardViewText superFooter bordaLateral">
			<thead id="metadadoBuscaDepoimento">
				<tr>
				<th class="metadado">Nome</th>
				<th class="metadado">Email</th>
				<th class="metadado">Depoimento</th>
				<th class="metadado">Postagem</th>
				<th class="metadado">Status</th>				
				<th class="metadado" style="width: 100px">A&ccedil;&atilde;o</th>
				</tr>
			</thead>
			
			<tbody id="resultBuscaDepoimento">
				<c:forEach items="${depoimentosSolicitados}" var="depoimento">
					<tr class="zebrado">
					<td class="infoTabela">${depoimento.autor}</td>
					<td class="infoTabela">${depoimento.email}</td>
					<td class="infoTabelaConteudo">${depoimento.conteudo}</td>
					<td class="infoTabelaData">${depoimento.dataFormatada}</td>
					<td class="infoTabela ${depoimento.status}">${depoimento.status}</td>
					<td class="infoTabela" align="center" style="width: 100px">
						<c:choose>
							<c:when test="${depoimento.pendente}">
							<a href="<c:url value="/menu/depoimentos/confirmar/${depoimento.uuid}" />"><img class="icone" alt="aceitar depoimento" title="aceitar depoimento" src="${imagem}/icone_confirmar.png"></a>
							</c:when>
							<c:otherwise>
							<img class="icone" alt="confirmado" title="confirmado" src="${imagem}/iconeConfirmarDisabled.png">
							</c:otherwise>
						</c:choose>
						<a href="<c:url value="/menu/depoimentos/excluir/${depoimento.uuid}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir depoimento" title="excluir depoimento" src="${imagem}/icone_excluir.png"></a>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</td>
	</tr>
</table>
</c:if>

</div> <!-- centralizacao -->

<%-- <div id="telaAguardeAdmCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>    
		<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para <span id="admNomeDoCliente"></span> referente ao cadastro.</h3>
		
		<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div> --%>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
