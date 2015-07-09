<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div id="divAdmMsgCadCliente" align="center">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${nomeEmBranco}
	${emailEmBranco}	
	</div>
</c:if>
</div>

<div align="center">
<c:if test="${not empty msgCadastro}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgCadastro}</div>
<br/>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center" class="paddingPadrao">

<h2>CADASTRO</h2>

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
		<img id="iconAddPessoa" alt="cadatrar pessoa" title="cadatrar pessoa" src="${imagem}/iconeAddPessoaHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconBuscaPessoa" alt="buscar pessoa" title="buscar pessoa" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasCadastradas" alt="ver todas as pessoas" title="ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasConfirmadas" alt="zer pessoas confirmadas" title="ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasPendentes" alt="zer pessoas pendentes" title="ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div style="width: 100%">

<!-- CADASTRAR PESSOA -->
<input id="flagCadastroPessoaVazio" type="hidden" value="${flagCadastroPessoaVazio}"  /> 
<table id="tabCadastrarPessoa" class="cardViewText">
<tr>
	<td>
	<div align="right">
		<input id="btFecharCadastrarPessoa" type="button" value="fechar" class="btn btn-danger">
	</div>	
	<img align="left" src="${imagem}/iconeAddPessoaHover.png" width="50" height="50" class="esquerda">
	<h2 align="center">Cadastrar Pessoa</h2>
	</td>
</tr>

<tr align="center">
<td>
	<p class="info azulClaro">Esta pessoa receber&aacute; um email informando deste cadastro e um link com o cancelamento, caso n&atilde;o concorde com o cadastro no site.</p>
	<div id="areaLogin">
	
	<form action="<c:url value="/menu/cadastrar"/>" method="post">	 
		
		<label class="labelForm">Nome</label>
		<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura40 bordaPadrao" maxlength="100"/>
		<br/><br/>	
		
		<label class="labelForm">Email</label>
		<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura40 bordaPadrao" maxlength="100"/>
		<br/><br/>
		
		<input id="btnCadastrarPessoa" type="submit" value="Cadastrar"  class="btn btn-success"/>	
	</form>
	</div>
</td>
</tr>
</table>

<br/>

<form id="formListarPessoasCadastradas" action="<c:url value="/pessoa/listar" />" method="get"></form>
<form id="formListarPessoasConfirmadas" action="<c:url value="/pessoa/confirmadas" />" method="get"></form>
<form id="formListarPessoasPendentes" action="<c:url value="/pessoa/pendentes" />" method="get"></form>

<!-- CONSULTAR PESSOA -->
<input id="flagCampoBuscar" type="hidden" value="${flagCampoBuscar}"  />
<table id="tabBuscaPessoa" class="cardViewText">		
	<tr>
		<td valign="middle">
		<p align="right">
		<input id="btFecharBuscaPessoa" type="button" value="fechar" class="btn btn-danger">
		</p>
		
		<form action="<c:url value="/pessoa/consulta"></c:url>" method="get">
		<div align="center">
			<input width="100%" id="campoBusca" type="text" name="paramConsulta" class="form-control" placeholder="Buscar pelo código, nome ou e-mail da pessoa...">
			<br>
			<button class="btn btn-success" type="submit">Pesquisar</button>
		
			<p class="paddingPadrao">
			<span class="info paddingPadrao" ><label id="labelBuscaResenha">${resultBuscarPessoa}</label></span>
			</p>
		</div>	
		</form>
		</td>
	</tr>
</table>

<!--  PESSOAS SOLICITADAS -->
<input id="flagVisualizarPessoas" type="hidden" value="${flagVisualizarPessoas}" />
<c:if test="${visualizarPessoas}">
<table id="tabPessoasSolicitadas" class="superFooter">
	<tr>
		<td>
		<div align="right" class="paddingPadrao">
			<input id="btFecharPessoasSolicitadas" type="button" value="fechar" class="btn btn-danger">
		</div>
		
		<c:if test="${isPessoasCadastradas}">
			<img src="${imagem}/usuario_cinza.png" width="50" height="50" class="esquerda">
			<c:set var="destino" value="ALL"></c:set>
		</c:if>
		<c:if test="${isPessoasConfirmadas}">
			<img src="${imagem}/usuario_verde.png" width="50" height="50" class="esquerda">
			<c:set var="destino" value="OK"></c:set>
		</c:if>
		<c:if test="${isPessoasPendentes}">
			<img src="${imagem}/usuario_vermelho.png" width="50" height="50" class="esquerda">
			<c:set var="destino" value="NOK"></c:set>
		</c:if>	
		
		<span class="titulo ${cssCorFonte}">${tituloPessoasSolicitadas}</span>
		
		</td>
	</tr>	
	<tr>
		<td>
		<div id="conteudoPessoasSolicitadas">
			<table class="display dataTable cardViewText superFooter bordaLateral" >				
				<thead>
					<tr>
					<th class="metadado" style="width: 90px;">C&oacute;digo</th>
					<th class="metadado">Nome</th>
					<th class="metadado">Email</th>
					<th class="metadado">Data Cadastro</th>
					<th class="metadado">Status</th>
					<th class="metadado">Situa&ccedil;&atilde;o</th>
					<th class="metadado">.</th>
					<th class="metadado">.</th>
					<th class="metadado">.</th>
					</tr>
				</thead>					
				<tbody>
					<c:forEach items="${pessoasSolicitadas}" var="pessoa">
						<tr class="zebrado">
							<td class="infoTabelaConteudo" style="width: 90px;">${pessoa.id}</td>
							<td class="infoTabelaConteudo">${pessoa.nome}</td>
							<td class="infoTabelaConteudo">${pessoa.email}</td>
							<td class="infoTabelaConteudo">${pessoa.dataFormatada}</td>
							<td class="infoTabelaConteudo ${pessoa.status}"><b>${pessoa.status}</b></td>
							<td class="infoTabelaConteudo ${pessoa.situacao}"><b>${pessoa.situacao}</b></td>
							
							<td>
								<c:choose>
									<c:when test="${pessoa.pendente}">
										<a href="<c:url value="/pessoa/confirmar/${pessoa.uuid}/${destino}" />">
										<img id="btConfirmarPessoa" src="${imagem}/icone_confirmar.png" class="icone20 ponteiro" alt="confirmar" title="confirmar">
										</a>
									</c:when>
									<c:otherwise>
										<img id="btNotificarPessoa" src="${imagem}/iconeConfirmarDisabled.png" class="icone20">
									</c:otherwise>
								</c:choose>
							</td>
							
							<td>							
								<c:choose>
									<c:when test="${pessoa.inativa}">
										<a href="<c:url value="/pessoa/notificar/${pessoa.uuid}/${destino}" />">
										<img id="btNotificarPessoa" src="${imagem}/iconeNotificacao.png" class="icone20 ponteiro" alt="reenviar notificacao" title="reenviar notificacao">
										</a>
									</c:when>
									<c:otherwise>
										<img id="btNotificarPessoa" src="${imagem}/iconeNotificacaoBlack.png" class="icone20">
									</c:otherwise>
								</c:choose>
							</td>
							
							<td>							
								<a href="<c:url value="/pessoa/remover/${pessoa.uuid}/${destino}" />">
									<img src="${imagem}/icone_excluir.png" onclick="return confirmarExclusao()" class="icone20 ponteiro" alt="excluir" title="excluir">
								</a>								
							</td>							
							
						</tr>
					</c:forEach>						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>
</c:if>

</div>
</div> <!-- centralizacao -->

<div id="telaAguardeAdmCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>    
		<span class="info azulClaro letraGrande" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para o cliente referente ao cadastro.</h3>
		
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
