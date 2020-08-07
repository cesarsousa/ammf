<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>


<div id="divMensagemVideo" align="center">
<c:if test="${not empty videoMensagemSucesso}">
	<div class="msgBorder msgSucesso ponteiro closeClick">
		${videoMensagemSucesso} 
	</div>
</c:if>
<c:if test="${not empty videoMensagemErro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		${videoMensagemErro} 
	</div>
</c:if>

</div>

<%@ include file="/headerLib.jsp" %>

<div id="divPgVideoAdm" class="paddingPadrao">
<div align="center">

<h2>VÍDEO</h2>

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
		<img alt="adicionar vídeo" title="adicionar vídeo" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda" data-toggle="modal" data-target="#modalCadastrarVideo">
	</li>
</ul>
</td>
</tr>
</table>
</div>


<div class="separador"></div>

<div class="modal fade" id="modalCadastrarVideo" role="dialog">
	<div class="modal-dialog">
    	<div class="modal-content">
        	<div class="modal-header">
          		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">
          		<h4 class="modal-title">Vídeo</h4>
        	</div>
        	<div class="modal-body">
			        <form action="<c:url value="/video/novo"/>" enctype="multipart/form-data" method="post">			
					
					<h3>Título</h3>
					<input id="videoTitulo" type="text" class="form-control" name="video.titulo" required="required"/>
						
					<h3>Descrição</h3>
					<input id="videoDescricao" type="text" class="form-control" name="video.descricao" required="required"/>
						
					<h3>URL</h3>
					<input id="videoUrl" type="text" class="form-control" name="video.url" required="required"/>
					
					<input id="videoAtivo" type="checkbox" name="video.url"> Vídeo ativo.
					
					<p class="paddingPadrao">
					<input id="btConfirmarVideo" type="submit" value="Confirmar" class="btn btn-success">			
					</p>
					</form>	
        	</div>
        	<div class="modal-footer">
          		<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        	</div>
      	</div>      
    </div>
</div>

<table id="tableVideos" class="fullSize">	
	<tr>
	<td>
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">id</th>
				<th class="metadado">Título</th>
				<th class="metadado">Descrição</th>
				<th class="metadado">URL</th>
				<th class="metadado">Ativo</th>
				<th class="metadado">Editar</th>
				<th class="metadado">Excluir</th>
					
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${videos}" var="video">
				<tr class="zebrado">
					<td class="infoTabelaConteudo">${video.id}</td>
					<td class="infoTabelaConteudo">${video.titulo}</td>
					<td class="infoTabelaConteudo">${video.descricao}</td>
					<td class="infoTabelaConteudo">${video.url}</td>
					<td class="infoTabelaConteudo">${video.ativo}</td>
					<td class="infoTabelaData">						
						<img id="editarVideo" class="icone" alt="editar" title="editar" src="${imagem}/iconeEditarHover.png" data-target="${video.id}">
					</td>
					<td class="infoTabelaData">						
						<a href="<c:url value="/resenha/excluir/${video.id}" />" ><img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
	</td>
	</tr>
</table>

</div>

</div> <!-- div center -->

<div id="telaAguardeVideo">
	<div align="center">
		
		<h2>VÍDEO</h2>    
		<span class="info azulClaro" >Vídeo sendo cadastrado/atualizado.</span>
								
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
