
<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div id="divMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco or not empty aceiteEmBranco}">
	<div class="msgBorder msgErro">
	${nomeEmBranco}<br/>${emailEmBranco}<br/>${aceiteEmBranco}
	<c:if test="${emailJaCadastrado}">
	<br/>
	<span id="btFormNotifClienteEmailJaCadastrado" class="ponteiro negrito" >Entenda como seu email foi cadastrado neste site</span>
	<div id="divNotifClienteEmailJaCadastrado">
		<form id="formNotifClienteEmailJaCadastrado" action="<c:url value="/pessoa/cadastro/esclarecimento" ></c:url>">
			Uma mensagem ser&aacute; enviada ao seu email contendo todas as informa&ccedil;&otilde;es sobre o cadastramento.
			<br/>
			<input id="campoEmailjaCadastrado" class="letraCinza w300px" type="text" name="email">
			<input class="buttonCadastrar" type="submit" value="Enviar Mensagem" />
		</form>
	</div>
	</c:if>
	</div>
</c:if>
</div>

<%@ include file="/headerSite.jsp"%>

<div id="divPgCadastroCliente" align="center">

<%@ include file="/menuPrincipal.jsp" %>

<h2>Cadastro de Pessoa</h2>



<div class="cardViewText" style="text-align: center;">
<div align="center">
<div  style="width: 50%" >
<form action="<c:url value="/cliente/cadastrar"/>" method="post">	 
	
	<p>
	<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>
	</p>	
	
	<label class="labelForm">Nome:</label>
	<input id="cadastroClienteNome" type="text" name="pessoa.nome" value="${pessoaCadastro.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	<br/><br/>
	
	<label class="labelForm">Email: <span class="info azulClaro" >(n&atilde;o ser&aacute; divulgado no site)</span></label>
	<input id="cadastroClienteEmail" type="text" name="pessoa.email" value="${pessoaCadastro.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
	
	<P>
	<label class="labelForm2"><input type="checkbox" name="aceiteCadastro" />Declaro que li e concordo com os <a class="info azulClaro" href="<c:url value="/termosDeContrato" />" target="_blank">termos de cadastro</a> deste site.</label>
	</P>
		
	<p>
	<input id="btnClienteCadastrar" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
	</p>
	
	<br/>
		
</form>
</div>
</div>
</div>

<br/><br/>

</div> <!-- centralizacao -->

<div id="telaAguardeCadastroCliente">
	<div align="center">
		
		<h2>Cadastro de Pessoa</h2>
		<span class="info azulClaro" >Cadastre-se e fique em contato comigo sempre que houver novidades no site. </span>						
		
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
