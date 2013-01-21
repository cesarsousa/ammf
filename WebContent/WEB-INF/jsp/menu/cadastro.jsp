
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>


<div align="center">

<h2>Cadastro de Pessoa</h2>
<span class="info azulClaro" >Cadastro de pessoas que ir&atilde;o receber as notifica&ccedil;&otilde;es de email sempre que um texto for cadastro ou alterado. </span>

<c:if test="${not empty msgCadastro}">
<div class="msgBorder msgSucesso tamanhoErroLogin ponteiro closeClick">${msgCadastro}</div>
<br/>
</c:if>

<div id="areaLogin">

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
		
		<%-- <td class="tdTableIcone">
		<img id="btAbrirToolsCadastro" alt="Outras opcoes de cadastro" title="Outras opcoes de cadastro" src="${imagem}/icone_setting.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
		
		<td class="tdTableIcone">
		<img id="iconBuscaPessoa" alt="Buscar pessoa" title="Buscar pessoa" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="iconPessoasCadastradas" alt="Ver todas as pessoas" title="Ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="" alt="Ver pessoas confirmadas" title="Ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
		<td class="tdTableIcone">
		<img id="" alt="Ver pessoas pendentes" title="Ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
		</td>
		
	</tr>
</table>

<div class="separador"></div>


<table id="tabBuscaPessoa" class="tamanhoDefault">
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
	<tr>
	<td><div class="separador"></div></td>
	</tr>
</table>
	


<table id="tabPessoasCadastradas" class="tamanhoDefault">
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
					</tr>
				</thead>
					
				<tbody id="ulPessoas">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>
	<tr>
	<td><div class="separador"></div></td>
	</tr>
</table>	

	
<table id="tabPessoasConfirmadas" class="tamanhoDefault">
	<tr>
		<td >
		<input id="btAbrirConteudoConfirmadas" type="button" class="sizebtGenerico backVerde button esquerda" value="Visualizar pessoas confirmadas" />
		<span class="info azulClaro" >Lista das pessoas que recebem notifica&ccedil;&atilde;o de textos do site.</span>
		<input id="btFecharConteudoConfirmadas" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasConfirmadas" class="cartao tamanhoEdicaoIndex" >								
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
	<tr>
	<td><div class="separador"></div></td>
	</tr>
</table>
	
	
<table class="tamanhoDefault">
	<tr>
		<td >
		<input id="btAbrirConteudoPendentes" type="button" class="sizebtGenerico backVermelho button esquerda" value="Visualizar pessoas pendentes" />
		<span class="info azulClaro" >Lista das pessoas pendente confirma&ccedil;&atilde;o para receber notifica&ccedil;&atilde;o de textos do site.</span>
		<input id="btFecharConteudoPendentes" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasPendentes" class="cartao tamanhoEdicaoIndex" >								
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

</div> <!-- centralizacao -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
