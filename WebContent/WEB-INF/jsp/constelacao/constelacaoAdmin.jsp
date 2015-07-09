<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div align="center">
<%-- <c:if test="${not empty constelacaoMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${linkMensagemErro} 
	</div>
</c:if> --%>
<c:if test="${not empty constelacaoMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${constelacaoMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty flagLinkConstelacaoCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${dataEmBranco}
	${localEmBranco}
	</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgConstelacaoAdm" class="paddingPadrao">
<div align="center">

<h2>Constela&ccedil;&otilde;es Sist&ecirc;micas</h2>

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
		<img id="btAddNovoConstelacao" alt="Adicionar constelação" title="Adicionar constelação" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>	
	<li>
		<img id="btListarConstelacao" alt="listar constelações" title="listar constelações" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li> 	
</ul>
</td>
</tr>
</table>
</div>
 
<div class="separador"></div>

<!-- ADICIONAR UM NOVO LINK  -->

<input id="flagLinkConstelacaoCadastro" type="hidden" value="${flagLinkConstelacaoCadastro}" />

<table id="tabNovaConstelacao" class="cardViewText">		
	<tr>
		<td>
		<div align="right">
		<input id="btFecharAddConstelacao" type="button" value="fechar" class="btn btn-danger">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Cadastrar Constelação</h2>
		
		<form action="<c:url value="/constelacao/cadastrar"/>" method="post">
		
			<h3>Data:</h3>
			<input id="eventoData" class="form-control" name="evento.data" value="${evento.data}" maxlength="254" />
			<br/>			
						
			<h3>Endereço do local:</h3>
			<textarea id="eventoLocal" class="form-control" rows="4" name="evento.local">${evento.local}</textarea>
			<br/>
					
			<p class="paddingPadrao">
			<input id="btCadastrarConstelacao" type="submit" value="cadastrar" class="btn btn-success">
			<input id="btCancelarConstelacao" type="button" value="cancelar" class="btn btn-default">				
			</p>
		</form>			
		</td>
	</tr>
</table>
	
</div> <!-- div center -->

<!-- LISTAR TODOS OS LINKS -->

<input id="flagListagemConstelacao" type="hidden" value="${flagListagemConstelacao}" />
<form id="formListarConstelacao" action="<c:url value="/constelacao/listar"/>" method="get"></form>

<table id="tabListagemConstelacao" class="fullSize">	
	<tr>
	<td>
	<div align="right" class="paddingPadrao">		
	<input id="btFecharListagemConstelacao" type="button" value="fechar" class="btn btn-danger">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty eventos}">
	<h3 align="center">Não existem constelações a serem visualizadas </h3>
	</c:if>
	<c:if test="${not empty eventos}">
	<h3 align="center">Constelações Cadastradas</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Data</th>
				<th class="metadado">Endereço</th>				
				<th class="metadado" style="width: 160px;">Total de participante</th>
				<th class="metadado" style="width: 30px;">Incluir participante</th>
				<th class="metadado" style="width: 30px;">Remover</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${eventos}" var="evento">
				<tr class="zebrado">
					<td class="infoTabelaConteudo">${evento.data}</td>
					<td class="infoTabelaConteudo">${evento.local}</td>					
					<td class="infoTabelaConteudo" style="width: 160px;">${evento.totalParticipantes}</td>
										
					<td class="infoTabelaData" style="width: 30px;" align="center">
						<a href="<c:url value="/constelacao/incluirParticipante/${evento.id}"/>">
							<img class="icone" alt="Incluir participante" title="Incluir participante" src="${imagem}/iconeAddPessoaHover.png"></a>
					</td>
					
					<td class="infoTabelaData" style="width: 30px;" align="center">
						<a href="<c:url value="/constelacao/remover/${evento.id}"/>" onclick="return confirmarExclusao()" >
							<img class="icone" alt="Excluir constelação e todos os participantes" title="Excluir constelação e todos os participantes" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>
</div>

<div id="telaAguardeAdmConstelacaoCadastrar">
	<div align="center">
		
		<h2>Constela&ccedil;&otilde;es Sist&ecirc;micas</h2>
		<span class="info azulClaro letraGrande" >Constela&ccedil;&atilde;o sendo cadastrada/atualizada.</span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
		
		<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
