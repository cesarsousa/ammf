<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="" align="center">

<h2>Blog do Miguel</h2>

<p>
<span class="info azulClaro" >Aqui voc&ecirc; vai encontrar os meus textos e saber um pouco mais sobre o que gosto de escrever e compartilhar com meu p&uacute;blico.</span>
</p>
</div>

<a name="irTopo"></a>
<table class="display" id="example">
	<thead align="left">
		<tr>
			<th class="metadado">Autor</th>
			<th class="metadado">T&iacute;tulo</th>
			<th class="metadado">Texto</th>
			<th class="metadado">Postagem</th>			
		</tr>
	</thead>
	<tbody>
 		<c:forEach items="${textosBlog}" var="texto">
			<tr class="zebrado">
				<td class="infoTabela">${texto.autor}</td>
				<td class="infoTabela metadado ponteiro" title="visualizar este texto">
				<a class="infoTabela metadado" href="#lerTexto" onclick="javascript:visualizarTextoBlog('${texto.uuid}');">${texto.titulo}</a>
				</td>
				<td class="infoTabela">
					<c:set var="origem"	value="${texto.conteudo}"/>
					<c:out value="${fn:substring(origem,0,50)}"/>...</td>
				<td class="infoTabela"><b>${texto.dataFormatada}</b></td>
			</tr>			
		</c:forEach>		
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4" align="center"><h2>Celebre a Vida !</h2> </th>			
		</tr>		
	</tfoot>
</table>

<a name="lerTexto"></a>
<table id="textoModoLeitura" class="cardViewText" align="center">	
	<tbody>
 		<tr>
			<td>
			<p id="textoblogTitulo" class="textoAutorBlog azulClaro fonteGrande centralizar">&ldquo; titulo &ldquo;</p>
			<p id="textoblogData" class="textoPostagemBlog aEsquerda">postado em 01/01/2012 12:00:00</p>			
			<p id="textoblogConteudo" class="textoConteudoBlog">conteudo</p>
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

<br/><br/>

<div id="telaAguardeCadastroDepoimento">
	<div align="center">
		
		<h2>Depoimentos</h2>
		<span class="info azulClaro" >Deixe sua opni&atilde;o sobre o site ou sobre qualquer outro assunto. </span>

		<h3 class="paddingTelaAguarde"><span id="nomeDoCliente"></span> seu depoimento esta sendo processado.</h3>
		
		<div class="msgBorder msgAguarde"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif" /></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<br/>



<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
