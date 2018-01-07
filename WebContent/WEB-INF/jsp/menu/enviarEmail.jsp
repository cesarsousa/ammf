<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>
<%@ include file="/headerLib.jsp" %>


<div id="divPgEnviarEmail" align="center" class="paddingPadrao">

<h2>Enviar E-mail</h2>

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
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div align="center">
<c:if test="${not empty msgSucessoEmail}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${msgSucessoEmail} 
	</div>
</c:if>

<c:if test="${not empty msgErroEmail}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${msgErroEmail} 
	</div>
</c:if>

<div class="tamanhoEdicaoIndex" align="left">	
	<div class="jumbotron">
	<div class="paddingPadrao">
	
	<form action="<c:url value="/menu/enviar/email"/>" method="post">		
		<table width="100%">
			<tr>
				<td>					
										
					<h2>Enviar uma mensagem</h2>
					
					<div class="paddingPadrao">
					<P>
					<label class="labelForm2"><input type="checkbox" name="todosOsContatos" />  Enviar para todos os contatos do site.</label>
					</P>
					</div>
					
					<div class="paddingPadrao">
					<input type="text" name="mensagem.email" class="form-control" placeholder="Destinatários (separe os emails com virgula)" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<input type="text" name="mensagem.titulo" class="form-control" placeholder="Título" maxlength="100" required="required"/>
					</div>
										
					<div class="paddingPadrao">
					<textarea name="mensagem.conteudo" class="form-control" placeholder="Mensagem" rows="5" required="required"></textarea>
					</div>					
					
					<h3 align="right">
					<input id="btEnviarEmailAdmin" type="submit" value="Enviar Email"  class="btn btn-success direita"/>
					</h3>
					
				</td>			
			</tr>		
		</table>		
	</form>	
	</div>
	</div>	
</div>	




</div> <!-- centralizacao -->

<div id="telaAguardeEnviarEmail">
	<div align="center">		
		<h2>Enviar E-mail</h2>		
		<h3 class="paddingTelaAguarde">Sua solicita&ccedil;&atilde;o est&aacute; sendo enviada. Esta opera&ccedil;&atilde;o pode levar alguns segundos. </h3>
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>		
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
