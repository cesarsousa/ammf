<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${empty flagErroDepoimento}">
<input id="flagErroDepoimento" type="hidden" value="false" />
</c:if>
<c:if test="${not empty flagErroDepoimento}">
<input id="flagErroDepoimento" type="hidden" value="true" />
</c:if>

<c:if test="${not empty msgDepoimento}">
<div class="msgBorder msgSucesso closeClick">${msgDepoimento}</div>
<br/>
</c:if>

<c:if test="${not empty msgErroDepoimento}">
<div class="msgBorder msgErro closeClick">
${nomeEmBranco}
${emailEmBranco}
${textoEmBranco}
</div>
<br/>
</c:if>


<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="divPgDepoimentoCliente" align="center">

<h2>Depoimentos</h2>

<p>
<span class="info azulClaro" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>
</p>

<div id="divDepoimentosCadastrados">

	<c:forEach items="${depoimentos}" var="depoimento">
		<div class="cardViewText">		
		<p class="textoConteudoDepoimento">&ldquo; ${depoimento.conteudo} &ldquo;</p>
		<p class="textoAutorDepoimento azulClaro">${depoimento.autor}</p>
		<p class="textoPostagemDepoimento">postado em ${depoimento.dataFormatada}</p>
		</div>
		<br/>
	</c:forEach>

</div>

<div class="separador"></div>

<div class="cardViewText">
<form action="<c:url value="/cliente/novoDepoimento"/>" method="post">
	
	<p align="left">
	<label class="h1 altura30">Novo Depoimento</label>	 
	</p>
	
	<p align="center">
	<span id="btNovoDepoimento" class="info azulClaro altura30 ponteiro xLarge" >Deixe voc&ecirc; tamb&eacute;m o seu depoimento aqui.</span>
	</p>
	
	<table id="divNovoDepoimento"  width="100%">
	<tr>
		<td width="50%" align="right" valign="top"><label class="labelForm2">Nome:</label></td>
		<td width="50%" align="left">
			<c:if test="${not empty nomeEmBranco}">		
			<input id="cadastroDepoimentoNome" type="text" name="texto.autor" value="${novoComentario.autor}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
			</c:if>
			<c:if test="${empty nomeEmBranco}">		
				<input id="cadastroDepoimentoNome" type="text" name="texto.autor" value="${novoComentario.autor}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="50%" align="right" valign="top"><label class="labelForm2">Email:</label></td>
		<td width="50%" align="left">
			<c:if test="${not empty emailEmBranco}">		
				<input id="cadastroDepoimentoEmail" type="text" name="texto.titulo" value="${novoComentario.titulo}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
			</c:if>
			<c:if test="${empty emailEmBranco}">		
				<input id="cadastroDepoimentoEmail" type="text" name="texto.titulo" value="${novoComentario.titulo}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</c:if>
		</td>
	</tr>
	<tr>
		<td width="50%" align="right" valign="top"><label class="labelForm2">Depoimento:</label></td>
		<td width="50%" align="left">
			<c:if test="${not empty textoEmBranco}">		
				<textarea id="cadastroDepoimentoTexto" name="texto.conteudo" class="letraCinza largura100 bordaPadraoErro" rows="5">${novoComentario.conteudo}</textarea>
			</c:if>
			<c:if test="${empty textoEmBranco}">		
				<textarea id="cadastroDepoimentoTexto" name="texto.conteudo" class="letraCinza largura100 bordaPadrao" rows="5">${novoComentario.conteudo}</textarea>
			</c:if>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<h3 align="right">
			Voc&ecirc; pode digitar <span id="contadorCaracterDepoimento">500</span> caracteres em sua mensagem.
			</h3>
		</td>		
	</tr>
	<tr>
		<td colspan="2">
			<h3 align="right">
			<input id="btnClienteCadastrarDepoimento" type="submit" value="Publicar Depoimento"  class="button direita"/>
			</h3>
		</td>		
	</tr>
	</table>
</form>
</div>
</div>

<div id="telaAguardeCadastroDepoimento">
	<div align="center">
		
		<h2>Depoimentos</h2>
		<span class="info azulClaro" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>

		<h3 class="paddingTelaAguarde"><span id="nomeDoCliente"></span> seu depoimento esta sendo processado.</h3>
		
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<br/>

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
