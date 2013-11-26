
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

<h2 class="tituloPagina">Contato</h2>

	<div class="cartaoSemBordaBottom tamanhoEdicaoIndex bordaPadrao">
		<table width="100%">
		<tr>
		<td width="110px" align="left" >
		<div align="left">		
			<img src="${imagem}/fotoViewConsultorio.jpg" class="destaqueFoto" width="400">
		</div>
		</td>
		<td align="right">
		<div align="center" class="paddingPadrao">
		<c:if test="${sessaoCliente.contato.mostrarMapa}">
			<h3>Meu consult&oacute;rio est&aacute; localizado no endere&ccedil;o</h3>
			<h3>${sessaoCliente.contato.endereco}</h3>	
			<img id="btAbrirMapa" class="icone50 ponteiro" alt="visualizar no mapa" title="visualizar no mapa" src="${imagem}/iconeAbrirMapa.png">
			<img id="btFecharMapa" class="icone50 ponteiro" alt="fechar mapa" title="fechar mapa" src="${imagem}/iconeFecharMapa.png">
		</c:if>
		</div>
		</td>
		</tr>
		</table>	
	</div>
	
	<div id="mapaGeoLocalizacao" style="width: 1000px; border: 1px solid #cccccc;">${sessaoCliente.contato.localizacao}</div>	
	
	<div class="cartaoSemBordaTop tamanhoEdicaoIndex bordaPadrao" align="left">
	<hr class="hrClass">
	<h3 align="center">Utilize os canais de contato abaixo para falar comigo de segunda a sexta das 08:00 &agrave;s 20:00.</h3>
	<p>
	<span class="info azulClaro negrito">Telefone: ${sessaoCliente.contato.telefone}</span>
	</p>
	
	<p>
	<span class="info azulClaro negrito">Email: ${sessaoCliente.contato.email}</span>
	</p>
	
	<p>
	<span class="info azulClaro negrito">Linked In: <a style="color: #000000;" class="destaqueLetraHover" href="${sessaoCliente.contato.linkedin}" target="_blank">${sessaoCliente.contato.linkedin}</a></span>
	</p>
	
	<div align="center">
	<!-- Posicione esta tag onde você deseja que o widget apareça. -->
	<div class="g-person" data-href="//plus.google.com/100200384204573066006" data-rel="author"></div>
	
	<!-- Posicione esta tag depois da última tag do widget. -->
	<script type="text/javascript">
	  window.___gcfg = {lang: 'pt-BR'};
	
	  (function() {
	    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
	    po.src = 'https://apis.google.com/js/plusone.js';
	    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
	  })();
	</script>
	</div>
	
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
					
					<span class="info azulClaro negrito" >N&atilde;o se preocupe seus dados n&atilde;o ser&aacute; divulgado no site</span>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Nome</label>
					<input id="contatoEmailNome" type="text" name="mensagem.nome" value="${novaMensagem.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Email </label>
					<input id="contatoEmailEmail" type="text" name="mensagem.email" value="${novaMensagem.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm2">Mensagem</label>
					<textarea id="contatoEmailMensagem" name="mensagem.conteudo" class="letraCinza largura90 bordaPadrao" rows="5">${novaMensagem.conteudo}</textarea>
					</div>
					
					<h3 align="right" class="letraPequena">
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
