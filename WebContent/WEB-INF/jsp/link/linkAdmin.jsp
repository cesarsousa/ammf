<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div id="divMensagemLink" align="center">
<c:if test="${not empty linkMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${linkMensagemErro} 
	</div>
</c:if>
<c:if test="${not empty linkMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${linkMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty flagLinkErroCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${linkEmBranco}${urlEmBranco}${descricaoEmBranco}</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div align="center" class="paddingPAdrao">

<h2>LINK</h2>

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
	<li>
		<img id="btAddNovoLink" alt="adicionar link" title="adicionar link" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda" data-toggle="modal" data-target="#modalCadastrarLink">
	</li>	
</ul>
</td>
</tr>
</table>
</div>
 
<div class="separador"></div>

<input id="flagLinkErroCadastro" type="hidden" value="${flagLinkErroCadastro}" />

<!-- ADICIONAR UM NOVO LINK -->
<!-- Modal --> 
<div class="modal fade" id="modalCadastrarLink" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">
				<h2 align="center">Cadastrar Link</h2>
			</div>
			<div class="modal-body">
					<div id="divPgLinkAdm">
					<form id="formNovoLink" action="<c:url value="/link/novo"/>" method="post">
		
						<h5>T&iacute;tulo do Link: <span class="info azulClaro">Nome simb&oacute;lico para os usu&aacute;rio clicarem para acessarem os links.</span></h5>
						<input id="linkTitulo" class="form-control" name="link.titulo" value="${link.titulo}" maxlength="254" required="required"/>
						<br/>			
									
						<h5>URL: <span class="info azulClaro">Copie e cole a URL do link aqui.</span></h5>
						<textarea id="linkUrl" class="form-control" rows="5" name="link.url">${link.url}</textarea>
						<br/>
						<span class="info azulClaro">breve descri&ccedil;&atilde;o. Pode conter at&eacute; <span id="contadorCaracterLinkUrl">500</span> caracteres.</span>		
						
						
						<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de descri&ccedil;&atilde;o:</label>
							<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
							<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
							<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
							<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
							<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
						</p>
						<h5>Coment&aacute;rio: at&eacute; 500 caracteres.</h5>				
						<textarea id="linkAreaDescricao" class="form-control" rows="5" name="link.descricao">${link.descricao}</textarea>		
						<br/>
						<span class="info azulClaro">breve descri&ccedil;&atilde;o. Pode conter at&eacute; <span id="contadorCaracterLink">500</span> caracteres.</span>		
						
						<p class="paddingPadrao">
						<button type="reset" class="btn btn-primary">Limpar</button>
						<button id="btCadastrarLink" type="submit" class="btn btn-success">Cadastrar</button>
						</p>
					</form>
					</div>
					<div id="telaAguardeAdmLinkCadastrar">
						<div align="center">
							
							<h2>LINK</h2>    
							<span class="info azulClaro letraGrande" >Link sendo cadastrado/atualizado.</span>
													
							<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
							
							<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
							<br />
							<br />			
						</div>
					</div>
					
					
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
				</div>
			</div>      
		</div>
	</div>
</div>
	
</div> <!-- div center -->

<!-- LISTAR TODOS OS LINKS -->

<input id="flagListagemLink" type="hidden" value="${flagListagemLink}" />

<table id="tabListagemLinks" class="fullSize">	
	<tr>
	<td>
	<div align="right" class="paddingPadrao">		
	<input id="btFecharListagemLinks" type="button" value="fechar" class="btn btn-danger">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty links}">
	<h3 align="center">N&atilde;o existem links cadastrados</h3>
	</c:if>
	<c:if test="${not empty links}">
	<h3 align="center">Links Cadastrados.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Url</th>
				<th class="metadado">T&iacute;tulo</th>
				<th class="metadado">Descri&ccedil;&atilde;o</th>				
				<th class="metadado" style="width: 160px;">Postagem</th>
				<th class="metadado" style="width: 30px;">Remover</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${links}" var="link">
				<tr class="zebrado">
					<td class="infoTabelaConteudo metadado">${link.url}</td>
					<td class="infoTabelaConteudo">${link.titulo}</td>
					<td class="infoTabelaConteudo">${link.descricao}</td>					
					<td class="infoTabelaConteudo" style="width: 160px;">${link.dataFormatada}</td>
					<td class="infoTabelaData" style="width: 30px;" align="center">
						<a href="<c:url value="/link/remover/${link.uuid}"/>" onclick="return confirmarExclusao()" >
							<img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
