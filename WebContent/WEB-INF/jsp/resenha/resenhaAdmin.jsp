<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div id="divMensagemResenha">
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
<c:if test="${not empty resenhaErroCadastro or not empty resenhaErroAtualizarCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	Verifique campos obrigat&oacute;rios n&atilde;o preenchidos<br/>
	${autorEmBranco}${tituloEmBranco}${descricaoEmBranco}</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSiteAdmin.jsp" %>

<div id="divPgResenhaAdm">
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
<input id="resenhaErroCadastro" type="hidden" value="${resenhaErroCadastro}" >
<table id="tabNovaResenha" class="cardViewText">		
	<tr>
		<td>
		<div align="right">
		<input id="btFecharAddResenha" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Nova Resenha</h2>
		
		<form id="formNovaResenha" action="<c:url value="/resenha/nova"/>" method="post">			

			<div id="msgCadastrarCategoriaResenha" class="paddindPadrao"></div>
			
			<h3>Tipo da Resenha: <span id="btCadastrarCategoriaResenha" class="info azulClaro ponteiro">Cadastrar uma nova categoria?</span></h3>
			<div>
				<div id="divCadastrarCategoriaResenha">
				<div class="paddingPadrao corPrincipal" class="bordaPadrao">
				<input id="inputCadastrarCategoriaResenha" type="text" class="letraCinza largura30 altura30 bordaPadrao" maxlength="100"/>
				<input id="ajaxCadastrarCategoriaResenha" type="button" class="buttonCadastrar" value="Cadastrar" class="largura50"/>
				<br/>
				<img id="iconeAguardeCadastrarCategoriaResenha" src="${imagem}/gif_aguarde.gif" width="100" height="100">
				</div>
				</div>				
			
			<select id="comboBoxCategoriasResenha" name="resenha.categoria.id" class="letraCinza largura50 altura30 bordaPadrao"></select>
			</div>
			
			<h3>T&iacute;tulo :</h3>
			<input id="resenhaTitulo" type="text" class="areaTitulo bordaPadrao corAzul" name="resenha.titulo" value="${resenha.titulo}" />
			
				
			<h3>Autor :</h3>
			<input id="resenhaAutor" type="text" class="areaTitulo bordaPadrao" name="resenha.autor" value="${resenha.autor}"/>	
			
			<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de coment&aacute;rio:</label>
				<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
				<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
				<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
				<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
				<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
			</p>
			<h3>Coment&aacute;rio: at&eacute; 2250 caracteres.</h3>				
			<textarea id="textoDescricaoResenha" class="areaTexto bordaPadrao" rows="20" name="resenha.descricao">${resenha.descricao}</textarea>		
			<br/>
			<span class="info azulClaro">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterResenha">2250</span> caracteres.</span>		
			<p>
			<input id="btCadastrarResenha" type="submit" value="cadastrar" class="buttonCadastrar">
			<input id="btCancelarResenha" type="button" value="cancelar" class="button">				
			</p>
		</form>			
		</td>
	</tr>
</table>

<!-- EDITAR UMA RESENHA -->
<input id="resenhaEditarCadastro" type="hidden" value="${resenhaEditarCadastro}" >
<table id="tabEditarResenha" class="cardViewText">		
	<tr>
		<td>
		<div align="right">
		<input id="btFecharEditarResenha" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Editar Resenha</h2>
		
		<form id="formNovaResenha" action="<c:url value="/resenha/atualizar"/>" method="post">				
			
			<input type="hidden" name="resenha.uuid" value="${resenha.uuid}"/>
			<input type="hidden" name="dataPostagem" value="<fmt:formatDate value="${resenha.postagem}" type="date" pattern="dd/MM/yyyy HH:mm:ss" />">
			
			<div id="divIdResenha">				
			<h3>C&oacute;digo da Resenha:</h3>
			<input id="resenhaId" type="text" class="areaTitulo bordaPadrao backCinza" name="resenha.id" value="${resenha.id}" readonly="readonly" />
			</div>
			
			<div id="msgCadastrarCategoriaResenhaEdt" class="paddindPadrao"></div>
			
			<br/>
			<label class="labelForm" style="color: #8B0000">Aten&ccedil;&atilde;o! Altere o tipo da resenha para '${resenha.categoria.descricao}' ou selecione um novo tipo.</label>
			<br/>			
			<h3>Tipo da Resenha: <span id="btCadastrarCategoriaResenhaEdt" class="info azulClaro ponteiro">Cadastrar uma nova categoria?</span></h3>
			<div>
				<div id="divCadastrarCategoriaResenhaEdt">
				<div class="paddingPadrao corPrincipal" class="bordaPadrao">
				<input id="inputCadastrarCategoriaResenhaEdt" type="text" class="letraCinza largura30 altura30 bordaPadrao" maxlength="100"/>
				<input id="ajaxCadastrarCategoriaResenhaEdt" type="button" class="buttonCadastrar" value="Cadastrar" class="largura50"/>
				<br/>
				<img id="iconeAguardeCadastrarCategoriaResenhaEdt" src="${imagem}/gif_aguarde.gif" width="100" height="100">
				</div>
				</div>				
			
			<select id="comboBoxCategoriasResenhaEdt" name="resenha.categoria.id" class="letraCinza largura50 altura30 bordaPadrao"></select>
			</div>
			
			<h3>T&iacute;tulo :</h3>
			<input id="resenhaTituloEdt" type="text" class="areaTitulo bordaPadrao corAzul" name="resenha.titulo" value="${resenha.titulo}" />
			
				
			<h3>Autor :</h3>
			<input id="resenhaAutorEdt" type="text" class="areaTitulo bordaPadrao" name="resenha.autor" value="${resenha.autor}"/>	
			
			<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de coment&aacute;rio:</label>
				<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
				<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
				<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
				<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
				<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
			</p>
			<h3>Coment&aacute;rio: at&eacute; 2250 caracteres.</h3>				
			<textarea id="textoDescricaoResenhaEdt" class="areaTexto bordaPadrao" rows="20" name="resenha.descricao">${resenha.descricao}</textarea>		
			<br/>
			<span class="info azulClaro">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterResenhaEdt">2250</span> caracteres.</span>	
			<p>
			<input id="btEditarResenha" type="submit" value="atualizar" class="buttonCadastrar">
			<input id="btCancelarEditarResenha" type="button" value="cancelar" class="button">				
			</p>
		</form>			
		</td>
	</tr>
</table>


<!-- EDITAR COM CAMPO  DE BUSCA -->
<input id="flagBuscarResenhas" type="hidden" value="${flagBuscarResenhas}" />	
<table id="divResenhaBuscarTexto" class="cardViewText">		
	<tr>
		<td valign="middle">
		<div align="right">
		<input id="btFecharEdtResenha" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
		<h2 align="center">Buscar Resenha</h2>			
		
		<form id="formResenhaBuscaTexto" action="<c:url value="/resenha/busca"></c:url>" method="get">
		<div align="center">
			<input id="campoBuscaTxtResenha" type="text" name="parametro" class="fundoLupa w500px bordaPadrao" />
			<p>
			<span class="info azulClaro" ><label id="labelBuscaResenha">${resultBuscarResenhas}</label></span>
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
<input id="flagListarResenhas" type="hidden" value="${flagListarResenhas}" />
<table id="tabListagemResenhas" class="fullSize">	
	<tr>
	<td>
	<div align="right">		
	<input id="btResenhaFecharTextos" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty resenhas}">
	<h3 align="center">N&atilde;o existem resenhas cadastradas</h3>
	</c:if>
	<c:if test="${not empty resenhas}">
	<h3 align="center">Resenhas Cadastradas.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Tipo da Resenha</th>
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
					<td class="infoTabela metadado">${resenha.categoria.descricao}</td>
					<td class="infoTabela">${resenha.autor}</td>
					<td class="infoTabela">${resenha.titulo}</td>
					<td class="infoTabela">
						<c:set var="origem"	value="${resenha.descricao}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>...</td>
					<td class="infoTabela" style="width: 160px;"><b>${resenha.dataFormatada}</b></td>
					<td class="infoTabelaData" style="width: 80px;">
						<a href="<c:url value="/resenha/editar/${resenha.uuid}" />" >
							<img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar este texto"></a>
						<a href="<c:url value="/resenha/remover/${resenha.uuid}" />" onclick="return confirmarExclusao()" >
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
</div>

<div id="telaAguardeAdmResenhaCadastrar">
	<div align="center">
		
		<h2>BLOG</h2>    
		<span class="info azulClaro" >Resenha sendo cadastrada/atualizada.</span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
		
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
