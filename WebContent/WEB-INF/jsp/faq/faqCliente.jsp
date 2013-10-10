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
<b>Verifique erros de preenchimento no envio de sua pergunta no final da p&aacute;gina<br/></b> 
${nomeEmBranco}
${emailEmBranco}
${perguntaEmBranco}
</div>
<br/>
</c:if>


<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="divPgFaqCliente" align="center">

	<h2>FAQ (Perguntas Frequentes)</h2>

	<p>
	<span class="info azulClaro" >Perguntas mais frequentes da área de sa&uacute;de ou sobre qualquer outro assunto. </span>
	</p>
	
	<c:if test="${faqEmailRequest}">	
		<div class="cardViewText">
			<c:choose>
			<c:when test="${faqRemovida}">
				<p class="textoAutorBlog azulClaro fonteGrande centralizar">A pergunta solicitada foi removida do site.</p>
			</c:when>
			<c:when test="${faqPrivada}">
				<p class="textoAutorBlog azulClaro fonteGrande centralizar">A pergunta solicitada n&atilde;o &eacute; p&uacute;blica.</p>
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
	
	<c:if test="${not empty perguntas}">
	<div id="divDepoimentosCadastrados">
		<c:forEach items="${perguntas}" var="faq">
		<div class="cardViewText">
			<p class="textoPostagemDepoimento negrito">postado em ${faq.dataFormatada}</p>
				<p class="textoAutorDepoimento azulClaro">&ldquo; ${faq.pergunta} &ldquo;</p>					
				<p class="textoConteudoDepoimento">${faq.resposta}</p>
				
		</div>
		<br/>
		</c:forEach>
	</div>
	</c:if>
	
	<input id="flagFaqErroCadastro" type="hidden" value="${flagFaqErroCadastro}" />

	<div class="superFooter" align="center">
	<form action="<c:url value="/cliente/faq/pergunta"/>" method="post">		
		<table width="1000px">
			<tr>
				<td width="50%" align="center" style="padding: 20px;">
					<div>
						<span id="btNovaPergunta" class="info azulClaro altura30 xLarge destaqueLetraHover ponteiro" >Fa&ccedil;a voc&ecirc; tamb&eacute;m a sua pergunta aqui.</span>
					</div>
				</td>
			
				<td  width="50%" >					
					<div id="divNovaPergunta" style="border-left: 1px solid #CCCCCC; padding: 10px;">
					
					<h2>Qual A Sua Pergunta ?</h2>
					
					<p>
					<span class="info azulClaro" >Seu nome e seu email n&atilde;o ser&atilde;o revelados no site.</span>
					</p>
					
					<label class="labelForm2">Nome</label>
					<input id="cadastroFaqNome" type="text" name="faq.nome" value="${faq.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					
					<label class="labelForm2">Email</label>
					<input id="cadastroFaqEmail" type="text" name="faq.email" value="${faq.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					
					<label class="labelForm2">Pergunta</label>
					<textarea id="cadastroFaqPergunta" name="faq.pergunta" class="letraCinza largura90 bordaPadrao" rows="5">${faq.pergunta}</textarea>
					
					<h3 align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterFaq">500</span> caracteres em sua pergunta.
					</h3>
					
					<label class="labelForm2"><input type="checkbox" name="faq.publica" />Deixar esta pergunta p&uacute;blica</label>
					<p>
					<span class="info azulClaro" >
					Marcar a pergunta como p&uacute;blica significa que quando respondida, 
					a pergunta será divulgada no site. Seu nome e seu email <b>N&atilde;o</b> ser&atilde;o 
					associados a pergunta. Deste modo quando outras pessoas tiverem uma pergunta parecida 
					poder&atilde;o utiliz&aacute;-la como refer&ecirc;ncia.
					</span>
					</p>
					
					<h3 align="right">
					<input id="btnClienteCadastrarFaq" type="submit" value="Publicar Depoimento"  class="button direita"/>
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
