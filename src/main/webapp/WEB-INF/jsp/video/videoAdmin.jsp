<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

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
	<div class="modal-dialog modal-lg">
    	<div class="modal-content">
        	<div class="modal-header" align="center">
          		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">
        	</div>
        	<div class="modal-body">
        	
        		<div id="telaAguardeCadastrarVideo" style="display: none;">
					<div align="center">
						
						<span class="info azulClaro" >Vídeo sendo cadastrado.</span>
												
						<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
						
						<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
						<br />
						<br />			
					</div>
				</div>
        	
			    <form action="<c:url value="/video/novo"/>" method="post">
					
					<h3>Título</h3>
					<input type="text" class="form-control" name="video.titulo" required="required"/>
							
					<h3>Descrição</h3>
					<input type="text" class="form-control" name="video.descricao" required="required"/>
							
					<h3>URL (IFrame)</h3>
					<input type="text" class="form-control" name="video.url" required="required"/>
						
					<h3>SRC</h3>
					<input type="text" class="form-control" name="video.src" required="required"/>
						
					<div align="left" style="padding-top: 10px; font-size: large;">
					<input type="checkbox" name="video.ativo"> Vídeo ativo.
					</div>
						
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
				<th class="metadado" style="width: 10px">id</th>
				<th class="metadado">Vídeo</th>
				<th class="metadado">Título</th>
				<th class="metadado">Descrição</th>
				<th class="metadado">Ativo</th>
				<th class="metadado">Ações</th>
					
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${videos}" var="video">
				<tr>
					<td>${video.id}</td>
					<td>
					<iframe width="200" height="100" src="${video.src}" frameborder="0"></iframe>
					</td>
					<td>${video.titulo}</td>
					<td>${video.descricao}</td>
					<td class="${video.ativo}"></td>
					<td>						
						<a href="<c:url value="/video/excluir/${video.id}" />" ><img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
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

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
