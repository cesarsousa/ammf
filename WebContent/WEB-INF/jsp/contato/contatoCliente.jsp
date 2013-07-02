

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty msgContatoCliente}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
	${msgContatoCliente}
	</div>
</c:if>
<c:if test="${not empty msgErroContatoCliente}">
	<div id="mensagemErroContato" class="msgBorder msgErro ponteiro closeClick">
	${tituloErro}
	${nomeEmBranco}
	${emailEmBranco}
	${conteudoEmBranco}
	</div>
</c:if>

<%@ include file="/headerSite.jsp"%>

<div id="divPgContatoCliente" align="center">

<%@ include file="/menuPrincipal.jsp" %>

<h2>Contato</h2>

	<div class="cartaoSemBordaBottom tamanhoEdicaoIndex bordaPadrao">
		<h3>Meu consult&oacute;rio est&aacute; localizado na ${sessaoCliente.contato.endereco}</h3>	
		<c:if test="${sessaoCliente.contato.mostrarMapa}">
			<img id="btAbrirMapa" class="icone50 ponteiro" alt="visualizar no mapa" title="visualizar no mapa" src="${imagem}/iconeAbrirMapa.png">
			<img id="btFecharMapa" class="icone50 ponteiro" alt="fechar mapa" title="fechar mapa" src="${imagem}/iconeFecharMapa.png">
		</c:if>
	
	</div>
	
	<div id="mapaGeoLocalizacao">${sessaoCliente.contato.localizacao}</div>
	
	<div class="cartaoSemBordaTop tamanhoEdicaoIndex bordaPadrao" align="left">
	<h3 align="left">Utilize os canais de contato para falar conosco</h3>
	<p>
	<span class="info azulClaro negrito">Telefone: ${sessaoCliente.contato.telefone}</span>
	</p>
	
	<p>
	<span class="info azulClaro negrito">Email: ${sessaoCliente.contato.email}</span>
	</p>
	
	<p>
	<span class="info azulClaro negrito">Linked In: <a style="color: #000000;" class="destaqueLetraHover" href="${sessaoCliente.contato.linkedin}" target="_blank">${sessaoCliente.contato.linkedin}</a></span>
	</p>
	
	
	<form action="<c:url value="/contato/email"/>" method="post">		
		<table width="100%">
			<tr>
				<td width="50%" align="center" style="padding: 20px;">
					<div>
						<div align="center">
						<img src="${imagem}/fotoEnviarEmail.jpg" width="200" height="200">						
						</div>
						<p class="info azulClaro altura30 xLarge" >Deixe-nos saber a sua opini&atilde;o.</p>
						<p class="info azulClaro altura30 xLarge" >Utilize os campos ao lado e mande o seu email de critica, sugest&atilde;o ou reclama&ccedil;&atilde;o.</p>
					</div>
				</td>
			
				<td  width="50%" >					
					<div style="border-left: 1px solid #CCCCCC; padding: 10px;">
					
					<h2>Enviar uma mensagem</h2>
					
					<label class="labelForm2">Nome:</label>
					<c:if test="${not empty nomeEmBranco}">		
					<input id="contatoEmailNome" type="text" name="mensagem.nome" value="${novaMensagem.nome}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
					</c:if>
					<c:if test="${empty nomeEmBranco}">		
						<input id="contatoEmailNome" type="text" name="mensagem.nome" value="${novaMensagem.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</c:if>
					
					<label class="labelForm2">Email:</label>
					<c:if test="${not empty emailEmBranco}">		
						<input id="contatoEmailEmail" type="text" name="mensagem.email" value="${novaMensagem.email}" class="letraCinza largura100 altura30 bordaPadraoErro" maxlength="100"/>
					</c:if>
					<c:if test="${empty emailEmBranco}">		
						<input id="contatoEmailEmail" type="text" name="mensagem.email" value="${novaMensagem.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</c:if>
					
					<label class="labelForm2">Mensagem:</label>
					<c:if test="${not empty conteudoEmBranco}">		
						<textarea id="contatoEmailMensagem" name="mensagem.conteudo" class="letraCinza largura90 bordaPadraoErro" rows="5">${novaMensagem.conteudo}</textarea>
					</c:if>
					<c:if test="${empty conteudoEmBranco}">		
						<textarea id="contatoEmailMensagem" name="mensagem.conteudo" class="letraCinza largura90 bordaPadrao" rows="5">${novaMensagem.conteudo}</textarea>
					</c:if>
					
					<h3 align="right">
					Voc&ecirc; pode digitar <span id="contadorCaracterContato">500</span> caracteres em sua mensagem.
					</h3>
					
					<h3 align="right">
					<input id="btEnviarEmailContato" type="submit" value="Enviar Email"  class="button direita"/>
					</h3>					
					</div>
				</td>			
			</tr>		
		</table>		
	</form>
	
	
	</div>		
	
<br/>
</div> <!-- centralizacao -->

<div id="telaAguardeContatoCliente">
	<div align="center">		
		<h2>Contato</h2>		
		<h3 class="paddingTelaAguarde">Sua solicita&ccedil;&atilde;o est&aacute; sendo enviada. Esta opera&ccedil;&atilde;o pode levar alguns segundos. </h3>
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
