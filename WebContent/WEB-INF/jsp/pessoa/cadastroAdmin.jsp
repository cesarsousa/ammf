<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div id="divAdmMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro closeClick">${nomeEmBranco}<br/>${emailEmBranco}</div>
</c:if>
</div>

<c:if test="${not empty msgCadastro}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgCadastro}</div>
<br/>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>Cadastro de Pessoa</h2>
<p>
<span class="info azulClaro">Cadastro e consulta de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
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
		<img id="iconBuscaPessoa" alt="buscar pessoa" title="buscar pessoa" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
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
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div style="width: 100%">

<!-- CONSULTAR PESSOA -->
<table id="tabBuscaPessoa" class="cardViewText superFooter bordaLateral">	
	<tr>
		<td>
		<div align="right">
		<input id="btFecharBuscaPessoa" type="button" value="fechar" class="backVermelho button">
		</div>
		<img align="left" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
		<h2 align="center">Consultar Pessoas</h2>
		</td>
	</tr>
	<tr>		
		<td class="centralizar" style="padding: 10px;">
		<form id="formBuscaPessoa">
		<input id="campoBusca" type="text" class="fundoLupa w90 areaTitulo3 bordaPadrao"/>
		</form>
		<p>
		<label id="labelResultadoConsulta"></label>		
		</p>			
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoConsultaPessoas" class="cartao">								
			<table>
				<thead>
					<tr>
					<td class="headTabela">Nome</td>
					<td class="headTabela">Email</td>
					<td class="headTabela">Data Cadastro</td>
					<td class="headTabela">Status</td>
					<td></td>
					</tr>
				</thead>
					
				<tbody id="ulConsultadas">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>

<br/>

<!-- CADASTRAR PESSOA -->
<input id="flagCadastroPessoaVazio" type="hidden" value="${flagCadastroPessoaVazio}"  /> 
<table id="tabCadastrarPessoa" class="cardViewText superFooter bordaLateral">
<tr>
	<td>
	<div align="right">
		<input id="btFecharCadastrarPessoa" type="button" value="fechar" class="backVermelho button">
	</div>	
	<img align="left" src="${imagem}/iconeAddPessoaHover.png" width="50" height="50" class="ponteiro esquerda">
	<h2 align="center">Cadastrar Pessoa</h2>
	</td>
</tr>

<tr align="center">
<td>
	<div id="areaLogin">
	
	<form action="<c:url value="/menu/cadastrar"/>" method="post">
		<p>
		<span class="info azulClaro">Entre com os dados da pessoa</span>
		</p>	 
		
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

<!--  PESSOAS SOLICITADAS -->
<table id="tabPessoasSolicitadas" class="cardViewText superFooter bordaLateral">
	<tr>
		<td>
		<div align="right">
			<input id="btFecharPessoasSolicitadas" type="button" value="fechar" class="backVermelho button">
		</div>
		<img align="left" id="iconTituloPessoasSolicitadas" width="50" height="50" class="ponteiro esquerda">	
		<div id="tituloPessoasSolicitadas"></div>
		<div id="mensagemSemRegistro"></div>   
		</td>
	</tr>	
	<tr>
		<td>
		<div id="conteudoPessoasSolicitadas">
			<table class="display" id="example" >
				<thead>
					<tr>
					<td colspan="4" class="headerTabPessoa backCinza">Visualiza&ccedil;&atilde;o de todas as pessoas cadastradas</td>
					</tr>					
				</thead>
				<thead>
					<tr>
					<td class="headTabela">Nome</td>
					<td class="headTabela">Email</td>
					<td class="headTabela">Data Cadastro</td>
					<td class="headTabela">Status</td>
					<td></td>
					</tr>
				</thead>
					
				<tbody id="bodyPessoasSolicitadas">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>

</div>

</div> <!-- centralizacao -->

<div id="telaAguardeAdmCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>    
		<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para <span id="admNomeDoCliente"></span> referente ao cadastro.</h3>
		
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