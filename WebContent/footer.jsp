<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- <div align="center">
<h2>Celebre a Vida !</h2>
</div> -->

<div style="width: 100%; background-color: #DDDDDD"> 
	<div align="center" style="padding-bottom: 10px;">
	
	<table id="tabRedesSociais" style="width: 1000px;">
		<tr>
		<td width="34%" valign="top">
			<div align="left">
			<ul>
				<li><a href="<c:url value="/"/>">Home</a></li>
				<li><a href="<c:url value="/index/terapeuta"/>">O Terapeuta</a></li>
				<li><a href="<c:url value="/index/psicologia"/>">Psicologia</a></li>
				<li><a href="<c:url value="/index/educacao"/>">Educa&ccedil;&atilde;o</a></li>
				<li><a href="<c:url value="/index/cultura"/>">Cultura</a></li>
				<li><a href="<c:url value="/index/artesorientais"/>">Artes Orientais</a></li>
			</ul>
			</div>
		</td>
		
		<td width="33%" valign="top">
			<div align="left">
			<ul>			
				<li><a href="<c:url value="/blog/cliente" />">Blog</a></li>
				<li><a href="<c:url value="/resenha/cliente" />">Resenhas</a></li>
				<%-- <a href="<c:url value=""/>">Consultas</a>
				<a href="<c:url value=""/>">Calendario</a> --%>
				<li><a href="<c:url value="/link/cliente" />">Links</a></li>
				<li><a href="<c:url value="/cliente/depoimentos"/>">Depoimentos</a></li>
				<%-- <a href="<c:url value=""/>">Cursos</a> --%>
				<li><a href="<c:url value="/cliente/cadastro"/>">Cadastro</a></li>
				<li><a href="<c:url value="/cliente/contato"/>">Contato</a></li>
				<li><a href="<c:url value="/cliente/loja"/>">Loja Virtual</a></li>
				<li><a href="<c:url value="/cliente/faq"/>">FAQ</a></li>
			</ul>
			</div>
		</td>
		
		<td width="33%" style="border-left: 1px dashed #FFFFFF;">
			<table>
			<tr>
				<td class="pad10" align="left">
				<span id="btVisualizarTodos" class="info azulClaro altura30 letra">Compartilhe em suas redes sociais preferidas</span>
				</td>
			</tr>
			<tr>
				<td align="left" class="paddingPadrao">
				<div id="padRedeSocial" class="g-plusone" data-size="medium"></div>
				</td>
			</tr>
			<tr>	
				<td align="left" class="paddingPadrao">
				<div id="padRedeSocial" class="fb-like" data-href="http://www.alcindomiguel.com.br" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
				</td>
			</tr>
			<tr>	
				<td align="left" class="paddingPadrao">
				<a id="padRedeSocial" href="https://twitter.com/share" class="twitter-share-button" data-lang="pt">Tweetar</a>
				</td>
			</tr>
			</table>		
		</td>	
		</tr>
	</table>	
	
	<label id="labelFooter" >&copy; 2012 - quiron.psc.br - Todos os Direitos Reservados
	<br/>
	Designed by	
	<a id="linkein" href="http://br.linkedin.com/pub/cesar-sousa-junior/66/583/a43" target="_blank">
	C&eacute;sar Sousa J&uacute;nior</a>	
	</label>	
	</div>
</div>

</body>
</html>