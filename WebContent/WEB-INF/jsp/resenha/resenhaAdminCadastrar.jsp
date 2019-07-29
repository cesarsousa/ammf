<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<c:if test="${not empty resenhaErroCadastro}">
	<div id="msgResenhaErroCadastro" align="center">
	<div class="msgBorder msgErro ponteiro closeClick">
		${autorEmBranco}${tituloEmBranco}${descricaoEmBranco}${fotoInvalida}
	</div>
	
	<div class="msgBorder msgAlerta ponteiro closeClick">
		${anexarFoto}
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

<!-- ADICIONAR RESENHA -->
<table id="tableNovaResenha" class="cardViewText bordaPadrao">		
	<tr>
		<td class="paddingDuplo">
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Nova Resenha</h2>
		
		<form id="formNovaResenha" action="<c:url value="/resenha/nova"/>" enctype="multipart/form-data" method="post">			
			
			<table class="msgBorder msgInfo">
			<tr align="center">
			<td>
				<label class="labelForm">Foto para apresenta&ccedil;&atilde;o da resenha <span class="info azulClaro">(opcional)</span></label>
			</td>			
			<td>
				<div id="divUploadFotoResenha" align="left">
					<input id="inputImagemResenha" type="file" name="imagemResenha"/>
				</div>
			</td>			
			<td>
				<input id="btRemoverUploadFotoResenha" type="button" value="remover foto" class="btn btn-danger"/>
			</td>
			</tr>
			</table>
			
			<h3>Categoria da Resenha <span id="btCadastrarCategoriaResenha" class="info azulClaro ponteiro">Cadastrar uma nova categoria?</span></h3>			
			
				<div id="divCadastrarCategoriaResenha">				
				<div class="col-lg-6 alert alert-info">
				    <div class="input-group">
				      <input id="inputCadastrarCategoriaResenha" type="text" class="form-control" maxlength="100" placeholder="Digite a categoria">
				      <span class="input-group-btn">
				        <button id="ajaxCadastrarCategoriaResenha" class="btn btn-success" type="button">Cadastrar Categoria</button>
				      </span>
				    </div>
				 </div>				
				<img id="iconeAguardeCadastrarCategoriaResenha" src="${imagem}/gif_aguarde.gif" width="100" height="100">				
				</div>				
			
			<br>
			<select id="comboBoxCategoriasResenha" name="resenha.categoria.id" class="form-control" ></select>
			
			
			<h3>T&iacute;tulo</h3>
			<input id="resenhaTitulo" type="text" class="form-control corAzul" name="resenha.titulo" value="${resenha.titulo}" />
			
				
			<h3>Autor <span class="info azulClaro">autor do filme, livro ou do outro tipo da resenha</span></h3>
			<input id="resenhaAutor" type="text" class="form-control" name="resenha.autor" value="${resenha.autor}"/>
			
			<h3>URL <span class="info azulClaro">trailer do filme ou vídeo da resenha</span></h3>
			<textarea id="resenhaUrl" class="form-control" rows="5" name="resenha.url">${resenha.url}</textarea>
			
			<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de coment&aacute;rio:</label>
				<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
				<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
				<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
				<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
				<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
			</p>
			<h3>Coment&aacute;rio com at&eacute; 10.000 caracteres.</h3>				
			<textarea id="textoDescricaoResenha" class="form-control" rows="20" name="resenha.descricao">${resenha.descricao}</textarea>		
			<h3 class="letraPequena">O coment&aacute;rio pode conter ate <span id="contadorCaracterResenha">10.000</span> caracteres.</h3>		
			
			<p class="paddingPadrao">
			<input id="btCadastrarResenha" type="submit" value="cadastrar" class="btn btn-success" onclick="verificarExtensao(this.form, this.form.imagemResenha.value)">
			<input id="btCancelarCadastroResenha" type="button" value="cancelar" class="btn btn-default">				
			</p>
		</form>			
		</td>
	</tr>
</table>

</div>

</div> <!-- div center -->

<div id="telaAguardeAdmResenhaCadastrar">
	<div align="center">
		
		<h2>Cadastrar Resenha</h2>    
		<span class="info azulClaro" >Resenha sendo cadastrada.</span>
								
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
