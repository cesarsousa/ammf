<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty resenhaMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${resenhaMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty resenhaMensagemErro}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${resenhaMensagemErro} 
	</div>
</c:if>
<c:if test="${resenhaErroCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	Verifique campos obrigat&oacute;rios n&atilde;o preenchidos<br/>
	${a}${b}${c}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>RESENHA</h2>
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de resenhas.</span>

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
		<img id="btAddNovaResenha" alt="adicionar texto" title="adicionar resenha" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btBuscarResenha" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btListarResenhas" alt="listar todos os textos" title="listar todos os textos" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>
 
<div class="separador"></div>

<!-- ADICIONAR UMA NOVA RESENHA -->
<input id="flagCadastrarResenhaVazia" type="hidden" value="${flagCadastrarResenhaVazia}" >
	
	<table id="tabNovaResenha" class="cardViewText">		
		<tr>
			<td>
			<div align="right">
			<input id="btFecharAddResenha" type="button" value="fechar" class="backVermelho button">
			</div>
			<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
			<h2 align="center">Nova Resenha</h2>
			
			<form id="formNovaResenha" action="<c:url value="/resenha/nova"/>" method="post" class="paddingPadrao">				
								
				<h3>T&iacute;tulo :</h3>
				<input id="resenhaTitulo" type="text" class="areaTitulo bordaPadrao corAzul" name="resenha.titulo" value="${resenha.titulo}" />
					
				<h3>Autor :</h3>
				<input id="resenhaAutor" type="text" class="areaTitulo bordaPadrao" name="resenha.autor" value="${resenha.autor}"/>	
								
				<h3>Coment&aacute;rio:</h3>
				<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto:</label>
					<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
					<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
					<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
					<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
					<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
				</p>				
				<textarea id="textoDescricaoResenha" class="areaTexto bordaPadrao" rows="20" name="resenha.descricao">${resenha.autor}</textarea>		
				
				<p>
				<input id="btCadastrarResenha" type="submit" value="cadastrar" class="buttonCadastrar">
				<input id="btCancelarResenha" type="button" value="cancelar" class="button">				
				</p>
			</form>			
			</td>
		</tr>
	</table>

<!-- EDITAR COM CAMPO  DE BUSCA -->	
	<table id="divResenhaBuscarTexto" class="cardViewText">		
		<tr>
			<td valign="middle">
			<div align="right">
			<input id="btFecharEdtResenha" type="button" value="fechar" class="backVermelho button">
			</div>
			<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
			<h2 align="center">Buscar Resenha</h2>			
			
			<form id="formResenhaBuscaTexto" action="<c:url value="resenha/listar"></c:url>" method="get">
			<div align="center">
				<input id="campoBuscaTxtResenha" type="text" name="parametro" class="fundoLupa w500px bordaPadrao" />
				<p>
				<span class="info azulClaro" ><label id="labelBuscaResenha"></label></span>
				</p>
			</div>	
			</form>
			</td>
		</tr>		
	</table>
	
</div> <!-- div center -->

<!-- LISTAR TODOS OS TEXTOS -->
<!-- submit via javascript -->
<form id="formResenhasListarTodas" action="<c:url value="/resenha/listar" />" method="get"></form>
<table id="tabListagemResenhas" class="fullSize">	
	<tr>
	<td>
	<div align="right">		
	<input id="btResenhaFecharTextos" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty resenhas}">
	<h3 align="center">N&atilde;o existem resenhas cadastrados</h3>
	</c:if>
	<c:if test="${not empty resenhas}">
	<h3 align="center">Resenhas Cadastradas.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Autor</th>
				<th class="metadado">T&iacute;tulo</th>
				<th class="metadado">Texto</th>
				<th class="metadado" style="width: 160px;">Postagem</th>
				<th class="metadado" style="width: 80px;">A&ccedil;&atilde;o</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${resenhas}" var="resenha">
				<tr class="zebrado">
					<td class="infoTabela">${resenha.autor}</td>
					<td class="infoTabela metadado">${resenha.titulo}</td>
					<td class="infoTabela">
						<c:set var="origem"	value="${resenha.conteudo}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>...</td>
					<td class="infoTabela" style="width: 160px;"><b>${resenha.dataFormatada}</b></td>
					<td class="infoTabelaData" style="width: 80px;">
						<a href="<c:url value="/resenha/editar/${texto.uuid}" />" >
							<img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar este texto"></a>
						<a href="<c:url value="/resenha/remover/${texto.uuid}" />" onclick="return confirmarExclusao()" >
							<img class="icone" alt="excluir texto" title="excluir texto" src="${imagem}/icone_excluir.png"></a>
						</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
