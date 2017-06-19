<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div align="center">
<c:if test="${not empty resenhaMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${resenhaMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty resenhaMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${resenhaMensagemErro}
		</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>

<div id="divPgResenhaAdm" class="paddingPadrao">
<div align="center">

<h2>RESENHA PREDEFINIDA</h2>

<div id="pgResenhaPredef">

<%-- <div align="center" class="divMenuOpcao">
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
		<img id="btAddNovaResenha" alt="adicionar resenha" title="adicionar resenha" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btAddNovaResenhaPreDefinida" alt="adicionar resenha pré definida" title="adicionar resenha pré definida" src="${imagem}/iconeResenhaPreDefinida.png" class="icone50 ponteiro esquerda" data-toggle="modal" data-target="#modalCadastrarResenhaPreDefinida">
	</li>
	
	<li>
		<img id="btListarResenhas" alt="listar todas as resenhas" title="listar todas as resenhas" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenha" alt="visualizar comentários" title="visualizar comentários" src="${imagem}/iconeComentarioTodos.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenhaConfirmados" alt="comentários confirmados" title="comentários confirmados" src="${imagem}/iconeComentarioConfirmados.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="btVerComentariosResenhaPendentes" alt="comentários pendentes" title="comentários pendentes" src="${imagem}/iconeComentarioPendentes.png" width="50" height="50" class="ponteiro esquerda">
	</li>	
</ul>
</td>
</tr>
</table>
</div> --%>

<div class="separador"></div>

<!-- EDITAR UMA RESENHA -->

<%-- <input id="resenhaEditarCadastro" type="hidden" value="${resenhaEditarCadastro}" > --%>

<c:if test="${not empty resenha}">
<table class="cardViewText bordaPadrao">		
	<tr>
		<td class="paddingDuplo">
		<img src="${imagem}/iconeResenhaPreDefinida.png" class="icone50 esquerda">		
		
		<h2 align="center">Editar Resenha</h2>
		
		<form action="<c:url value="/resenha/atualizar/predefinida"/>" enctype="multipart/form-data" method="post">				
			
			<table>
			<tr>
			<td width="20%" valign="top" class="paddingPadrao">
				<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="fotoLivro">
			</td>			
			<td>
				<input type="hidden" name="resenha.uuid" value="${resenha.uuid}"/>
						
				<h3><span id="btCadastrarCategoriaResenhaEdt" class="azulClaro">${resenha.categoria.descricao}</span></h3>						
										
				<h3>T&iacute;tulo</h3>
				<input type="text" class="form-control" name="resenha.titulo" value="${resenha.titulo}" required="required" readonly="readonly"/>
					
				<h3>Autor <span class="info azulClaro">autor do filme, livro ou do outro tipo da resenha</span></h3>
				<input type="text" class="form-control" name="resenha.autor" value="${resenha.autor}" required="required" readonly="readonly"/>
							
			</td>
			</tr>
			</table>
			
			<hr>
			
				<table class="tamanhoDefault" >
					<tr align="center">
					<td><span id="sizeSmallRespredef" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumRespredef" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeRespredef" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeRespredef" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeRespredef" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					</tr>				
				</table>
						
			<h5>Coment&aacute;rio com at&eacute; 10.000 caracteres.</h5>				
			<textarea id="textDescricaoResenhaPredef" class="form-control" rows="20" name="resenha.descricao" required="required">${resenha.descricao}</textarea>		
			
			<label class="labelForm2 paddingPadrao">
				<input type="checkbox" value="true" name="notificarAlteracao"/> Enviar e-mail notificando a alteração.
			</label>
					
			<p class="paddingPadrao">
			<input id="btAtualizarResenhaPredef" type="submit" value="atualizar" class="btn btn-success">
			</p>
			
			<hr>			
			<table class="paddingPadrao" align="center">
				<tr >
					<td class="paddingPadrao" >
						${resenha.url}			
					</td>
				</tr>
			</table>
		</form>			
		</td>
	</tr>
</table>
</c:if>
</div> <!-- div center -->
</div>

<div id="telaAguardeResenhaPredef">
	<div align="center">						
		<h3 class="paddingTelaAguarde">O sistema est&aacute; realizando as altera&ccedil;&otilde;es solicitadas.
		<br/>
		Esta opera&ccedil;&atilde;o pode levar segundos minutos porque v&aacute;rios emails podem estar sendo enviados...</h3>			
		
		<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
