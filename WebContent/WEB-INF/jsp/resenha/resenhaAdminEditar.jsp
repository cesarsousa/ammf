<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>


<c:if test="${not empty resenhaErroAtualizarCadastro}">
	<div id="msgAtualizarResenha" align="center">
	<div class="msgBorder msgErro ponteiro closeClick">
		${autorEmBranco}${tituloEmBranco}${descricaoEmBranco}${fotoInvalida}
	</div>
	</div>
</c:if>

<%@ include file="/headerLib.jsp" %>

<div class="paddingPadrao">

<div align="center">

<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li class="itemMenuPrincipal">
		<form id="formMenuPrincipal" action="<c:url value="/menu/resenha"/>" method="get">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
	</li>
</ul>
</td>
</tr>
</table>
</div>
 
<div class="separador"></div>

<!-- EDITAR UMA RESENHA -->
<table id="tableEditarResenha" class="cardViewText bordaPadrao">		
	<tr>
		<td class="paddingDuplo">
		<img src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">		
		<h2 align="center">Editar Resenha</h2>
		
		<form id="formNovaResenha" action="<c:url value="/resenha/atualizar"/>" enctype="multipart/form-data" method="post">				
			
			<input type="hidden" name="resenha.uuid" value="${resenha.uuid}"/>
			<input type="hidden" name="dataPostagem" value="<fmt:formatDate value="${resenha.postagem}" type="date" pattern="dd/MM/yyyy HH:mm:ss" />">
			
			<div id="divIdResenha">				
			<h3>C&oacute;digo da Resenha</h3>
			<input id="resenhaId" type="text" class="form-control backCinza" name="resenha.id" value="${resenha.id}" readonly="readonly" />
			</div>
			
			<h3>Categoria da Resenha <span id="btCadastrarCategoriaResenhaEdt" class="azulClaro ponteiro">Cadastrar uma nova categoria</span></h3>						
			<div class="paddingPadrao">						
				<div id="divCadastrarCategoriaResenhaEdt">				
				<div class="col-lg-6 alert alert-info">
				    <div class="input-group">
				      <input id="inputCadastrarCategoriaResenhaEdt" type="text" class="form-control" maxlength="100" placeholder="Digite a categoria">
				      <span class="input-group-btn">
				        <button id="ajaxCadastrarCategoriaResenhaEdt" class="btn btn-success" type="button">Cadastrar Categoria</button>
				      </span>
				    </div>
				 </div>				
				<img id="iconeAguardeCadastrarCategoriaResenhaEdt" src="${imagem}/gif_aguarde.gif" width="100" height="100">				
				</div>			
			</div>			
			<select id="comboBoxCategoriasResenhaEdt" name="resenha.categoria.id" class="form-control" ></select>			
			<input type="hidden" value="${resenha.categoria.id}" id="resenhaCategoriaIdEdicao">
						
			<h3>T&iacute;tulo</h3>
			<input id="resenhaTituloEdt" type="text" class="form-control" name="resenha.titulo" value="${resenha.titulo}" />
				
			<h3>Autor <span class="info azulClaro">autor do filme, livro ou do outro tipo da resenha</span></h3>
			<input id="resenhaAutorEdt" type="text" class="form-control" name="resenha.autor" value="${resenha.autor}"/>
			
			<h3>URL <span class="info azulClaro">trailer do filme ou vídeo da resenha</span></h3>
			<textarea id="resenhaUrlEdt" class="form-control" rows="5" name="resenha.url">${resenha.url}</textarea>
			
			<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de coment&aacute;rio:</label>
				<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
				<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
				<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
				<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
				<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
			</p>
			<h3>Coment&aacute;rio com at&eacute; 10.000 caracteres.</h3>				
			<textarea id="textoDescricaoResenhaEdt" class="form-control" rows="20" name="resenha.descricao">${resenha.descricao}</textarea>		
			
			<h3 class="letraPequena">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterResenhaEdt">10.000</span> caracteres.</h3>	
			
			<table class="paddingPadrao bordaPadrao areaTexto">
				<tr>
					<td class="paddingPadrao">
					<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="fotoLivro">
					</td>
					<td class="paddingPadrao">
					
						<p>
						<label class="labelForm2">
						<input type="checkbox" value="true" name="removerImagemResenhaEdt"/>
						Marque esta op&ccedil;&atilde;o para remover e n&atilde;o adicionar nenhuma imagem
						</label>				
						</p>
						<p>
						<label class="labelForm">ou</label><br/>
						</p>
											
						<table class="msgBorder msgInfo">
						<tr align="center">
						<td>
							<label class="labelForm">Selecione a nova imagem de apresenta&ccedil;&atilde;o da resenha <span class="info azulClaro">(opcional)</span></label>
						</td>			
						<td>
							<div id="divUploadNovaFotoResenha" >
							<input type="hidden" name="resenha.imagem.nome" value="${resenha.imagem.nome}"/>
							<input type="hidden" name="resenha.imagem.id" value="${resenha.imagem.id}"/>
							<input type="hidden" name="resenha.imagem.caminho" value="${resenha.imagem.caminho}"/>
							<input id="inputNovaImagemResenha" type="file" name="novaImagemResenha" />
						</div>
						</td>			
						<td>
							<input id="btRemoverUploadNovaFotoResenha" type="button" value="Selecionar outra foto" class="btn btn-danger ponteiro"/>
						</td>
						</tr>
					</table>				
						
					</td>
				</tr>
			</table>
			
			<label class="labelForm2 paddingPadrao">
				<input type="checkbox" value="true" name="notificarAlteracao"/> Enviar e-mail notificando a alteração.
			</label>
					
			<p class="paddingPadrao">
			<input id="btEditarResenha" type="submit" value="atualizar" onclick="verificarExtensao(this.form, this.form.novaImagemResenha.value)" class="btn btn-success">
			<input id="btCancelarEditarResenha" type="button" value="cancelar" class="btn btn-default">				
			</p>
		</form>			
		</td>
	</tr>
</table>

</div>

</div> <!-- div center -->

<div id="telaAguardeAdmResenhaEditar">
	<div align="center">
		
		<h2>Editar Resenha</h2>    
		<span class="info azulClaro" >Resenha sendo atualizada.</span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
		
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
