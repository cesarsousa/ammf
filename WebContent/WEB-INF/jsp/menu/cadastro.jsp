
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>


<div align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>


<div id="areaLogin">

<c:if test="${not empty msgCadastro}">
<div class="msgBorder msgSucesso tamanhoErroLogin ponteiro closeClick">${msgCadastro}</div>
<br/>
</c:if>
<form action="<c:url value="/menu/cadastrar"/>" method="post">	 
	
	<c:if test="${not empty nomeEmBranco}">
		<label class="labelFormErro">${nomeEmBranco}</label>
		<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty nomeEmBranco}">
		<label class="labelForm">Nome:</label>
		<input id="pessoaNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	
	<c:if test="${not empty emailEmBranco}">
		<label class="labelFormErro">${emailEmBranco}</label>
		<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty emailEmBranco}">
		<label class="labelForm">Email:</label>
		<input id="pessoaEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<input id="btnCadastrarPessoa" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
</form>
</div>

<table class="tamanhoDefault">
	<tr>
		<td class="tdTableIcone">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<img id="btMenuAdm" alt="Menu Principal" title="Menu Principal" src="${imagem}/icone_menu.png" width="50" height="50" class="ponteiro esquerda">
		</form>
		</td>
		
		<td class="tdTableIcone">
		<img id="btAbrirToolsCadastro" alt="Outras opcoes de cadastro" title="Outras opcoes de cadastro" src="${imagem}/icone_setting.png" width="50" height="50" class="ponteiro esquerda">
		</td>
	</tr>
</table>

<div id="toolsAreaCadastro">

<div class="separador"></div>

<table class="tamanhoDefault">
		<tr>
			<td>
			<form id="formBuscaPessoa">
			<input id="campoBusca" type="text" class="fundoLupa sizebtGenerico areaTitulo3 bordaPadrao"/>
			</form>
			<p>
			<label id="labelResultadoConsulta"></label>		
			</p>			
			<input id="btFecharConsultaPessoas" type="button" class="button direita" value="^">
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
						<td style="background-color: #A2B5CD" colspan="2"></td>
						</tr>
					</thead>
						
					<tbody id="ulConsultadas">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>

	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoCadastradas" type="button" class="sizebtGenerico button esquerda" value="Visualizar todas as pessoas cadastradas" />
			<span class="info azulClaro" >Lista das pessoas cadastradas no site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasCadastradas" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoCadastradas" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoas">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoConfirmadas" type="button" class="sizebtGenerico backVerde button esquerda" value="Visualizar pessoas confirmadas" />
			<span class="info azulClaro" >Lista das pessoas que recebem notifica&ccedil;&atilde;o de textos do site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasConfirmadas" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoConfirmadas" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoasConfirmadas">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
	
	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoPendentes" type="button" class="sizebtGenerico backVermelho button esquerda" value="Visualizar pessoas pendentes" />
			<span class="info azulClaro" >Lista das pessoas pendente confirma&ccedil;&atilde;o para receber notifica&ccedil;&atilde;o de textos do site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasPendentes" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoPendentes" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoasPendentes">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
</div>

</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
