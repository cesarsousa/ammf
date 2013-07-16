<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<%-- <div id="divAdmMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${nomeEmBranco}<br/>${emailEmBranco}	
	</div>
</c:if>
</div> --%>

<c:if test="${not empty msgErroLojaAdm}">
	<div class="msgBorder msgErro ponteiro closeClick">${msgErroLojaAdm}</div>
</c:if>

<c:if test="${not empty msgLojaAdm}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgLojaAdm}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>LOJA VIRTUAL - Administra&ccedil;&atilde;o</h2>
<p>
<span class="info azulClaro">Gerenciamento da loja virtual</span>
</p>

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
		<img id="iconOpcaoLivro" alt="livros" title="livros" src="${imagem}/iconeLivro.png" class="icone50 ponteiro esquerda">
	</li>
	<%-- <li>
		<img id="iconAddPessoa" alt="cadatrar pessoa" title="cadatrar pessoa" src="${imagem}/iconeAddPessoaHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasCadastradas" alt="ver todas as pessoas" title="ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasConfirmadas" alt="zer pessoas confirmadas" title="ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasPendentes" alt="zer pessoas pendentes" title="ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
	</li> --%>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div style="width: 100%">

<table id="tabIconesLivros" style="padding: 10px;">	
	<tr>
		<td>
		<img id="fecharTabIconesLivros" alt="fechar livros" title="fechar livros" src="${imagem}/iconeCulturaHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="abrirAddLivro" alt="adicionar livro" title="adicionar livro" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="abrirBuscarEditarLivro" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="" alt="listar todos os livros" title="listar todos os livros" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
		</td>
	</tr>
</table>

<!-- CONSULTAR LIVROS -->
<table id="tabBuscaLivro" class="cardViewText superFooter bordaLateral">	
	<tr>
		<td>
		<div align="right">
		<input id="btFecharBuscaLivro" type="button" value="fechar" class="backVermelho button">
		</div>
		<img alt="left" src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
		<h2 align="center">Buscar e editar livro</h2>
		</td>
	</tr>
	<tr>		
		<td style="padding: 10px;">
		<form id="formBuscaLivro">
		<input id="campoBuscaLivro" type="text" class="fundoLupa areaTitulo3 bordaPadrao"/>
		</form>
		<p>
		<label id="labelResultadoConsultaLivro"></label>		
		</p>			
		</td>		
	</tr>
	<tr>
		<td>
		<div id="conteudoConsultaLivros" class="cartao">								
			<table>
				<thead>
					<tr>
					<td class="headTabela">C&oacute;digo</td>
					<td class="headTabela">Nome</td>
					<td class="headTabela">Email</td>
					<td class="headTabela">Data Cadastro</td>
					<td class="headTabela">Status</td>
					<td class="headTabela">Situa&ccedil;&atilde;o</td>
					<td class="w50 headTabela">A&ccedil;&atilde;o</td>
					</tr>
				</thead>
					
				<tbody id="ulLivrosConsultados">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>

<br/>

<!-- CADASTRAR LIVRO -->
<input id="flagCadastroLivroVazio" type="hidden" value="${flagCadastroLivroVazio}"  /> 
<table id="tabCadastrarLivro" class="cardViewText superFooter bordaLateral">
<tr>
	<td>
	<div align="right">
		<input id="btFecharCadastrarLivro" type="button" value="fechar" class="backVermelho button">
	</div>	
	<img align="left" src="${imagem}/iconeAddHover.png" width="50" height="50" class="esquerda">
	<h2 align="center">Cadastrar Livro</h2>
	</td>
</tr>

<tr align="center">
<td>
	<p>
		<span class="info azulClaro">Enviar um convite a uma pessoa.<br/>Esta pessoa receber&aacute; um email informando deste cadastro, e um link com o cancelamento, caso n&atilde;o concorde com o cadastro no site.</span>
	</p>
	<div id="areaLogin">
	
	<form action="<c:url value="/menu/cadastrar"/>" method="post">	 
		
		<label class="labelForm">Nome:</label>
		<c:if test="${not empty nomeEmBranco}">		
			<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
		</c:if>
		<c:if test="${empty nomeEmBranco}">		
			<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
		</c:if>
		
		<br/><br/>	
		
		
		<label class="labelForm">Email:</label>
		<c:if test="${not empty emailEmBranco}">
			<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
		</c:if>
		<c:if test="${empty emailEmBranco}">
			<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
		</c:if>
		
		<br/><br/>
		
		<input id="btnCadastrarPessoa" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>	
	</form>
	</div>
</td>
</tr>
</table>

<br/>

<form id="formListarPessoasCadastradas" action="<c:url value="/pessoa/listar" />" method="get"></form>
<form id="formListarPessoasConfirmadas" action="<c:url value="/pessoa/confirmadas" />" method="get"></form>
<form id="formListarPessoasPendentes" action="<c:url value="/pessoa/pendentes" />" method="get"></form>

<!--  LIVROS SOLICITADOS -->
<c:if test="${visualizarLivros}">
<table id="tabLivrosSolicitadas" class="superFooter bordaLateral">
	<tr>
		<td>
		<div align="right">
			<input id="btFecharLivrosSolicitadas" type="button" value="fechar" class="backVermelho button">
		</div>
		
		<c:if test="${isPessoasCadastradas}">
			<img src="${imagem}/usuario_cinza.png" width="50" height="50" class="esquerda">
		</c:if>
		<c:if test="${isPessoasConfirmadas}">
			<img src="${imagem}/usuario_verde.png" width="50" height="50" class="esquerda">
		</c:if>
		<c:if test="${isPessoasPendentes}">
			<img src="${imagem}/usuario_vermelho.png" width="50" height="50" class="esquerda">
		</c:if>	
		
		<span class="titulo ${cssCorFonte}">${tituloPessoasSolicitadas}</span>
		
		</td>
	</tr>	
	<tr>
		<td>
		<div id="conteudoLivrosSolicitadas">
			<table class="display dataTable cardViewText superFooter bordaLateral" >				
				<thead>
					<tr>
					<th class="metadado" style="width: 90px;">C&oacute;digo</th>
					<th class="metadado">Nome</th>
					<th class="metadado">Email</th>
					<th class="metadado">Data Cadastro</th>
					<th class="metadado">Status</th>
					<th class="metadado">Situa&ccedil;&atilde;o</th>
					<th class="metadado">A&ccedil;&otilde;es</th>
					</tr>
				</thead>					
				<tbody>
					<c:forEach items="${pessoasSolicitadas}" var="pessoa">
						<tr class="zebrado">
							<td class="infoTabela" style="width: 90px;">${pessoa.id}</td>
							<td class="infoTabela">${pessoa.nome}</td>
							<td class="infoTabela">${pessoa.email}</td>
							<td class="infoTabela">${pessoa.dataFormatada}</td>
							<td class="infoTabela ${pessoa.status}">${pessoa.status}</td>
							<td class="infoTabela">${pessoa.situacao}</td>
							<td>
								<c:if test="${pessoa.inativa}">							
									<a href="<c:url value="/pessoa/notificar/${pessoa.uuid}" />">
										<img id="btNotificarPessoa" src="${imagem}/iconeNotificacao.png" class="icone20 ponteiro" alt="reenviar notificacao" title="reenviar notificacao">
									</a>
								</c:if>
																
								<c:if test="${pessoa.pendente}">
									<a href="<c:url value="/pessoa/confirmar/${pessoa.uuid}" />">
										<img id="btConfirmarPessoa" src="${imagem}/icone_confirmar.png" class="icone20 ponteiro" alt="confirmar esta pessoa" title="confirmar esta pessoa">
									</a>
								</c:if>
								
								<a href="<c:url value="/pessoa/remover/${pessoa.uuid}" />">
									<img src="${imagem}/icone_excluir.png" onclick="return confirmarExclusao()" class="icone20 ponteiro" alt="excluir esta pessoa" title="excluir esta pessoa">
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

<div id="telaAguardeAdmCadastroLivro">
	<div align="center">
		
		<h2>Cadastro de Livro</h2>    
		<span class="info azulClaro" >Cadastro de livro. </span>
								
		<h3 class="paddingTelaAguarde">cadastrando livro.</h3>
		
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
