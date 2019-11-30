
<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div align="center" class="fundoPadrao"> 
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center" class="paddingPadrao"><h1><b>De segunda &agrave; sexta das 08:00 &agrave;s 22:00 horas</b></h1></div>
</div>

<div align="center">
<c:if test="${not empty msgContatoCliente}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
	${msgContatoCliente}
	</div>
	<br>
</c:if>
<c:if test="${not empty msgErroContatoCliente}">
	<div id="mensagemErroContato" class="msgBorder msgErro ponteiro closeClick">
	${nomeEmBranco}
	${emailEmBranco}
	${conteudoEmBranco}
	</div>
	<br>
</c:if>
</div>

<div style="background-color: #eeeeee;">

<div id="divPgContatoCliente" align="center" class="fundoPadrao fundoTelaContatoCliente">

	<div>
		<table width="100%">
		<tr>
		<td align="right">
		<div align="center" class="paddingPadrao">
		<div id="mapaGeoLocalizacao" style="width: 1000px; border: 1px solid #cccccc;">
			<iframe
				width="1000" 
				height="350" 
				frameborder="0" 
				scrolling="no" 
				marginheight="0" 
				marginwidth="0" 
				src="${sessaoCliente.contato.localizacao}"></iframe>
		 </div>
		</div>
		</td>
		</tr>
		</table>	
	</div>
		
	<div class="cartaoSemBordaTop tamanhoEdicaoIndex" align="left">
	
	<div class="jumbotron">
	<div class="paddingPadrao">
	<h3 align="center">Utilize os canais de contato abaixo para falar comigo.</h3>
	<p>
	<span class="info azulClaro negrito"><img src="${imagem}/iconeTelefone.png" class="img-circle" width="50px" height="50px"></span> ${sessaoCliente.contato.telefone}
	</p>
	
	<p>
	<span class="info azulClaro negrito"><img src="${imagem}/iconeEmail.png" class="img-circle" width="50px" height="50px"></span> ${sessaoCliente.contato.email}
	</p>
	
	<p>
	<span class="info azulClaro negrito"><img src="${imagem}/iconeSkipe.png" class="img-circle" width="50px" height="50px"></span> alcindomiguel
	</p>
	
	<p>
	<span class="info azulClaro negrito"><img src="${imagem}/iconeLinkedin.png" class="img-circle" width="50px" height="50px"><a style="color: #000000;" class="destaqueLetraHover" href="${sessaoCliente.contato.linkedin}" target="_blank"> ${sessaoCliente.contato.linkedin}</a></span>
	</p>
	
	<p>
	<span class="info azulClaro negrito"><img src="${imagem}/iconeDoctoralia.png" class="img-circle" width="50px" height="50px"><a style="color: #000000;" class="destaqueLetraHover" href="http://www.doctoralia.com.br/medico/martins+filho+alcindo+miguel-12333340" target="_blank"> http://www.doctoralia.com.br/medico/martins+filho+alcindo+miguel-12333340</a></span>
	</p>
	
	</div>
	</div>
		
	<div class="jumbotron">
	<div class="paddingPadrao">
	
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
					
					<c:if test="${not empty msgErroContatoCliente}">
						<div id="mensagemErroContato" class="alert alert-danger ponteiro closeClick">
						${nomeEmBranco}
						${emailEmBranco}
						${conteudoEmBranco}
						</div>
					</c:if>
					
					
					<h2>Enviar uma mensagem</h2>
					
					<span class="info azulClaro negrito" >N&atilde;o se preocupe seus dados n&atilde;o ser&aacute; divulgado no site :)</span>
					
					<div class="paddingPadrao">
					<!-- <label class="labelForm2">Nome</label> -->
					<input id="contatoEmailNome" type="text" name="mensagem.nome" value="${novaMensagem.nome}" class="form-control" placeholder="Nome" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<!-- <label class="labelForm2">Email </label> -->
					<input id="contatoEmailEmail" type="text" name="mensagem.email" value="${novaMensagem.email}" class="form-control" placeholder="E-mail" maxlength="100"/>
					</div>
					
					<h4 align="left" class="letraPequena">
					Voc&ecirc; pode digitar <span id="contadorCaracterContato">500</span> caracteres em sua mensagem.
					</h4>
					
					<div class="paddingPadrao">
					<!-- <label class="labelForm2">Mensagem</label> -->
					<textarea id="contatoEmailMensagem" name="mensagem.conteudo" class="form-control" placeholder="Mensagem" rows="5">${novaMensagem.conteudo}</textarea>
					</div>					
					
					<h3 align="right">
					<input id="btEnviarEmailContato" type="submit" value="Enviar Email"  class="btn btn-success direita"/>
					</h3>
					
					</div>
				</td>			
			</tr>		
		</table>		
	</form>	
	</div>
	</div>
	
	
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

</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
