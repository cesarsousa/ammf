<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>


<div id="divMensagemResenha" align="center">
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
<c:if test="${not empty resenhaErroCadastro or not empty resenhaErroAtualizarCadastro}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${autorEmBranco}${tituloEmBranco}${descricaoEmBranco}${fotoInvalida}</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>

<div id="divPgResenhaAdm" class="paddingPadrao">
<div align="center">

<h2>RESENHA</h2>

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
</div>

<form id="formVerComentariosResenha" action="<c:url value="/resenha/comentarios/TODOS" />" method="get"></form>
<form id="formVerComentariosResenhaConfirmados" action="<c:url value="/resenha/comentarios/CONFIRMADO" />" method="get"></form>
<form id="formVerComentariosResenhaPendentes" action="<c:url value="/resenha/comentarios/PENDENTE" />" method="get"></form>
 
<div class="separador"></div>

<!-- Modal resenha pré definida -->
<div class="modal fade" id="modalCadastrarResenhaPreDefinida" role="dialog">
	<div class="modal-dialog">
    	<!-- Modal content-->
    	<div class="modal-content">
        	<div class="modal-header">
          		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">
          		<h4 class="modal-title">Cadastrar Constelação</h4>
        	</div>
        	<div class="modal-body">
			        <form action="<c:url value="/resenha/nova/predefinida"/>" enctype="multipart/form-data" method="post">			
					
					<table class="alert alert-info">
					<tr align="center">
					<td class="paddingPadrao">
						<label class="labelForm">Foto para apresenta&ccedil;&atilde;o da resenha</label>
					</td>
					</tr>
					<tr>			
					<td class="paddingPadrao">
						<div id="divUploadFotoResenha" align="left">
							<input id="inputImagemResenha" type="file" name="imagemResenhaPredefinida" required="required"/>
						</div>
					</td>
					</tr>
					<tr>			
					<td class="paddingPadrao">
						<input id="btRemoverUploadFotoResenha" type="button" value="remover foto" class="btn btn-danger" />
					</td>
					</tr>
					</table>
					
					<h3>Categoria da Resenha</h3>			
					<select id="comboBoxCategoriasResenhaPredefinidas" name="resenha.categoria.id" class="form-control"></select>
					
					
					<h3>T&iacute;tulo</h3>
					<input id="resenhaTitulo" type="text" class="form-control corAzul" name="resenha.titulo" required="required"/>
					
						
					<h3>Autor <span class="info azulClaro">autor do filme, livro ou do outro tipo da resenha</span></h3>
					<input id="resenhaAutor" type="text" class="form-control" name="resenha.autor" required="required"/>	
					
					<!-- <h3>Coment&aacute;rio com at&eacute; 10.000 caracteres.</h3>				
					<textarea id="textoDescricaoResenha" class="form-control" rows="20" name="resenha.descricao" required="required"></textarea>		
					<h3 class="letraPequena">O coment&aacute;rio pode conter ate <span id="contadorCaracterResenhaPreDefinida">10.000</span> caracteres.</h3>	 -->	
					
					<h3>URL <span class="info azulClaro">trailer do filme ou vídeo da resenha</span></h3>
					<input id="resenhaTitulo" type="text" class="form-control corAzul" name="resenha.url" required="required"/>
					
					<p class="paddingPadrao">
					<input id="btCadastrarResenhaPreDefinida" type="submit" value="cadastrar" class="btn btn-success" onclick="verificarExtensao(this.form, this.form.imagemResenha.value)">			
					</p>
					</form>	
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        	</div>
      	</div>      
    </div>
</div>

<!-- EDITAR COM CAMPO  DE BUSCA -->
<input id="flagBuscarResenhas" type="hidden" value="${flagBuscarResenhas}" />	
<table class="cardViewText">		
	<tr>
		<td valign="middle">
		<form id="formResenhaBuscaTexto" action="<c:url value="/resenha/busca"></c:url>" method="get">
		<div align="center">
			<input id="campoBuscaTxtResenha" type="text" name="parametro" class="form-control" placeholder="Buscar pelo título da resenha..." />
			<br>
			<input type="submit" class="btn btn-success" value="Pesquisar">			
			
			<c:if test="${not empty resultBuscarResenhas}">
			<div class="paddingPadrao">
			<div class="alert alert-info" role="alert">
			<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			<b>${resultBuscarResenhas}</b>
			</div>
			</div>
			</c:if>
			
			
			
			
		</div>	
		</form>
		</td>
	</tr>		
</table>

<!-- ADICIONAR UMA NOVA RESENHA -->
<input id="resenhaErroCadastro" type="hidden" value="${resenhaErroCadastro}" >
<table id="tabNovaResenha" class="cardViewText bordaPadrao">		
	<tr>
		<td class="paddingDuplo">
		<div align="right">
		<input id="btFecharAddResenha" type="button" value="fechar" class="btn btn-danger">
		</div>
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
			<input id="btCancelarResenha" type="button" value="cancelar" class="btn btn-default">				
			</p>
		</form>			
		</td>
	</tr>
</table>

<!-- EDITAR UMA RESENHA -->
<input id="resenhaEditarCadastro" type="hidden" value="${resenhaEditarCadastro}" >
<table id="tabEditarResenha" class="cardViewText bordaPadrao">		
	<tr>
		<td class="paddingDuplo">
		<div align="right">
		<input id="btFecharEditarResenha" type="button" value="fechar" class="btn btn-danger">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
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

<!-- LISTAR TODOS OS TEXTOS -->
<!-- submit via javascript -->
<form id="formResenhasListarTodas" action="<c:url value="/resenha/listar" />" method="get"></form>
<input id="flagListarResenhas" type="hidden" value="${flagListarResenhas}" />
<table id="tabListagemResenhas" class="fullSize">	
	<tr>
	<td>
	<div align="right" class="paddingPadrao">		
	<input id="btResenhaFecharTextos" type="button" value="fechar" class="btn btn-danger">
	</div>
	<img src="${imagem}/iconeListarHover.png" class="icone50 esquerda">
	<c:if test="${empty resenhas}">
	<h3 align="center">N&atilde;o existem resenhas cadastradas</h3>
	</c:if>
	<c:if test="${not empty resenhas}">
	<h3 align="center">Resenhas Cadastradas.</h3>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado"></th>
				<th class="metadado">Tipo da Resenha</th>
				<th class="metadado">T&iacute;tulo</th>
				<th class="metadado">Autor</th>
				<th class="metadado">Texto</th>
				<th class="metadado">URL</th>
				<th class="metadado">Predefinida</th>
				<th class="metadado">Postagem</th>
				<th class="metadado">A&ccedil;&atilde;o</th>
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${resenhas}" var="resenha">
				<tr class="zebrado">
					<td class="infoTabela"><img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="icone25"></td>
					<td class="infoTabelaConteudo metadado">${resenha.categoria.descricao}</td>					
					<td class="infoTabelaConteudo metadado">${resenha.titulo}</td>
					<td class="infoTabelaConteudo">${resenha.autor}</td>
					<td class="infoTabelaConteudo">
						<c:set var="origem"	value="${resenha.descricao}"/>
						<c:out value="${fn:substring(origem,0,25)}"/>...</td>
						<td class="infoTabelaConteudo">${resenha.dadoUrl}</td>
						<td class="infoTabelaConteudo">${resenha.dadoPredefinida}</td>
					<td class="infoTabelaConteudo" style="width: 160px;"><b>${resenha.dataFormatada}</b></td>
					<td class="infoTabelaData" style="width: 80px;">
						<a href="<c:url value="/resenha/editar/${resenha.uuid}" />" >
							<img class="ponteiro icone" alt="editar" src="${imagem}/iconeEditarHover.png" title="editar"></a>
						<a href="<c:url value="/resenha/remover/${resenha.uuid}" />" onclick="return confirmarExclusao()" >
							<img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
						<c:if test="${resenha.predefinida}">
						<a href="<c:url value="/resenha/notificar/predefinida/${resenha.uuid}" />" >
							<img class="icone" alt="notificação" title="notificação" src="${imagem}/iconeEmail.png"></a>
						</c:if>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>
</div>


<!-- LISTAR TODOS OS COMENTARIOS -->
<input id="flagComentariosResenha" type="hidden" value="${flagComentariosResenha}">
<table id="tabComentariosResenhaAdmin" class="fullSize">	
	<tr>
	<td>
	<div align="right" class="paddingPadrao">		
	<input id="btFecharComentariosResenha" type="button" value="fechar" class="btn btn-danger">
	</div>
	<img src="${imagem}/${iconeVerComentarios}" class="icone50 esquerda">
	<c:if test="${empty comentariosResenha}">
	<h3 align="center" class="${cssCorTitulo}">N&atilde;o existem coment&aacute;rios a serem visualizados</h3>
	</c:if>
	<c:if test="${not empty comentariosResenha}">
	<h3 align="center" class="${cssCorTitulo}">${tituloVerComentarios}</h3>
	<p class="info azulClaro letraGrande" align="center">Clique na resenha de referência para visualiz&aacute;-la</p>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">Local</th>
				<th class="metadado">Resenha refer&ecirc;ncia</th>
				<th class="metadado">Nome</th>
				<th class="metadado">Email</th>
				<th class="metadado">Conte&uacute;do</th>
				<th class="metadado">Situa&ccedil;&atilde;o</th>
				<th class="metadado" style="width: 160px;">Postagem</th>
				<th class="metadado" style="width: 80px;">A&ccedil;&atilde;o</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${comentariosResenha}" var="comentario">
				<tr class="zebrado">
					<td class="infoTabelaConteudo"><b>${comentario.local}</b></td>
					<td class="infoTabelaConteudo ponteiro" title="visualizar resenha">
						<a id="goResenhaView" class="azulClaro letraMedia" href="#lerResenhaView" onclick="abrirResenhaView('${comentario.resenha.uuid}')">${comentario.resenha.titulo}</a>				
					</td>
					<td class="infoTabelaConteudo">${comentario.nome}</td>
					<td class="infoTabelaConteudo">${comentario.email}</td>
					<td class="infoTabelaConteudo">${comentario.conteudo}
						<%-- <c:set var="origem"	value="${comentario.conteudo}"/>
						<c:out value="${fn:substring(origem,0,50)}"/>... --%>
					</td>
					<td class="infoTabelaConteudo ${comentario.status}">${comentario.status}</td>
					<td class="infoTabelaConteudo" style="width: 160px;">${comentario.dataHora}</td>
					<td class="infoTabelaData" style="width: 80px;">						
						<c:choose>
							<c:when test="${comentario.confirmado}">
								<img class="icone" alt="editar" src="${imagem}/iconeConfirmarDisabled.png" title="confirmado">
							</c:when>
							<c:otherwise>
								<a href="<c:url value="/resenha/comentario/confirmar/${comentario.uuid}/${flagTitulo}" />">
								<img class="ponteiro icone" alt="editar" src="${imagem}/icone_confirmar.png" title="confirmar">
								</a>
							</c:otherwise>
						</c:choose>					
										
						<a href="<c:url value="/resenha/comentario/remover/${comentario.uuid}/${flagTitulo}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</c:if>	
	</td>
	</tr>
</table>

<a name="lerResenhaView"></a>
<div id="divResenhaView" class="fullSize paddingPadrao" align="center">
	<div class="cardViewText">
		<input id="btFecharResenhaView" type="button" value="fechar" class="backVermelho button direita">
		<h2>Visualiza&ccedil;&atilde;o de resenha referente a um coment&aacute;rio</h2>
		<div align="center">
		<img id="imgResenhaView" class="fotoLivro"/>
		</div>
		<p id="resenhaTituloView" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
		<p id="resenhaDataView" class="textoPostagemBlog aEsquerda negrito"></p>			
		<p id="resenhaConteudoView" class="textoConteudoBlog"></p>
	</div>
</div>

</div> <!-- div center -->

<div id="telaAguardeAdmResenhaCadastrar">
	<div align="center">
		
		<h2>RESENHA</h2>    
		<span class="info azulClaro" >Resenha sendo cadastrada/atualizada.</span>
								
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
