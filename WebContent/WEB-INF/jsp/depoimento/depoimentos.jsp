<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty msgDepoimento}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgDepoimento}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>Depoimentos Cadastrados</h2>
<span class="info azulClaro" >Depoimento dos usu&aacute;rios do site</span>

<!-- Barra de Icones -->
<table class="tamanhoDefault">
	<tr>
		<td class="tdTableIcone">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
		</td>		
	</tr>
</table>

<div align="center">
<table id="tabNotificacaoDepoimento">  
  <tr align="center">
    <td width="33%">
    	<div class="cardDepoimento depsCadAll fundoAzulClaro">
    	${totalDepoimentosCadastrados} depoimentos cadastrados
    	<br/>
    	<a href="<c:url value="/adm/depoimentos/cadastrados" />">Visualizar todos</a> | 
    	<a>Remover todos</a>    	
    	</div>
    </td>
    <td width="33%">
		<div class="cardDepoimento depsCadExib fundoVerde">
		${totalDepoimentosExibidos} depoimentos em exibi&ccedil;&atilde;o
		<br/>		
    	<a href="<c:url value="/adm/depoimentos/confirmados" />">Visualizar todos</a> |
    	<a>Remover todos</a>
    	</div>
	</td>
    <td width="33%">
		<div class="cardDepoimento depsCadPend fundoVermelho">
		${totalDepoimentosPendentes} depoimentos pendentes confirma&ccedil;&atilde;o
    	<br/>		
    	<a href="<c:url value="/adm/depoimentos/pendentes" />">Visualizar todos</a> |
    	<a id="btRemoverTodosDepoimentos" href="removertodos">Remover todos</a>
    	</div>
	</td>
  </tr>
</table>
</div>

<div class="separador"></div>

<table class="tamanhoDefault">
<thead>
<tr>	
	<td colspan="4" align="center" valign="middle"><label id="labelResultadoConsulta">Busca de depoimentos pelo nome ou email</label></td>	
</tr>
<tr>
	<td colspan="4">
		<div align="center">
		<form id="formBuscaDepoimento">
				<input id="campoBuscaDepoimento" type="text" class="fundoLupa areaTitulo3 bordaPadrao"/>
		</form>
		</div>
	</td>
</tr>
</thead>

<thead id="metadadoBuscaDepoimento">
	<tr>
	<td class="metadado">nome</td>
	<td class="metadado">email</td>
	<td class="metadado">depoimento</td>
	<td class="metadado">postagem</td>				
	<td class="metadado">O que fazer?</td>
	</tr>
</thead>


<tbody id="resultBuscaDepoimento">

</tbody>

</table>

<div class="separador"></div>


<c:if test="${not empty depoimentosSolicitados}">
<div id="tabDepoimentosSolicitados">	
<table class="tamanhoDefault">
	<tr>
		<td >
		<input id="btFecharDepoimentosSolicitados" type="button" class="button direita" value="^">
		</td>
	</tr>
	<tr>
		<td>
		<div id="conteudoDepoimentosSolicitados" class="cartao tamanhoEdicaoIndex" >								
			<table>
				<thead>
					<tr>
					<td colspan="4" class="headerTabPessoa ${backgroundTitulo}">${msgTitulo}</td>
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
					
				<tbody>
				<c:forEach items="${depoimentosSolicitados}" var="depoimento">
					
					<c:if test="${depoimento.confirmado}">
						<c:set var="cssBack" value="fundoTabVerde" />						
					</c:if>
					<c:if test="${not depoimento.confirmado}">
						<c:set var="cssBack" value="fundoTabVermelho" />
					</c:if>
										
					<tr class="zebrado ${cssBack}">
						<td class="infoTabela">${depoimento.autor}</td>
						<td class="infoTabela">${depoimento.titulo}</td>
						<td class="infoTabela">${depoimento.dataFormatada}</td>
						<td class="infoTabela" align="center">
							<a href="<c:url value="/menu/depoimentos/confirmar/${depoimento.uuid}" />"><img class="icone" alt="aceitar depoimento" title="aceitar depoimento" src="${imagem}/icone_confirmar.png"></a>
							<a href="<c:url value="/menu/depoimentos/excluir/${depoimento.uuid}" />"><img class="icone" alt="excluir depoimento" title="excluir depoimento" src="${imagem}/icone_excluir.png"></a>
						</td>						
					</tr>
					<tr class="zebrado ${cssBack}">
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
</div>
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

<%-- <div id="footer">
<%@ include file="/footer.jsp" %>
</div> --%>
