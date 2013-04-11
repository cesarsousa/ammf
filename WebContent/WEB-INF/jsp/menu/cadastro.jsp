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
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>Cadastro de Pessoa</h2>
<p>
<span class="info azulClaro">Cadastro e consulta de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
</p>

<table class="tamanhoDefault">
	<tr>
		<td class="tdTableIcone">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>		
		</form>
		</td>
		
		<%-- <td class="tdTableIcone">
		<img id="btAbrirToolsCadastro" alt="Outras opcoes de cadastro" title="Outras opcoes de cadastro" src="${imagem}/icone_setting.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
		
		<td class="tdTableIcone">
		<img id="iconBuscaPessoa" alt="buscar pessoa" title="buscar pessoa" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="iconPessoasCadastradas" alt="zer todas as pessoas" title="ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="iconPessoasConfirmadas" alt="zer pessoas confirmadas" title="ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="iconPessoasPendentes" alt="zer pessoas pendentes" title="ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="iconAddPessoa" alt="cadatrar pessoa" title="cadatrar pessoa" src="${imagem}/iconeAddHover.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
	</tr>
</table>

<div class="separador"></div>

<!-- CADASTRO DE PESSOA -->
<input id="flagCadastroPessoaVazio" type="hidden" value="${flagCadastroPessoaVazio}"  /> 
<div id="admNovoCadastroPessoa">

<table class="tamanhoDefault">
<tr>
	<td><label class="h1">Cadastro</label></td>
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

<tr>
	<td style="padding: 10px;">
	<div class="separador"></div>
	</td>
</tr>
</table>
</div>


<table id="tabBuscaPessoa" class="tamanhoDefault">
	<tr>
	<td><label class="h1">Buscar pessoa</label></td>
	</tr>
	<tr>
		<td>
		<form id="formBuscaPessoa">
		<input id="campoBusca" type="text" class="fundoLupa sizebtGenerico areaTitulo3 bordaPadrao"/>
		</form>
		<p>
		<label id="labelResultadoConsulta"></label>		
		</p>			
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoConsultaPessoas" class="cartao tamanhoEdicaoIndex" >								
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
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
	</tr>
</table>
	


<table id="tabPessoasCadastradas" class="tamanhoDefault">
	<tr>
	<td><label class="h1">Pessoas Cadastradas</label></td>
	</tr>
	<tr>
		<td >
		<input id="btFecharConteudoCadastradas" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasCadastradas" class="cartao tamanhoEdicaoIndex" >
			<table>
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
					
				<tbody id="ulPessoas">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
	</tr>
</table>	

	
<table id="tabPessoasConfirmadas" class="tamanhoDefault">
	<tr>
	<td><label class="h1">Pessoas Confirmadas</label></td>
	</tr>
	<tr>
		<td >
		<input id="btFecharConteudoConfirmadas" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasConfirmadas" class="cartao tamanhoEdicaoIndex" >								
			<table>
				<thead>
					<tr>
					<td colspan="4" class="headerTabPessoa backVerde">Visualiza&ccedil;&atilde;o de todas as pessoas confirmadas</td>
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
					
				<tbody id="ulPessoasConfirmadas">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
	</tr>
</table>
	
	
<table id="tabPessoasPendentes" class="tamanhoDefault">
	<tr>
	<td><label class="h1">Pessoas pendentes confirma&ccedil;&atilde;o</label></td>
	</tr>
	<tr>
		<td >
		<input id="btFecharConteudoPendentes" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasPendentes" class="cartao tamanhoEdicaoIndex" >								
			<table>
				<thead>
					<tr>
					<td colspan="4" class="headerTabPessoa backVermelho">Visualiza&ccedil;&atilde;o de todas as pessoas pendentes confirma&ccedil;&atilde;o</td>
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
					
				<tbody id="ulPessoasPendentes">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
	</tr>
</table>

</div> <!-- centralizacao -->

<div id="telaAguardeAdmCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>    
		<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para <span id="admNomeDoCliente"></span> referente ao cadastro.</h3>
		
		<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<%-- <div id="footer">
<%@ include file="/footer.jsp" %>
</div> --%>
