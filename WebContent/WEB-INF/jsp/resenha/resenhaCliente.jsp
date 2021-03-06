<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<div style="background-color: #E8E8E8;">

<div align="center" class="fundoPadrao">

<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center" class="paddingPadrao"><h1><b>Resenhas</b></h1></div>
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

<div id="msgErroResenhaCliente" class="msgBorder msgErro closeClick ponteiro"></div>

<c:if test="${not empty ultimaPublicacao}">
	<div align="center">
	<br>
	<div class="paddingPadrao tamanhoDefault">
	<div class="alert alert-info">
	<p class="paddingPadrao">
	<span class="info azulClaro fonteMedia" >Selecione as resenhas por categorias</span>
	</p>
	
	<div >
		<c:forEach items="${categoriasResenha}" var="categoria">
		<a class="btn btn-default" href="<c:url value="/resenha/listar/categoria/${categoria.id}"></c:url>">
		<span class="categoria">${categoria.descricao}</span>
		</a>
		</c:forEach>
	</div>
	</div>
	</div>
	</div>
</c:if>

</div>

<c:if test="${not empty resenha}">
	<br/>
	<div align="center">
	<div class="cardViewText paddingDuplo bordaPadrao" align="left">		
		<table>
		<tr>
		<td valign="top" width="20%">					
		<a href="<c:url value="/resenha/visualizador/${resenha.uuid}" />" title="${resenha.titulo}">
			<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="fotoLivro">
		</a>				
		</td>
		
		<td class="paddingPadrao" width="80%">
		<h2>${resenha.categoria.descricao}</h2>
		<hr>
		<h3>${resenha.titulo}</h3>
		
			<div style="width: 80%">
			<c:forEach items="${paragrafosResenha}" var="paragrafoResenha">
				<p class="textoConteudoDepoimento">${paragrafoResenha.trechoTexto}</p>
			</c:forEach>
			</div>	
		
		<p class="textoAutorDepoimento azulClaro">${resenha.autor}</p>
		<p class="textoPostagemDepoimento negrito">... resenha postada em ${resenha.dataFormatada}</p>		
		</td>
		</tr>
		<c:if test="${not empty resenha.url}">
		<tr align="center">
		<td colspan="2" class="paddingPadrao">
		<hr>
		<iframe width="854" height="480" src="${resenha.url}" frameborder="0" allowfullscreen></iframe>
		</td>
		</tr>
		</c:if>
		</table>	
	</div>
	
	<c:if test="${not empty resenha.comentariosConfirmados}">
		<br/>			
		<div class="cardViewText paddingDuplo bordaPadrao">
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
	<div  align="left" class="cardViewText paddingDuplo bordaPadrao">
		
		<div>
			<span class="info azulClaro altura30" style="font-size: x-large;">Comentar esta resenha</span>
		</div>
		
		<table width="1000px">
			<tr>
				<td width="100%" align="left" style="padding: 20px;">								
							
					<div align="left" class="paddingPadrao">
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
				
				<div class="cardViewText bordaPadrao">
					<table>
					<tr>
					<td class="paddingPadrao" valign="top" width="20%">					
					<a href="<c:url value="/resenha/visualizador/${ultimaPublicacao.uuid}" />" title="${ultimaPublicacao.titulo}">
						<img src="<c:url value="/resenha/visualizador/${ultimaPublicacao.uuid}" />" class="fotoLivro">
					</a>				
					</td>
					
					<td class="paddingPadrao" width="80%">
					<h2>${ultimaPublicacao.categoria.descricao}</h2>
					<hr>
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
					
					<c:if test="${not empty ultimaPublicacao.url}">
					<tr align="center" >
					<td colspan="2" class="paddingPadrao">
					<hr>
					<iframe width="854" height="480" src="${ultimaPublicacao.url}" frameborder="0" allowfullscreen></iframe>
					</td>
					</tr>
					</c:if>				
					
					</table>									
				</div>
				
				<c:if test="${not empty ultimaPublicacao.comentariosConfirmados}">
						<br/>			
						<div class="cardViewText bordaPadrao">
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
					<div  align="left" class="cardViewTextNoBackground bordaPadrao">
						
						<div>
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
		<h1 style="padding-left: 10px; text-align: center;">Encontre a resenha que deseja ler na lista abaixo</h1>
		
		<div align="center">
		<table class="tamanho1200">
		<tr class="tamanho1200">
		<td align="center">
		<c:forEach items="${resenhasRequest}" var="resenha">
		
		<a href="#lerTexto" onclick="javascript:visualizarTextoResenha('${resenha.uuid}');">		
		<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="icone100x200 molduraFotoResenha" data-toggle="tooltip" title="${resenha.categoria.descricao} ${resenha.titulo}">
		</a>
			
			<%-- <table class="tamanhoDefault">
			<tr class="cartao tamanhoEdicaoIndex bordaPadrao cardTabela paddingPadrao">
			
			<td width="10%" class="paddingPadrao">
				<div class="main-inner">
					<h2 class="date-header">${resenha.dataFormatadaSimples}</h2>
				</div>
				<img src="<c:url value="/resenha/visualizador/${resenha.uuid}" />" class="icone100x200" data-toggle="tooltip" title="Hooray!">
			</td>
			<td width="90%" class="paddingPadrao">
				<div>
					<br>${resenha.categoria.descricao}<br><b>${resenha.titulo}</b>
				</div>
				<div class="paddingPadrao" class="infoTabela">
					<c:set var="origem"	value="${resenha.descricao}"/>
					<c:out value="${fn:substring(origem,0,100)}"/>...
					<p class="paddingPadrao" align="right"><a class="btn btn-primary" href="#lerTexto" onclick="javascript:visualizarTextoResenha('${resenha.uuid}');">Ler resenha</a></p>
				</div>			
			</td>
			</tr>
			</table> --%>
		
		</c:forEach>
		</td>
		</tr>
		</table>
		</div>
		
	</c:when>
	<c:otherwise>
		<p align="center" class="info azulClaro letraGrande">N&atilde;o existem resenhas publicadas para a sua solicita&ccedil;&atilde;o</p>
	</c:otherwise>
</c:choose>

<a name="irTopo"></a>
<a name="lerTexto"></a>
<br/>

<table id="resenhaModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			
			<div class="cardViewText bordaPadrao">
					<table>
					<tr>
					<td class="paddingPadrao" valign="top" width="20%">
					<a id="linkPrettyPhotoResenha" title="${resenha.titulo}">
						<img id="imagemResenhaModoLeitura" class="fotoLivro" />
					</a>					
					</td>
					
					<td class="paddingPadrao" width="80%">
					<input id="uuidResenhaView" type="hidden" />
					<h2><span id="resenhaCategoria"></span></h2>
					<hr>
					<h3><span id="resenhaTitulo"></span></h3>					
					<p id="resenhaConteudo" class="textoConteudoDepoimento"></p>
					<p id="resenhaAutor" class="textoAutorDepoimento azulClaro"></p>
					<p id="resenhaData" class="textoPostagemDepoimento negrito"></p>					
					</td>
					</tr>
					<tr align="center" >
					<td colspan="2" class="paddingPadrao">
					<div id="resenhaUrl"></div>
					</td>
					</tr>
					</table>									
				</div>
				
				<div id="divVisualizarComentariosResenha bordaPadrao">
					<br/>
					<div class="cardViewText bordaPadrao">
						<span class="info azulClaro altura30" style="font-size: x-large;">Coment&aacute;rios</span>					
						<div id="divComentariosResenha"></div>				
					</div>
				</div>
					
				<!-- Adicionar um comentario para o texto -->
				<br/>
				<div  align="left" class="cardViewTextNoBackground bordaPadrao">
					
					<div>
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
										<input id="btClienteComentarResenha" type="submit" value="Enviar comentário"  class="btn btn-success direita"/>
										</h3>					
									</div>
								</td>			
							</tr>		
						</table>		
					</div>
				
						
			</td>		
		</tr>
		<tr>
		<td>
		<h2 align="center"><a id="goTopo" href="#irTopo" class="btn btn btn-primary">ler outras resenhas</a></h2>
		</td>
		</tr>		
	</tbody>
	
</table>

</div> 

<br/><br/>

<c:if test="${not empty ultimaPublicacao or not empty resenhasRequest}">
<div class="superFooter" align="center">
	<div align="center" class="paddingPadrao">
		<a id="btVisualizarOutrasResenhas" href="<c:url value="/resenha/cliente/listarTodas"/>" class="btn btn btn-primary btn-lg">Visualizar resenhas anteriores</a>
		<a id="btVisualizarUltimasResenhas" href="<c:url value="/resenha/cliente"/>" class="btn btn btn-primary btn-lg">Visualizar ultima publica&ccedil;&atilde;o</a>
	</div>
</div>
</c:if>

</div>

</div> <!-- main -->
</div> <!-- wrap -->



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
