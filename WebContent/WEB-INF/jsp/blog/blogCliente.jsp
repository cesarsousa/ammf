<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty erroComentarioPrincipal}">
<div class="msgBorder msgErro closeClick">
${nomeEmBranco}
${emailEmBranco}
${conteudoEmBranco}
</div>
<br/>
</c:if>
<div id="msgErroBlogCliente" class="msgBorder msgErro closeClick"></div>

<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<input type="hidden" id="erroComentarioPrincipal" value="${erroComentarioPrincipal}" />
<form id="formBlogComentado" method="get" action="<c:url value="/site/comentado"></c:url>"></form>


<div id="" align="center">

<h2 class="tituloPagina">Blog do Miguel</h2>

<p>
<span class="info azulClaro letraGrande" >Aqui voc&ecirc; vai encontrar os meus textos e saber um pouco mais sobre o que gosto de escrever e compartilhar com meu p&uacute;blico.</span>
</p>
</div>

<div align="center">
	<c:choose>		
		<c:when test="${empty ultimaPublicacao}">
			<div id="ultimaPublicacao" class="cardViewText">
			<c:choose>
				<c:when test="${emailRequest}">
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">O texto solicitado foi removido deste blog ou est&aacute; sendo atualizado.</p>
				</c:when>
				<c:otherwise>
					<p class="textoAutorBlog azulClaro fonteGrande centralizar">Este texto est&aacute; sendo atualizado... Logo estar&aacute; dispon&iacute;vel.</p>
				</c:otherwise>
			</c:choose>
			</div>
		</c:when>
		
		<c:otherwise>
			<div id="ultimaPublicacao" class="cardViewText">
			<p class="textoAutorBlog azulClaro fonteGrande centralizar">${ultimaPublicacao.titulo}</p>
				
			<c:forEach items="${paragrafos}" var="paragrafo">
				<p class="textoConteudoBlog">${paragrafo.trechoTexto}</p>		
			</c:forEach>
			<p class="textoPostagemBlog aEsquerda negrito">... texto postado em ${ultimaPublicacao.dataFormatada}</p>
			
			<c:if test="${not empty ultimaPublicacao.comentariosConfirmados}">
			
				<div class="paddingPadrao" align="left" style="border-top: 1px solid #CCCCCC; border-width: 100%;">
				<span id="imgdivComentariosTextoPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
				<span id="btdivComentariosTextoPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span>								
				
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
			<div  align="left" style="border-top: 1px solid #CCCCCC; border-width: 100%;">
				
				<div class="paddingPadrao">
					<span id="imgNovoComentarioBlogPrincipal" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
					<span id="btNovoComentarioBlogPrincipal" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar este texto</span>
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
									<input id="comentarTextoNomePrincipal" type="text" name="comentario.nome" value="${comentario.nome}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Email <span class="info azulClaro" >seu email n&atilde;o ser&atilde;o revelados no site.</span></label>
									<input id="comentarTextoEmailPrincipal" type="text" name="comentario.email" value="${comentario.email}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Coment&aacute;rio </label>
									<textarea id="comentarTextoConteudoPrincipal" name="comentario.conteudo" class="letraCinza largura90 bordaPadrao" rows="9">${comentario.conteudo}</textarea>
									
									<h3 align="right" style="font-size: small;">
									Voc&ecirc; pode digitar <span id="contadorCaracterComentarTextoConteudoPrincipal">1000</span> caracteres em seu coment&aacute;rio.
									</h3>
									</div>
									
									<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
									<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
									<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
												
									<h3 align="right">
									<input id="btnClienteComentarTextoPrincipal" type="submit" value="Enviar comentário"  class="buttonCadastrar direita"/>
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

<div id="divTodosTextos">

<h3 style="padding-left: 10px; text-align: center;">Encontre o texto que deseja ler na lista abaixo.<br/>Em seguida basta <span class="azulClaro">clicar no t&iacute;tulo para ler</span> o texto na íntegra.</h3>

<div align="center">
<table style="width: 90%">
	<thead align="left">
		<tr>
			<th class="metadado">T&iacute;tulo</th>
			<th class="metadado">Texto</th>
			<th class="metadado">Postagem</th>			
		</tr>
	</thead>
	<tbody>
 		<c:forEach items="${textosBlog}" var="texto">
			<tr class="zebrado">
				<td class="infoTabela metadado ponteiro" title="visualizar este texto">
				<a class="infoTabela metadado" href="#lerTexto" onclick="javascript:visualizarTextoBlog('${texto.uuid}');">${texto.titulo}</a>
				</td>
				<td class="infoTabela">
					<c:set var="origem"	value="${texto.conteudo}"/>
					<c:out value="${fn:substring(origem,0,100)}"/>...</td>
				<td class="infoTabela">${texto.dataFormatadaSimples}</td>
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

<a name="irTopo"></a>
<a name="lerTexto"></a>
<table id="textoModoLeitura"  width="100%">	
	<tbody>
 		<tr align="center">
			<td>
			<div class="cardViewText">
			<input id="uuidTextoBlog" type="hidden" />
			<p id="textoblogTitulo" class="textoAutorBlog azulClaro fonteGrande centralizar"></p>
			<p id="textoblogData" class="textoPostagemBlog aEsquerda negrito"></p>			
			<p id="textoblogConteudo" class="textoConteudoBlog"></p>
			
			
			<div id="divVisualizarComentarios" class="paddingPadrao" align="left" style="border-top: 1px solid #CCCCCC; border-width: 100%;">
				<span id="imgdivComentariosBlog" class="info azulClaro altura30" style="font-size: x-large;">+ </span>					
				<span id="btdivComentariosBlog" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Coment&aacute;rios</span>								
				
				<div id="divComentariosBlog"></div>				
			</div>					
			
			<!-- Adicionar um comentario para o texto -->
			<div class="paddingPadrao" align="left" style="border-top: 1px solid #CCCCCC; border-width: 100%;">
				<div>
					<span id="imgNovoComentarioBlog" class="info azulClaro altura30" style="font-size: x-large;">+ </span>
					<span id="btNovoComentarioBlog" class="info azulClaro altura30 destaqueLetraHover ponteiro" style="font-size: x-large;">Comentar este texto</span>
				</div>
					<table width="1000px">
						<tr>
							<td width="100%" align="left" style="padding: 20px;">						
										
								<div id="divNovoComentarioBlog" align="left" class="paddingPadrao">								
									
									<p class="info azulClaro">Todos os campos s&atilde;o de preenchimento obrigat&oacute;rio.</p>
																
									<div class="paddingPadrao">
									<label class="labelForm2">Nome</label>
									<input id="comentarTextoNome" type="text" class="letraCinza largura100 altura30 bordaPadrao" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Email <span class="info azulClaro" >seu email n&atilde;o ser&atilde;o revelados no site.</span></label>
									<input id="comentarTextoEmail" type="text" class="letraCinza largura100 altura30 bordaPadrao" maxlength="254"/>
									</div>
									
									<div class="paddingPadrao">
									<label class="labelForm2">Coment&aacute;rio </label>
									<textarea id="comentarTextoConteudo" class="letraCinza largura90 bordaPadrao" rows="9"></textarea>
									
									<h3 align="right" style="font-size: small;">
									Voc&ecirc; pode digitar <span id="contadorCaracterComentarTextoConteudo">1000</span> caracteres em seu coment&aacute;rio.
									</h3>
									</div>
									
									<p class="info azulClaro">Todos os coment&aacute;rio ser&atilde;o analisados antes de publicados no site.</p>
									<p class="info azulClaro">Evite utilizar nome de pessoas de forma ofensiva de qualquer tipo.</p>
									<p class="info azulClaro">Caso seu coment&aacute;rio seja considerado impr&oacute;prio para visualiza&ccedil;&atilde;o, ser&aacute; exclu&iacute;do sem aviso pr&eacute;vio.</p>
												
									<h3 align="right">
									<input id="btnClienteComentarTexto" type="button" value="Enviar comentário"  class="buttonCadastrar direita"/>
									</h3>					
								</div>
							</td>			
						</tr>		
					</table>		
				</div>
				</div>		
			
			</td>		
		</tr>		
	</tbody>
	<tfoot>		
		<tr>
			<th colspan="4" align="center">
				<h2><a id="goTopo" href="#irTopo">ler outros textos</a></h2>
			</th>			
		</tr>		
	</tfoot>
</table>
</div> 

<br/><br/>
<c:if test="${not empty textosBlog}">
<input id="emailRequest" type="hidden" value="${emailRequest}" />
<div class="superFooter" align="center">
	<div style="width: 1000px; text-align: left; padding: 20px;">
		<span id="btVisualizarTodos" class="info azulClaro altura30 letraGrande destaqueLetraHover ponteiro">Visualizar textos anteriores.</span>
	</div>
</div>
</c:if>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
