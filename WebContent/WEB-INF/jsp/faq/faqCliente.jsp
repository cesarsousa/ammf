<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty msgErroFaq}">
<div class="msgBorder msgErro closeClick">${msgErroFaq}</div>
<br/>
</c:if>

<c:if test="${not empty msgSucessoFaq}">
<div class="msgBorder msgSucesso closeClick">${msgSucessoFaq}</div>
<br/>
</c:if>

<c:if test="${not empty flagFaqErroCadastro}">
<div class="msgBorder msgErro closeClick">
${nomeEmBranco}
${emailEmBranco}
${perguntaEmBranco}
</div>
<br/>
</c:if>


<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="divPgFaqCliente" align="center">

	<h2 class="tituloPagina">FAQ (Perguntas Frequentes)</h2>
	
	<c:if test="${faqEmailRequest}">	
		<div class="cardViewText">
			<c:choose>
			<c:when test="${faqRemovida}">
				<p class="textoAutorBlog azulClaro letraGrande centralizar">A pergunta solicitada foi removida do site.</p>
			</c:when>
			<c:when test="${faqPrivada}">
				<p class="textoAutorBlog azulClaro letraGrande centralizar">A pergunta solicitada n&atilde;o &eacute; p&uacute;blica.</p>
			</c:when>			
			<c:otherwise>
				<p class="textoPostagemDepoimento negrito">postado em ${faq.dataFormatada}</p>
				<p class="textoAutorDepoimento azulClaro">&ldquo; ${faq.pergunta} &ldquo;</p>					
				<p class="textoConteudoDepoimento">${faq.resposta}</p>
			</c:otherwise>
			</c:choose>					
		</div>
		
		<br/><br/>	
	</c:if>

	<p>
	<span class="info azulClaro letraGrande" >Perguntas mais frequentes da &aacute;rea de sa&uacute;de ou sobre qualquer outro assunto. </span>
	</p>
	
	<p>
	<span class="info azulClaro letraGrande" >Para ler a resposta basta clicar em cima da pergunta desejada. </span>
	</p>	
	
	<c:if test="${not empty faqs}">
	<div id="divFaqsCadastrados">
		<div class="cardViewText">
		<ul class="listaSimples">
		<c:forEach items="${faqs}" var="faq">
		
			<li>
			<p id="${faq.uuid}" class="fonteMedia azulClaro negrito letraGrande destaqueLetraHover ponteiro" onclick="javascript: visualizarRespostaFaq(this);">&ldquo; ${faq.pergunta} &ldquo;</p>
				<ul id="faqResposta${faq.uuid}" class="listaSimples hideTd">
					<li><p class="textoConteudoDepoimento">${faq.resposta}</p></li>
					<li><p class="textoPostagemDepoimento negrito">Pergunta postada em ${faq.dataFormatada}</p></li>
					<!-- <li><hr class="hrClass" /></li>	 -->			
				</ul>			
			</li>
					
		</c:forEach>
		</ul>
		</div>
	</div>
	<br/><br/>
	</c:if>
	
	<input id="flagFaqErroCadastro" type="hidden" value="${flagFaqErroCadastro}" />

	<div class="superFooter" align="center">
	<form action="<c:url value="/cliente/faq/pergunta"/>" method="post">		
		<table width="1000px">
			<tr>
				<td width="50%" align="center" style="padding: 20px;">
					<div>
						<span id="btNovaPergunta" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Fa&ccedil;a voc&ecirc; tamb&eacute;m a sua pergunta aqui.</span>
					</div>
				</td>
			
				<td  width="50%" >					
					<div id="divNovaPergunta" style="border-left: 1px solid #CCCCCC; padding: 10px;">
					
					<h2>Qual &eacute; a sua pergunta ?</h2>
					
					<p>
					<span class="info azulClaro" >Seu nome e seu email n&atilde;o ser&atilde;o revelados no site.</span>
					</p>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Nome</label>
					<input id="cadastroFaqNome" type="text" name="faq.nome" value="${faq.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Email</label>
					<input id="cadastroFaqEmail" type="text" name="faq.email" value="${faq.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Pergunta</label>
					<textarea id="cadastroFaqPergunta" name="faq.pergunta" class="letraCinza largura90 bordaPadrao" rows="7">${faq.pergunta}</textarea>
					
					<h3 align="right" style="font-size: small;">
					Voc&ecirc; pode digitar <span id="contadorCaracterFaq">500</span> caracteres em sua pergunta.
					</h3>
					</div>
					
					<p class="info azulClaro">Marcar a pergunta como p&uacute;blica significa que quando respondida, a pergunta será divulgada no site.</p>
					<p class="info azulClaro">Seu nome e seu email <b>N&atilde;o</b> ser&atilde;o associados a pergunta.</p>
					<p class="info azulClaro">Deste modo quando outras pessoas tiverem uma pergunta parecida poder&atilde;o utiliz&aacute;-la como refer&ecirc;ncia.</p>
					<p class="info azulClaro">Certifique-se de n&atilde;o utilizar informa&ccedil;&otilde;es pessoas em perguntas p&uacute;blicas.</p>
					
					<label class="labelForm2"><input id="checkPerguntaPublica" type="checkbox" name="faq.publica" />Deixar esta pergunta p&uacute;blica</label>
								
					<h3 align="right">
					<input id="btnClienteCadastrarFaq" type="submit" value="Publicar pergunta"  class="button direita"/>
					</h3>					
					</div>
				</td>			
			</tr>		
		</table>		
	</form>
	</div>
</div>

<div id="telaAguardeCadastroFaq">
	<div align="center">
		
		<h2>FAQ (Perguntas Frequentes)</h2>
		<span class="info azulClaro" >Perguntas mais frequentes da área de sa&uacute;de ou sobre qualquer outro assunto. </span>

		<h3 class="paddingTelaAguarde">Sua pergunta est&aacute; sendo enviada.</h3>
		
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
