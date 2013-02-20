
<div class="msgBorder msgInfo">
ADMINISTRADOR - Voc&ecirc; est&aacute; logado como ${sessaoUsuario.usuario.nome} (${sessaoUsuario.usuario.email}). <span id="btLogout">Sair</span>
<form id="formLogout" action="<c:url value="/logout" />"></form>
</div>

<%-- <div id="divAdmMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro closeClick">${nomeEmBranco}<br/>${emailEmBranco}</div>
</c:if>
</div> --%>

<%-- <c:if test="${not empty msgCadastro}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgCadastro}</div>
<br/>
</c:if> --%>

<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>Depoimentos Cadastrados</h2>
<span class="info azulClaro" >Depoimento dos usu&aacute;rios do site</span>

<%-- <div id="areaLogin">
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
</div> --%>

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
		
		
		<%-- <td class="tdTableIcone">
		<img id="iconBuscaPessoa" alt="Buscar pessoa" title="Buscar pessoa" src="${imagem}/usuario_lupa.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
		<%-- <td class="tdTableIcone">
		<img id="iconPessoasCadastradas" alt="Ver todas as pessoas" title="Ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
		<%-- <td class="tdTableIcone">
		<img id="iconPessoasConfirmadas" alt="Ver pessoas confirmadas" title="Ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
		<%-- <td class="tdTableIcone">
		<img id="iconPessoasPendentes" alt="Ver pessoas pendentes" title="Ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
		</td> --%>
		
	</tr>
</table>

<div class="separador"></div>	

<c:if test="${not empty depoimentosPendentes}">	
<table id="" class="tamanhoDefault fundoErro">
	<tr>
		<td >
		<input id="" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoPessoasPendentes" class="cartao tamanhoEdicaoIndex" >								
			<table>
				<thead>
					<tr>
					<td colspan="4" class="headerTabPessoa backVermelho">Visualiza&ccedil;&atilde;o dos depoimentos pendentes confirma&ccedil;&atilde;o</td>
					</tr>					
				</thead>
				<thead>
					<tr>
					<td class="headTabela">Nome</td>
					<td class="headTabela">Email</td>
					<td class="headTabela">Data Cadastro</td>
					<td class="headTabela">A&ccedil;&otilde;es</td>
					</tr>
				</thead>				
					
				<tbody id="">
				<c:forEach items="${depoimentosPendentes}" var="depoimento">
					<tr>
						<td class="infoTabela">${depoimento.autor}</td>
						<td class="infoTabela">${depoimento.titulo}</td>
						<td class="infoTabela">${depoimento.dataFormatada}</td>
						<td class="infoTabela" align="center"><label class="CONFIRMADO">confirmar</label> <label class="PENDENTE">excluir</label></td>
					</tr>
					<tr>
						<td class="bordaInferior" colspan="4">${depoimento.conteudo}</td>
					</tr>				
				</c:forEach>						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao"><div class="separador"></div></td>
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
<%@ include file="/footer.jsp" %>
</div>
