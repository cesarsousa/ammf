<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div id="msgErroResenhaCliente" class="msgBorder msgErro closeClick ponteiro"></div>

<div class="jumbotron">
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center"><h1>Resenha</h1></div>
</div>

<div align="center">
<c:if test="${not empty erroComentarioPrincipal}">
<div class="msgBorder msgErro closeClick ponteiro">
${nomeEmBranco}
${emailEmBranco}
${conteudoEmBranco}
</div>
<br/>
</c:if>
<c:if test="${not empty erroComentarioRequest}">
<div class="msgBorder msgErro closeClick ponteiro">
${nomeEmBranco}
${emailEmBranco}
${conteudoEmBranco}
</div>
<br/>
</c:if>
</div>

<input type="hidden" id="erroComentarioPrincipal" value="${erroComentarioPrincipal}" />
<form id="formResenhaComentada" method="get" action="<c:url value="/site/comentado"></c:url>"></form>

<div align="center">

<c:if test="${not empty ultimaPublicacao}">
	<div align="center">
	
	<div class="paddingPadrao tamanhoDefault" style="text-align: left;">
	
	<p>
	<span class="info azulClaro" >Selecione as resenhas por categorias.</span>
	</p>
	
	<div>
		<c:forEach items="${categoriasResenha}" var="categoria">
		<a href="<c:url value="/resenha/listar/categoria/${categoria.id}"></c:url>">
		<span class="categoria destaqueLetraHover ponteiro">${categoria.descricao}</span>
		</a>
		</c:forEach>
	</div>
	</div>
	
	</div>
</c:if>

</div>

<c:if test="${not empty resenha}">
	<br/>
	<div align="center">
	<div class="cardViewText paddingPadrao" align="left">		
		<table>
		<tr>
		<td valign="top">					
		<a href="<c:url value="/resenha/visualizador/${resenha.uuid}" />" rel="prettyPhoto[resenha1]" title="${resenha.titulo}">
			<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="fotoLivro">
		</a>				
		</td>
		
		<td class="paddingPadrao">
		<h2>${resenha.categoria.descricao}</h2>
		<h3>${resenha.titulo}</h3>
		
			<div style="width: 80%">
			<c:forEach items="${paragrafosResenha}" var="paragrafoResenha">
				<p class="textoConteudoDepoimento">${paragrafoResenha.trechoTexto}</p>
			</c:forEach>
			</div>	
		
		<%-- <p class="textoConteudoDepoimento">&ldquo; ${resenha.descricao} &ldquo;</p> --%>
				
		<p class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
		<p class="textoPostagemDepoimento negrito">... resenha postada em ${resenha.dataFormatada}</p>		
		</td>
		</tr>
		</table>	
	</div>
	
	<c:if test="${not empty resenha.comentariosConfirmados}">
		<br/>			
		<div class="cardViewText paddingPadrao">
		<!-- <span class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
		<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span> -->
		<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>								
		
		<div id="divComentariosResenhaEmail">
		<c:forEach items="${resenha.comentariosConfirmados}" var="comentarioConfirmado">
			<table>
			<tr>
			<td valign="top"><img src="${imagem}/usuario_cinza.png" class="icone50 ponteiro esquerda"></td>
			<td valign="top">
				<p class="azulClaro negrito" style="font-size: large;">${comentarioConfirmado.nome}</p>
				<p class="textoConteudoBlog">${comentarioConfirmado.conteudo}</p>
				<p class="textoPostagemBlog aEsquerda negrito">... postado em ${comentarioConfirmado.dataHora}</p>
			</td>					
			</tr>
			</table>				
		</c:forEach>
		</div>						
		</div>						
	</c:if>
	
	<!-- Adicionar um comentario para o texto -->
	<br/>
	<div  align="left" class="cardViewTextNoBackground paddingPadrao">
		
		<div>
			<!-- <span class="info azulClaro altura30" style="font-size: x-large;">+ </span>
			<span class="info azulClaro altura30" style="font-size: x-large;">Comentar esta resenha</span> -->
			<span class="info azulClaro altura30" style="font-size: x-large;">Comentar esta resenha</span>
		</div>
		
		<table width="1000px">
			<tr>
				<td width="100%" align="left" style="padding: 20px;">								
							
					<div align="left">
						<form action="<c:url value="/resenha/Cliente/comentar/viaemail"></c:url>" method="post"> 
						<input type="hidden" name="uuidResenhaEmail" value="${resenha.uuid}">								
						
						<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
													
						<div class="paddingPadrao">
						<label class="labelForm2">Nome</label>
						<input id="comentarResenhaEmailNome" type="text" name="comentario.nome" value="${comentario.nome}" class="form-control" maxlength="254"/>
						</div>
						
						<div class="paddingPadrao">
						<label class="labelForm2">Email <span class="info azulClaro" > Seu e-mail n&atilde;o ser&aacute; divulgado no site :)</span></label>
						<input id="comentarResenhaEmailEmail" type="text" name="comentario.email" value="${comentario.email}" class="form-control" maxlength="254"/>
						</div>
						
						<div class="paddingPadrao">
						<label class="labelForm2">Coment&aacute;rio </label>
						<textarea id="comentarResenhaEmailConteudo" name="comentario.conteudo" class="form-control" rows="9">${comentario.conteudo}</textarea>
						
						<h3 align="right" style="font-size: small;">
						Voc&ecirc; pode digitar <span id="contadorCaracterComentarResenhaEmailConteudo">1000</span> caracteres em seu coment&aacute;rio.
						</h3>
						</div>
						
						<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
						<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
						<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
									
						<h3 align="right">
						<input id="btCadastrarComentarioResenhaEmail" type="submit" value="Enviar comentário"  class="btn btn-success direita"/>
						</h3>
						</form>					
					</div>
				</td>			
			</tr>		
		</table>		
	</div>	
	
	</div>
</c:if>

<c:if test="${empty resenha}">
<div id="divResenhasTop3" align="center">
	<c:choose>
		<c:when test="${not empty ultimaPublicacao}">
		
		
				
				<div class="cardViewText">
					<table>
					<tr>
					<td class="paddingPadrao" valign="top">					
					<a href="<c:url value="/resenha/visualizador/${ultimaPublicacao.uuid}" />" rel="prettyPhoto[resenha2]" title="${ultimaPublicacao.titulo}">
						<img src="<c:url value="/resenha/visualizador/${ultimaPublicacao.uuid}" />" class="fotoLivro">
					</a>				
					</td>
					
					<td class="paddingPadrao">
					<h2>${ultimaPublicacao.categoria.descricao}</h2>
					<h3>${ultimaPublicacao.titulo}</h3>					
					
					<div style="width: 80%">
					<c:forEach items="${paragrafos}" var="paragrafo">
						<p class="textoConteudoDepoimento">${paragrafo.trechoTexto}</p>
					</c:forEach>
					</div>
					
					<p class="textoAutorDepoimento azulClaro">${ultimaPublicacao.autor}</p>
					<p class="textoPostagemDepoimento negrito">... resenha postada em ${ultimaPublicacao.dataFormatada}</p>
						
					</td>
					</tr>
					</table>									
				</div>
				
				<c:if test="${not empty ultimaPublicacao.comentariosConfirmados}">
						<br/>			
						<div class="cardViewText">
						<!-- <span id="sinalComentariosResenhaPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
						<span id="btViewComentariosResenhaPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span> -->
						<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>								
						
						<div id="divComentariosResenhaPrincipal">
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
					<div  align="left" class="cardViewTextNoBackground">
						
						<div>
							<!-- <span id="sinalNovoComentarioResenhaPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
							<span id="btNovoComentarioResenhaPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar esta resenha</span> -->
							<span class="info azulClaro altura30" style="font-size: x-large;">Comentar esta resenha</span>
						</div>
						
						<form action="<c:url value="/resenha/cliente/comentario/principal"/>" method="post">		
							<table width="1000px">
								<tr>
									<td width="100%" align="left" style="padding: 20px;">								
												
										<div id="divNovoComentarioResenhaPrincipal" align="left" class="paddingPadrao">
											<input type="hidden" name="uuidResenha" value="${ultimaPublicacao.uuid}">								
											
											<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
																		
											<div class="paddingPadrao">
											<label class="labelForm2">Nome</label>
											<input id="comentarResenhaNomePrincipal" type="text" name="comentario.nome" value="${comentario.nome}" class="form-control" maxlength="254"/>
											</div>
											
											<div class="paddingPadrao">
											<label class="labelForm2">Email <span class="info azulClaro" > Seu e-mail n&atilde;o ser&aacute; divulgado no site :)</span></label>
											<input id="comentarResenhaEmailPrincipal" type="text" name="comentario.email" value="${comentario.email}" class="form-control" maxlength="254"/>
											</div>
											
											<div class="paddingPadrao">
											<label class="labelForm2">Coment&aacute;rio </label>
											<textarea id="comentarResenhaConteudoPrincipal" name="comentario.conteudo" class="form-control" rows="9">${comentario.conteudo}</textarea>
											
											<h3 align="right" style="font-size: small;">
											Voc&ecirc; pode digitar <span id="contadorCaracterComentarResenhaConteudoPrincipal">1000</span> caracteres em seu coment&aacute;rio.
											</h3>
											</div>
											
											<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
											<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
											<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
														
											<h3 align="right">
											<input type="submit" value="Enviar comentário"  class="btn btn-success direita"/>
											</h3>					
										</div>
									</td>			
								</tr>		
							</table>		
						</form>
					</div>
				
				
				<br/>
		</c:when>
		<c:otherwise>
			<div class="cardViewText">
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">Alcindo Miguel n&atilde;o publicou nenhuma resenha ainda.</p>
			</div>
		</c:otherwise>
	</c:choose>
</div>
</c:if>

<input id="flagResenhasRequest" type="hidden" value="${flagResenhasRequest}"/>

<div id="divTodasAsResenhas">

<c:choose>
	<c:when test="${not empty resenhasRequest}">
		<h3 style="padding-left: 10px; text-align: center;">Encontre a resenha que deseja ler na lista abaixo.<br/>Em seguida basta <span class="azulClaro">clicar no t&iacute;tulo para ler</span> a resenha na íntegra.</h3>
		<div align="center">
		<table style="width: 90%">
			<thead align="left">
				<tr>
					<th class="metadado"></th>
					<th class="metadado">T&iacute;tulo</th>
					<th class="metadado">Tipo da resenha</th>			
					<th class="metadado">Coment&aacute;rio</th>
					<th class="metadado">Postagem</th>			
				</tr>
				
			</thead>
			<tbody>
				<c:forEach items="${resenhasRequest}" var="resenha">
					<tr class="zebrado">						
						<td><img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="icone50"></td>
						<td class="infoTabela metadado ponteiro" title="visualizar este texto">
							<a class="infoTabela metadado" href="#lerTexto" onclick="javascript:visualizarTextoResenha('${resenha.uuid}');"><b>${resenha.titulo}</b></a></td>
						<td class="infoTabela" title="clique no titulo para ler texto completo">${resenha.categoria.descricao}</td>
						<td class="infoTabela" title="clique no titulo para ler texto completo">					
							<c:set var="origemResenha"	value="${resenha.descricao}"/>
							<c:out value="${fn:substring(origemResenha,0,100)}"/>...</td>
						<td class="infoTabela" title="clique no titulo para ler texto completo"><b>${resenha.dataFormatadaSimples}</b></td>
					</tr>			
		 		</c:forEach>		
			</tbody>
			<tfoot>
				<tr>
					<th colspan="4" align="center"><h2>Celebre a Vida !</h2></th>			
				</tr>		
			</tfoot>
		</table>
		<br/>
		</div>	
	</c:when>
	<c:otherwise>
		<p align="center" class="info azulClaro letraGrande">N&atilde;o existem resenhas publicadas para a sua solicita&ccedil;&atilde;o</p>
	</c:otherwise>
</c:choose>

<a name="irTopo"></a>
<a name="lerTexto"></a>
<table id="resenhaModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			
			<div class="cardViewText">
					<table>
					<tr>
					<td class="paddingPadrao" valign="top">
					<a id="linkPrettyPhotoResenha" rel="prettyPhoto[resenha3]" title="${resenha.titulo}">
						<img id="imagemResenhaModoLeitura" class="fotoLivro" />
					</a>					
					</td>
					
					<td class="paddingPadrao">
					<input id="uuidResenhaView" type="hidden" />
					<h2><span id="resenhaCategoria"></span></h2>
					<h3><span id="resenhaTitulo"></span></h3>					
					<p id="resenhaConteudo" class="textoConteudoDepoimento"></p>
					<p id="resenhaAutor" class="textoAutorDepoimento azulClaro"></p>
					<p id="resenhaData" class="textoPostagemDepoimento negrito"></p>					
					</td>
					</tr>
					</table>									
				</div>
				
				<div id="divVisualizarComentariosResenha">
					<br/>
					<div class="cardViewText">
						<!-- <span id="sinalComentariosResenha" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
						<span id="btViewComentariosResenha" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span> -->
						<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>					
						<div id="divComentariosResenha"></div>				
					</div>
				</div>
					
				<!-- Adicionar um comentario para o texto -->
				<br/>
				<div  align="left" class="cardViewTextNoBackground">
					
					<div>
						<!-- <span id="sinalNovoComentarioResenha" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
						<span id="btNovoComentarioResenha" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar esta resenha</span> -->
						<span class="info azulClaro altura30" style="font-size: x-large;">Comentar esta resenha</span>
					</div>
					
						<table width="1000px">
							<tr>
								<td width="100%" align="left" style="padding: 20px;">								
											
									<div id="divNovoComentarioResenha" align="left" class="paddingPadrao">
										
										<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
																	
										<div class="paddingPadrao">
										<label class="labelForm2">Nome</label>
										<input id="comentarNovaResenhaNome" type="text" name="comentario.nome" class="form-control" maxlength="254"/>
										</div>
										
										<div class="paddingPadrao">
										<label class="labelForm2">Email <span class="info azulClaro" > Seu e-mail n&atilde;o ser&aacute; divulgado no site :)</span></label>
										<input id="comentarNovaResenhaEmail" type="text" name="comentario.email" class="form-control" maxlength="254"/>
										</div>
										
										<div class="paddingPadrao">
										<label class="labelForm2">Coment&aacute;rio </label>
										<textarea id="comentarNovaResenhaConteudo" name="comentario.conteudo" class="form-control" rows="9"></textarea>
										
										<h3 align="right" style="font-size: small;">
										Voc&ecirc; pode digitar <span id="contadorCaracterComentarNovaResenhaConteudo">1000</span> caracteres em seu coment&aacute;rio.
										</h3>
										</div>
										
										<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
										<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
										<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
													
										<h3 align="right">
										<input id="btClienteComentarResenha" type="submit" value="Enviar comentário"  class="buttonCadastrar direita"/>
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
			<th colspan="4" align="center">
				<h2><a id="goTopo" href="#irTopo" class="info azulClaro letraGrande altura30 destaqueLetraHover ponteiro">ler outras resenhas</a></h2>
			</th>			
		</tr>		
	</tfoot>
</table>

</div> 

<br/><br/>

<c:if test="${not empty ultimaPublicacao or not empty resenhasRequest}">
<div class="superFooter" align="center">
	<div style="width: 1000px; text-align: left; padding: 20px;">
		<a id="btVisualizarOutrasResenhas" href="<c:url value="/resenha/cliente/listarTodas"/>" class="info azulClaro letraGrande altura30 destaqueLetraHover ponteiro" >Visualizar resenhas anteriores</a>
		<a id="btVisualizarUltimasResenhas" href="<c:url value="/resenha/cliente"/>" class="info azulClaro altura30 letraGrande destaqueLetraHover ponteiro" >Visualizar ultima publica&ccedil;&atilde;o</a>
	</div>
</div>
</c:if>


</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
