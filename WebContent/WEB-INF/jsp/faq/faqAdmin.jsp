<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty msgErroFaq}">
	<div class="msgBorder msgErro ponteiro closeClick">${msgErroFaq}</div>
</c:if>
<c:if test="${not empty msgFaq}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgFaq}</div>
</c:if>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmFaq" align="center">

<h2>FAQ (Perguntas Frequentes)</h2>

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

<form id="formFaqNaoRespondidas" action="<c:url value="/adm/faq/pendentes" />" method="get"></form>
<form id="formFaqRespondidas" action="<c:url value="/adm/faq/respondidas" />" method="get"></form>
<form id="formFaqTodas" action="<c:url value="/adm/faq/todas" />" method="get"></form>

<c:if test="${not empty requestFaqs}">
<table id="tabFaqsSolicitadas" class="fullSize" >
	<tr>
	<td>
	<div align="right">
		<input id="btFecharFaqsSolicitadas" type="button" value="fechar" class="backVermelho button">
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
			<thead>
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
			
			<tbody>
				<c:forEach items="${faqs}" var="faq">
					<tr class="zebrado">
					<td class="infoTabela">${faq.nome}</td>
					<td class="infoTabela">${faq.email}</td>
					<td class="infoTabelaConteudo">${faq.pergunta}</td>					
					<td class="infoTabela">${faq.resposta}</td>
					<td class="infoTabelaConteudo ${faq.visibilidade}">${faq.visibilidade}</td>
					<td class="infoTabelaData">${faq.dataFormatada}</td>
					<td class="infoTabelaData">
						<c:choose>
							<c:when test="${not faq.respondida}">
								<a id="smoothFaq" class="ponteiro" href="#ancoraEditarFaq" onclick="visualizarFaqParaEdicao('${faq.uuid}')"><img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar"></a>
							</c:when>
							<c:otherwise>
								<img class="icone" alt="esta pergunta ja foi respondida" src="${imagem}/iconeEditar.png" title="esta pergunta ja foi respondida">
							</c:otherwise>
						</c:choose>
								<a href="<c:url value="/adm/faq/excluir/${faq.uuid}/${flagRedirect}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
						
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

<div id="tabEditarFaq" class="fullSize">
<table width="700px;">		
	<tr>
		<td>
		<a name="ancoraEditarFaq"></a>
		<div align="right" class="paddingPadrao">
		<input id="btFecharTabEditarFaq" type="button" value="fechar" class="backVermelho button">
		</div>
		<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">		
		<h2 align="center">FAQ (Perguntas Frequentes) - Resposta</h2>
		
			<div id="msgResultadoRespostaFaq"></div>
		
			<input id="faqUuid" type="hidden"/>			

			<h3 id="faqAutor" ></h3>
			<h4 id="faqPostagem"></h4>
			<h4 >Visibilidade da pergunta: <span id="faqVisibilidade"></span></h4>
			
			<h3>Pergunta.</h3>	
			<p id="faqPergunta" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
					
			<div id="faqRespondida"></div>
			
			<div id="telaAguardeAdmResponderFaq">
				<div align="center">							
					<h3 class="paddingTelaAguarde">Respondendo a pergunta de <span id="admNomeDoClienteFaq"></span>.</h3>
					<span class="info azulClaro">Enviando notifica&ccedil;&atilde;o por email, esta opera&ccedil;&atilde;o pode levar alguns segundos.</span>
					<div class="paddingTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
					<br />
					<br />			
				</div>
			</div>
			
			<div id="divCamposParaResposta">
			
			<div class="msgBorder msgAlerta ponteiro closeClick">Aten&ccedil;&atilde;o! Ao responder uma pergunta com visibilidade p&uacute;blica <b>NÃO</b> mencione o nome da pessoa, evitando assim a exposi&ccedil;&atilde;o da mesma no FAQ do site.</div>
			
			
			<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto da resposta:</label>
				<span id="sizeSmallFaq" style="font-size: small;" class="ponteiro" >A</span>
				<span id="sizeMediumFaq" style="font-size: medium;" class="ponteiro" >A</span>
				<span id="sizeLargeFaq" style="font-size: large;" class="ponteiro" >A</span>
				<span id="sizeXLargeFaq" style="font-size: x-large;" class="ponteiro" >A</span>
				<span id="sizeXxLargeFaq" style="font-size: xx-large;" class="ponteiro" >A</span>
			</p>
			
			
			<h3>Digite a resposta para a pergunta.</h3>				
			<textarea id="areaRespostaFaq" class="areaTexto bordaPadrao" rows="10"></textarea>		
			<br/>
			<span class="info azulClaro">Sua resposta pode conter até <span id="contadorCaracterFaq">2000</span> caracteres.</span>		
			<p>
			<input id="btResponderFaq" type="submit" value="Enviar Resposta" class="buttonCadastrar">
			<input id="btRemoverFaq" type="button" value="Excluir Pergunta" class="backVermelho button">
			<input id="btCancelarFaq" type="button" value="Cancelar" class="button direita">
			</p>
			</div>
			<br/><br/>
		</td>
	</tr>
</table>
</div>

</div> <!-- centralizacao -->

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
