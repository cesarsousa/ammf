<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<input type="hidden" id="erroComentarioPrincipal" value="${erroComentarioPrincipal}" />
<form id="formBlogComentado" method="get" action="<c:url value="/site/comentado"></c:url>"></form>


<div align="center" class="fundoPadrao"> 
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center" class="paddingPadrao"><h1><b>Blog</b></h1></div>
</div>

<div style="background-color: #E8E8E8;">

<div align="center">
<c:if test="${not empty erroComentarioPrincipal}">
	<div id="msgErroPadraoBlogCliente" class="msgBorder msgErro ponteiro closeClick">
	${nomeEmBranco}
	${emailEmBranco}
	${conteudoEmBranco}
	</div>
</c:if>

</div>



<div align="center">
<div id="msgErroBlogCliente" class="alert alert-danger tamanhoDefault" align="left"></div>
</div>

<div align="center">
	<c:choose>		
		<c:when test="${empty ultimaPublicacao}">
			<div class="cardViewText">
			<c:choose>
				<c:when test="${emailRequest}">
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">O texto solicitado foi removido deste blog ou est&aacute; sendo atualizado.</p>
				</c:when>
				<c:otherwise>
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">Alcindo Miguel n&atilde;o publicou nenhum texto ainda</p>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
		
		<c:otherwise>
		<div id="ultimaPublicacao">			
			<br>						
			<div class="cardViewText paddingPadrao bordaPadrao">
			<p class="info azulClaro letraGrande centralizar">${ultimaPublicacao.titulo}</p>
			
			
			<p class="textoPostagemBlog aEsquerda negrito">Texto postado em ${ultimaPublicacao.dataFormatada}</p>	
			<hr>
			<c:forEach items="${paragrafos}" var="paragrafo">
				<p class="textoConteudoBlog">${paragrafo.trechoTexto}</p>		
			</c:forEach>			
			</div>
			
			<c:if test="${not empty ultimaPublicacao.comentariosConfirmados}">
				<br/>
				<div class="cardViewText paddingPadrao bordaPadrao" align="left">
				<!-- <span id="imgdivComentariosTextoPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
				<span id="btdivComentariosTextoPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span> -->
				<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>								
				
				<div id="divComentariosTextoPrincipal">
				<c:forEach items="${ultimaPublicacao.comentariosConfirmados}" var="comentarioTextoPrincipal">
					<table>
					<tr>
					<td valign="top"><img src="${imagem}/usuario_cinza.png" class="icone50 ponteiro esquerda"></td>
					<td valign="top">
						<p class="azulClaro negrito" style="font-size: large;">${comentarioTextoPrincipal.nome}</p>
						<p class="textoConteudoBlog">${comentarioTextoPrincipal.conteudo}</p>
						<p class="textoPostagemBlog aEsquerda negrito">... postado em ${comentarioTextoPrincipal.dataHora}</p>
					</td>					
					</tr>
					</table>				
				</c:forEach>
				</div>
				</div>
				
			</c:if>			
			
			<!-- Adicionar um comentario para o texto -->
			<br/>
			<div  align="left" class="cardViewTextNoBackground paddingPadrao bordaPadrao">
				
				<div class="paddingPadrao">
					<!-- <span id="imgNovoComentarioBlogPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
					<span id="btNovoComentarioBlogPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar este texto</span> -->					
					<span class="info azulClaro altura30" style="font-size: x-large;">Comentar este texto</span>
				</div>
				
				<form action="<c:url value="/blog/cliente/comentario/principal"/>" method="post">		
					<table width="1000px">
						<tr>
							<td width="100%" align="left" style="padding: 20px;">								
										
								<div id="divNovoComentarioBlogPrincipal" align="left" class="paddingPadrao">
									<input type="hidden" name="uuidTexto" value="${ultimaPublicacao.uuid}">								
									
									<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
																
									<div class="paddingPadrao">
									<label class="labelForm2">Nome</label>
									<input id="comentarTextoNomePrincipal" type="text" name="comentario.nome" value="${comentario.nome}" class="form-control" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Email <span class="info azulClaro" > Seu e-mail n&atilde;o ser&aacute; divulgado no site :)</span></label>
									<input id="comentarTextoEmailPrincipal" type="text" name="comentario.email" value="${comentario.email}" class="form-control" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Coment&aacute;rio </label>
									<textarea id="comentarTextoConteudoPrincipal" name="comentario.conteudo" class="form-control" rows="9">${comentario.conteudo}</textarea>
									
									<h3 align="right" style="font-size: small;">
									Voc&ecirc; pode digitar <span id="contadorCaracterComentarTextoConteudoPrincipal">1000</span> caracteres em seu coment&aacute;rio.
									</h3>
									</div>
									
									<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
									<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
									<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
												
									<h3 align="right">
									<input id="btnClienteComentarTextoPrincipal" type="submit" value="Enviar comentário"  class="btn btn-success direita"/>
									</h3>					
								</div>
							</td>			
						</tr>		
					</table>		
				</form>
			</div>
		</div>		
		</c:otherwise>
	</c:choose>
</div>

<a name="irTopo"></a>
<div id="divTodosTextos">
<br/>
<div align="center">
<table>
	<thead align="left">
		<tr>
			<th><h1 style="padding-left: 10px; text-align: center;">Encontre o texto que deseja ler na lista abaixo</h1>
		</th>			
		</tr>
	</thead>
	<tbody>
 		<c:forEach items="${textosBlog}" var="texto">
			<tr>				
				<td >
					<div class="cartao tamanhoEdicaoIndex bordaPadrao cardTabela paddingPadrao">
					<h4 align="center" class="metadado"><b>${texto.titulo}</b></h4>					
					
					<table style="float: left; border-right: 1px;">
					<tr>
					<td rowspan="2" style="font-size:30px;" class="paddingPadrao"><i>30</i></td>
					<td style="font-size:10px; vertical-align:bottom;">Dez</td>
					</tr>
					<tr>
					<td style="font-size:10px; vertical-align:top;">2017</td>
					</tr>
					</table>
					
					<div align="center">
					<div style="width: 800px">
					<h5 align="justify">
					<c:set var="origem"	value="${texto.conteudo}"/>
					<c:out value="${fn:substring(origem,0,250)}"/>...
					</h5>
					</div>
					</div>				
										
					<p class="paddingPadrao" align="center">
					<a class="btn btn-primary" href="#lerTexto" onclick="javascript:visualizarTextoBlog('${texto.uuid}');">Ler texto</a>
					</p>
					</div>
					<br/>
				</td>				
			</tr>			
		</c:forEach>		
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4" align="center"><h2>Celebre a Vida !</h2></th>			
		</tr>		
	</tfoot>
</table>
<a name="lerTexto"></a>
<br/>
</div>

<table id="textoModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			<div class="cardViewText paddingPadrao bordaPadrao">
				<input id="uuidTextoBlog" type="hidden" />
				<p id="textoblogTitulo" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
				<p id="textoblogData" class="textoPostagemBlog aEsquerda negrito"></p>
				<hr>			
				<p id="textoblogConteudo" class="textoConteudoBlog"></p>
			</div>
			
			<div id="divVisualizarComentarios">
				<br/>
				<div class="cardViewText paddingPadrao bordaPadrao" align="left">
					<!-- <span id="imgdivComentariosBlog" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
					<span id="btdivComentariosBlog" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span> -->
					<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>								
					
					<div id="divComentariosBlog"></div>				
				</div>					
			</div>
			
			<!-- Adicionar um comentario para o texto -->
			<br/>
			<div class="cardViewTextNoBackground paddingPadrao bordaPadrao" align="left">
				<div>
					<!-- <span id="imgNovoComentarioBlog" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
					<span id="btNovoComentarioBlog" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar este texto</span> -->
					<span class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar este texto</span>
				</div>
					<table width="1000px">
						<tr>
							<td width="100%" align="left" style="padding: 20px;">						
										
								<div id="divNovoComentarioBlog" align="left" class="paddingPadrao">								
									
									<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
																
									<div class="paddingPadrao">
									<label class="labelForm2">Nome</label>
									<input id="comentarTextoNome" type="text" class="form-control" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Email <span class="info azulClaro" > Seu e-mail n&atilde;o ser&aacute; divulgado no site :)</span></label>
									<input id="comentarTextoEmail" type="text" class="form-control" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Coment&aacute;rio </label>
									<textarea id="comentarTextoConteudo" class="form-control" rows="9"></textarea>
									
									<h3 align="right" style="font-size: small;">
									Voc&ecirc; pode digitar <span id="contadorCaracterComentarTextoConteudo">1000</span> caracteres em seu coment&aacute;rio.
									</h3>
									</div>
									
									<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
									<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
									<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
												
									<h3 align="right">
									<input id="btnClienteComentarTexto" type="button" value="Enviar comentário"  class="btn btn-success direita"/>
									</h3>					
								</div>
							</td>			
						</tr>		
					</table>		
				</div>
			
			</td>		
		</tr>		
	</tbody>
	<tfoot>		
		<tr>
			<th colspan="4" class="paddingPadrao">
			<div align="center">
				<a id="goTopo" href="#irTopo" class="btn btn btn-primary btn-lg">ler outros textos</a>
			</div>
			</th>			
		</tr>		
	</tfoot>
</table>
</div> 
<br/>
</div>


<c:if test="${not empty textosBlog}">
<input id="emailRequest" type="hidden" value="${emailRequest}" />
<div align="center">
	<div align="center" class="superFooter">		
		<a id="btVisualizarTodos" href="#irTopo" class="btn btn btn-primary btn-lg">Visualizar textos anteriores</a>
	</div>
</div>
</c:if>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
