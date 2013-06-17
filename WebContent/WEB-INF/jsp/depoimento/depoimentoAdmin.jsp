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
<div class="menuOpcao" >
<ul class="itemMenuOpcao">
	<li>MENU PRINCIPAL</li>
	<li>BUSCA</li>
	<li>CADASTRADOS</li>
	<li>CONFIRMADOS</li>
	<li>PENDENTES</li>	
</ul>

</div>


<div align="center">
<table id="tabNotificacaoDepoimento">  
  <tr align="center">
  	<td class="tdTableIcone" width="60px">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
		</td>
    <td width="33%">    	
    	<div class="cardDepoimento depsCadAll fundoAzulClaro">
    	${totalDepoimentosCadastrados} depoimentos cadastrados
    	<br/>
    	<a href="<c:url value="/adm/depoimentos/cadastrados" />">Visualizar</a> | 
    	<a>Remover todos</a>    	
    	</div>
    </td>
    <td width="33%">
		<div class="cardDepoimento depsCadExib fundoVerde">
		${totalDepoimentosExibidos} depoimentos em exibi&ccedil;&atilde;o
		<br/>		
    	<a href="<c:url value="/adm/depoimentos/confirmados" />">Visualizar</a> |
    	<a>Remover todos</a>
    	</div>
	</td>
    <td width="33%">
		<div class="cardDepoimento depsCadPend fundoVermelho">
		${totalDepoimentosPendentes} depoimentos pendentes confirma&ccedil;&atilde;o
    	<br/>		
    	<a href="<c:url value="/adm/depoimentos/pendentes" />">Visualizar</a> |
    	<a id="btRemoverTodosDepoimentos" href="removertodos">Remover todos</a>
    	</div>
	</td>
  </tr>
</table>
</div>



<%-- <div style="width: 100%">

	<table class="cardViewText">
	<tr>
		<td>
		<img alt="" title="" src="${imagem}/iconeComentarioBuscar.png" width="50" height="50" class="ponteiro esquerda">
		<h2>Novo Texto</h2>			
		</td>
	</tr>
	</table>
	
	<br/>
	
	<!-- DEPOIMENTOS CADASTRADOS -->
	<table class="cardViewText">
	<tr>
		<td>
		<img id="btDepoimentoVerTodos" src="${imagem}/iconeComentarioTodos.png" width="50" height="50" class="ponteiro esquerda">
		<h2>Visualizar Todos</h2>			
		</td>		
	</tr>
	<tr id="trAdmTodosDepoimentos">
		<td>
		<div align="right">		
		<input id="btFecharDepoimentoVerTodos" type="button" value="fechar" class="backVermelho button">
		</div>
		<table class="display dataTable cardViewText superFooter bordaLateral">
			<thead>
				<tr>
				<td class="metadado">nome</td>
				<td class="metadado">email</td>
				<td class="metadado">depoimento</td>
				<td class="metadado">postagem</td>
				<td class="metadado">status</td>				
				<td class="metadado">O que fazer?</td>
				</tr>
			</thead>
			
			<tbody id="resultTodosDepoimentos"></tbody>

		</table>
		
		</td>		
	</tr>
	</table>
	
	<br/>
	
	<table class="cardViewText">
	<tr>
		<td>
		<img alt="" title="" src="${imagem}/iconeComentarioConfirmados.png" width="50" height="50" class="ponteiro esquerda">
		<h2>Novo Texto</h2>			
		</td>
	</tr>
	</table>
	
	<br/>
	
	<table class="cardViewText">
	<tr>
		<td>
		<img alt="" title="" src="${imagem}/iconeComentarioPendentes.png" width="50" height="50" class="ponteiro esquerda">
		<h2>Novo Texto</h2>			
		</td>
	</tr>
	</table>
		
</div> --%>




<table class="grid" style="background-color: #FFFFFF; border-top: 1px solid #CCCCCC; width: 100%">
<thead>
<tr>	
	<td colspan="5" align="center" valign="middle"><label id="labelResultadoConsulta">Busca de depoimentos pelo nome ou email</label></td>	
</tr>
<tr>
	<td colspan="5">
		<div align="center">
		<form id="formBuscaDepoimento" action="<c:url value="/menu/busca/depoimento" />" method="get">
				<input id="campoBuscaDepoimento" type="text" name="paramConsulta" class="fundoLupa areaTitulo3 bordaPadrao"/>
		</form>
		</div>
	</td>
</tr>
</thead>
</table>

<c:if test="${not empty depoimentosSolicitados}">
<div style="background-color: #FFFFFF; border-top: 1px solid #CCCCCC; border-bottom: 1px solid #CCCCCC; width: 100%">
<table class="display dataTable">
	<thead id="metadadoBuscaDepoimento">
		<tr>
		<th class="metadado">nome</th>
		<th class="metadado">email</th>
		<th class="metadado">depoimento</th>
		<th class="metadado">postagem</th>
		<th class="metadado">status</th>				
		<th class="metadado">O que fazer?</th>
		</tr>
	</thead>
	
	<tbody id="resultBuscaDepoimento">
		<c:forEach items="${depoimentosSolicitados}" var="depoimento">
			<tr class="zebrado">
			<td class="infoTabela">${depoimento.autor}</td>
			<td class="infoTabela">${depoimento.email}</td>
			<td class="infoTabelaConteudo">${depoimento.conteudo}</td>
			<td class="infoTabelaData">${depoimento.dataFormatada}</td>
			<td class="infoTabela">${depoimento.status}</td>
			<td class="infoTabela" align="center">
				<a href="<c:url value="/menu/depoimentos/confirmar/${depoimento.uuid}" />"><img class="icone" alt="aceitar depoimento" title="aceitar depoimento" src="${imagem}/icone_confirmar.png"></a>
				<a href="<c:url value="/menu/depoimentos/excluir/${depoimento.uuid}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir depoimento" title="excluir depoimento" src="${imagem}/icone_excluir.png"></a>
			</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</c:if>


<%-- <c:if test="${not empty depoimentosSolicitados}">
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
						<td class="infoTabela">${depoimento.email}</td>
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
</c:if> --%>

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
<%@ include file="/footerADM.jsp" %>
</div>
