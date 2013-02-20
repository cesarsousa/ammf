<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>


<div id="divPgDepoimentoCliente" align="center">

<h2>Depoimentos</h2>
<span class="info azulClaro" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>


<div id="divDepoimentosCadastrados">

<p>espaço para listar depoimentos</p>

</div>

<!-- barra de icones -->
<table class="tamanhoDefault">
	<tr>
		<td class="tdTableIcone">
		<form id="formMenuCliente" action="<c:url value="/"/>" method="post">
			<img id="btMenuCliente" alt="Menu Principal" title="Menu Principal" src="${imagem}/icone_menu.png" width="50" height="50" class="ponteiro esquerda">
		</form>
		</td>
		
		<td class="tdTableIcone">
			<img id="btNovoDepoimento" alt="Novo Depoimento" title="Novo Depoimento" src="${imagem}/icone_novo_comentario.png" width="50" height="50" class="ponteiro esquerda">
		</td>
	</tr>
	<tr>
	<td class="paddingPadrao" colspan="2"><div class="separador"></div></td>
	</tr>
</table>

<div id="divNovoDepoimento" class="cardViewText">
<form action="<c:url value="/cliente/novoDepoimento"/>" method="post">
	
	<p align="left">
	<label class="h1 altura30">Novo Depoimento</label>	 
	</p>
	
	<p align="left">
	<span class="info azulClaro altura30" >Entre com os dados abaixo para cadastrar um novo depoimento.</span>
	</p>
		
	<c:if test="${not empty nomeEmBranco}">		
		<input id="cadastroDepoimentoNome" type="text" name="texto.autor" value="${novoComentario.autor}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty nomeEmBranco}">		
		<input id="cadastroDepoimentoNome" type="text" name="texto.autor" value="${novoComentario.autor}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>	
	
	<c:if test="${not empty emailEmBranco}">		
		<input id="cadastroDepoimentoEmail" type="text" name="texto.titulo" value="${novoComentario.titulo}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
	</c:if>
	<c:if test="${empty emailEmBranco}">		
		<input id="cadastroDepoimentoEmail" type="text" name="texto.titulo" value="${novoComentario.titulo}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	</c:if>
	
	<br/><br/>
	
	<c:if test="${not empty textoEmBranco}">		
		<textarea id="cadastroDepoimentoTexto" name="texto.conteudo" class="letraCinza largura100 altura30 bordaPadraoErro" rows="5">${novoComentario.conteudo}</textarea>
	</c:if>
	<c:if test="${empty textoEmBranco}">		
		<textarea id="cadastroDepoimentoTexto" name="texto.conteudo" class="letraCinza largura100 bordaPadrao" rows="5">${novoComentario.conteudo}</textarea>
	</c:if>
	
	<br/><br/>
	
	<input id="btnClienteCadastrarDepoimento" type="submit" value="Publicar Depoimento"  class="button direita"/>
	
	<br/><br/>
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

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
