<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty participanteMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${participanteMensagemErro} 
	</div>
</c:if>

<%@ include file="/headerLib.jsp" %>

<div id="divPgParticipanteAdm" class="paddingPadrao">
<div align="center">

<h2>PARTICIPANTE</h2>

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

<!-- Modal resenha pré definida -->

<!-- CAMPO  DE BUSCA -->
<table class="cardViewText">		
	<tr>
		<td valign="middle">
		<form id="formBuscaTexto_paticipante" action="<c:url value="/participante/busca"></c:url>" method="get">
		<div align="center">
			<input id="campoBuscaTxt_participante" type="text" name="parametro" class="form-control" placeholder="Buscar por parte do nome..." />
			<br>
			<input type="submit" class="btn btn-success" value="Pesquisar">			
			
			<c:if test="${not empty resultBuscarInsucesso_paticipantes}">
			<div class="paddingPadrao">
			<div class="alert alert-info" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<b>${resultBuscarInsucesso_paticipantes}</b>
			</div>
			</div>
			</c:if>
			
		</div>	
		</form>
		</td>
	</tr>		
</table>

<!-- LISTAR TODOS OS TEXTOS -->

<c:if test="${not empty participantesDto}">
<table id="tabListagemResenhas" class="fullSize">	
	<tr>
	<td>
	
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<h3 align="center">Participantes e eventos relacionados.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">id</th>
				<th class="metadado">nome</th>
				<th class="metadado">pagouIngresso</th>
				<th class="metadado">constelou</th>
				<th class="metadado">pagouContelacao</th>
				<th class="metadado">observacao</th>
				<th class="metadado">data</th>
				<th class="metadado">local</th>
				<th class="metadado">valorIngresso</th>
				<th class="metadado">valorParticipacao</th>
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${participantesDto}" var="participanteDto">
				<tr class="zebrado">
					<td class="infoTabelaConteudo">${participanteDto.id}</td>
					<td class="infoTabelaConteudo">${participanteDto.nome}</td>
					<td class="infoTabelaConteudo ${participanteDto.pagouIngresso}"></td>
					<td class="infoTabelaConteudo ${participanteDto.constelou}"></td>
					<td class="infoTabelaConteudo ${participanteDto.pagouContelacao}"></td>
					<td class="infoTabelaConteudo">${participanteDto.observacao}</td>
					<td class="infoTabelaConteudo">${participanteDto.data}</td>
					<td class="infoTabelaConteudo">${participanteDto.local}</td>
					<td class="infoTabelaConteudo">${participanteDto.valorIngresso}</td>
					<td class="infoTabelaConteudo">${participanteDto.valorParticipacao}</td>					
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</td>
	</tr>
</table>
</c:if>
</div>

</div> <!-- div center -->



</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>