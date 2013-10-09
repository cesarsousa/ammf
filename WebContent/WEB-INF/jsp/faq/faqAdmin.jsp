<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty msgFaq}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgFaq}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmFaq" align="center">

<h2>FAQ (Perguntas Frequentes)</h2>

<!-- Barra de Icones
<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li>Menu Principal</li>
	<li>Busca</li>
	<li>Cadastrados</li>
	<li>Confirmados</li>
	<li>Pendentes</li>	
</ul>
</td>
</tr>
</table>
</div> -->

<!-- Barra de Icones -->

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
	<%-- <li>
		<img id="" alt="buscar" title="buscar" src="${imagem}/lupa.png" width="50" height="50" class="ponteiro esquerda">
	</li> --%>
	<li>
		<img id="btFaqNaoRespodidas" alt="Não respondidas" title="Não respondidas" src="${imagem}/iconeInterrogacao.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btFaqRespodidas" alt="Respondidas" title="Respondidas" src="${imagem}/iconeExclamacao.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btFaqTodas" alt="Listar todas" title="Listar todas" src="${imagem}/iconeListarHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<%-- <table id="tabBuscaDepoimento" class="grid fullSize">
<thead>
<tr>	
	<td colspan="5">
	<div align="right">
	<input id="btFecharBuscarDepoimentos" type="button" value="fechar" class="backVermelho button">
	</div>
	<img src="${imagem}/iconeComentarioBuscar.png" class="icone50 esquerda">
	<h2 align="center">Buscar Depoimento</h2>
	</td>	
</tr>
<tr>	
	<td colspan="5" align="center" valign="middle"><p class="info azulClaro">Busca de depoimentos pelo nome ou email</p></td>	
</tr>
<tr>
	<td colspan="5" style="padding: 20px;">
		<div align="left">
		<input id="flagMostrarBusca" type="hidden" value="${flagMostrarBusca}">
		<form id="formBuscaDepoimento" action="<c:url value="/menu/busca/depoimento" />" method="get">
		
		<div align="center">
		<input id="campoBuscaDepoimento" type="text" name="paramConsulta" class="fundoLupa w500px bordaPadrao"/>
		</div>
		
		</form>
		</div>
	</td>
</tr>
<tr>	
	<td colspan="5" align="center" valign="middle" style="padding-bottom: 10px;"><p id="labelResultadoConsulta" class="info azulClaro">${labelResultadoConsulta}</p></td>	
</tr>
</thead>
</table> --%>

<form id="formFaqNaoRespondidas" action="<c:url value="/adm/faq/pendentes" />" method="get"></form>
<form id="formFaqRespondidas" action="<c:url value="/adm/faq/respondidas" />" method="get"></form>
<form id="formFaqTodas" action="<c:url value="/adm/faq/todas" />" method="get"></form>

<c:if test="${not empty requestFaqs}">
<table id="" class="fullSize" >
	<tr>
	<td>
	<div align="right">
		<input id="btFecharDepoimentosSolicitados" type="button" value="fechar" class="backVermelho button">
	</div>
	
	<c:if test="${isFaqNaoRespondidas}">
		<img src="${imagem}/iconeInterrogacao.png" class="icone50 esquerda">
	</c:if>
	<c:if test="${isFaqRespondidas}">
		<img src="${imagem}/iconeExclamacao.png" class="icone50 esquerda">
	</c:if>
	<c:if test="${isFaqTodas}">
		<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	</c:if>
		
	<div align="center">
		<span class="titulo ${backgroundTitulo}">${tituloFaqsSolicitadas}</span>
	</div>
	
	</td>
	</tr>
	<tr>
	<td>
		<c:if test="${not empty faqs}">	
		<table class="display dataTable cardViewText superFooter bordaLateral">
			<thead id="metadadoBuscaDepoimento">
				<tr>
				<th class="metadado">Nome</th>
				<th class="metadado">Email</th>
				<th class="metadado">Pergunta</th>
				<th class="metadado">Resposta</th>
				<th class="metadado">Visibilidade</th>
				<th class="metadado">Postagem</th>
				<th class="metadado">A&ccedil;&atilde;o</th>				
				</tr>
			</thead>
			
			<tbody id="resultBuscaDepoimento">
				<c:forEach items="${faqs}" var="faq">
					<tr class="zebrado">
					<td class="infoTabela">${faq.nome}</td>
					<td class="infoTabela">${faq.email}</td>
					<td class="infoTabelaConteudo">${faq.pergunta}</td>					
					<td class="infoTabela">${faq.resposta}</td>
					<td class="infoTabelaConteudo">${faq.visibilidade}</td>
					<td class="infoTabelaData">${faq.dataFormatada}</td>
					<td class="infoTabelaData" style="width: 80px;">
						<a id="smoothFaq" class="ponteiro" href="#ancoraEditarFaq" onclick="visualizarFaqParaEdicao('${faq.uuid}')"><img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar"></a>
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:if>
		<c:if test="${empty faqs}">	
		<p class="textoAutorBlog azulClaro fonteGrande centralizar">Não existem perguntas para esta solicita&ccedil;&atilde;o.</p>
		</c:if>
	</td>
	</tr>
</table>
</c:if>

<a name="ancoraEditarFaq"></a>
<div class="fullSize">
<table id="tabEditarFaq" width="700px;">		
	<tr>
		<td>
		<div align="right" class="paddingPadrao">
		<input id="btFecharTabEditarFaq" type="button" value="fechar" class="backVermelho button">
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
</div>

</div> <!-- centralizacao -->

<div id="telaAguardeAdmResponderFaq">
	<div align="center">
		
		<h2>FAQ (Perguntas Frequentes)</h2>    
		<span class="info azulClaro" >Resposta de perguntas dos usu&aacute;rios do site. </span>
								
		<h3 class="paddingTelaAguarde">Respondendo a pergunta de <span id="admNomeDoClienteFaq"></span>.</h3>
		
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email, esta opera&ccedil;&atilde;o pode levar alguns segundos.</h3>
		
		<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
