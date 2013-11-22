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
${tituloErro}
${nomeEmBranco}
${emailEmBranco}
${textoEmBranco}
</div>
<br/>
</c:if>


<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="divPgDepoimentoCliente" align="center">

	<h2 class="tituloPagina">Depoimentos</h2>

	<p>
	<span class="info azulClaro letraGrande" >Deixe sua opini&atilde;o sobre o site ou sobre qualquer outro assunto. </span>
	</p>

	<div id="divDepoimentosCadastrados">
		<c:forEach items="${depoimentos}" var="depoimento">
		<div class="cardViewText">					
			<p class="textoConteudoDepoimento">&ldquo; ${depoimento.conteudo} &ldquo;</p>
			<p class="textoAutorDepoimento azulClaro">${depoimento.autor}</p>
			<p class="textoPostagemDepoimento negrito">postado em ${depoimento.dataFormatada}</p>	
		</div>
		<br/>
		</c:forEach>
	</div>

	<div class="superFooter" align="center">
	<form action="<c:url value="/cliente/novoDepoimento"/>" method="post">		
		<table width="1000px">
			<tr>
				<td width="50%" align="center" style="padding: 20px;">
					<div>
						<span id="btNovoDepoimento" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Deixe voc&ecirc; tamb&eacute;m o seu depoimento aqui.</span>
					</div>
				</td>
			
				<td  width="50%" >					
					<div id="divNovoDepoimento" style="border-left: 1px solid #CCCCCC; padding: 10px;">
					
					<h2>Novo Depoimento</h2>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Nome</label>
					<input id="cadastroDepoimentoNome" type="text" name="depoimento.autor" value="${novoComentario.autor}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Email <span class="info azulClaro" >(n&atilde;o ser&aacute; divulgado no site)</span></label>
					<input id="cadastroDepoimentoEmail" type="text" name="depoimento.email" value="${novoComentario.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Depoimento</label>
					<textarea id="cadastroDepoimentoTexto" name="depoimento.conteudo" class="letraCinza largura90 bordaPadrao" rows="5">${novoComentario.conteudo}</textarea>
					</div>
					
					<h3 align="right" style="font-size: small;">
					Voc&ecirc; pode digitar <span id="contadorCaracterDepoimento">500</span> caracteres em sua mensagem.
					</h3>
					
					<h3 align="right">
					<input id="btnClienteCadastrarDepoimento" type="submit" value="Publicar Depoimento"  class="button direita"/>
					</h3>					
					</div>
				</td>			
			</tr>		
		</table>		
	</form>
	</div>
</div>

<div id="telaAguardeCadastroDepoimento">
	<div align="center">
		
		<h2 class="tituloPagina">Depoimentos</h2>
		<span class="info azulClaro letraGrande" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>

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
