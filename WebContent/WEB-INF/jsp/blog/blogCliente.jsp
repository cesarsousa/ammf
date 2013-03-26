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

<table cellpadding="5" cellspacing="5" border="0" class="display" id="example">
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
				<td class="infoTabela metadado ponteiro" title="visualizar este texto">${texto.titulo}</td>
				<td class="infoTabela">
					<c:set var="origem"	value="${texto.conteudo}"/>
					<c:out value="${fn:substring(origem,0,50)}"/>...</td>
				<td class="infoTabela">${texto.dataFormatada}</td>
				</tr>			
		</c:forEach>		
	</tbody>
	<tfoot>
		<tr>
			<th colspan="4"><h2>Celebre a Vida !</h2> </th>			
		</tr>
	</tfoot>
</table>

<br/>

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
