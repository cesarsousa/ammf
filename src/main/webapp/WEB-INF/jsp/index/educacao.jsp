
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">

	<div id="carouselEducacao" class="carousel slide carrosselMenu" data-ride="carousel" data-interval="5000">
		<ol class="carousel-indicators">
			<li data-target="#carouselEducacao" data-slide-to="0" class="active"></li>
			<li data-target="#carouselEducacao" data-slide-to="1"></li>
			<li data-target="#carouselEducacao" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="item active"><img src="${imagem}/educacao_foto1.jpg" alt=""/></div>
			<div class="item"><img src="${imagem}/educacao_foto2.jpg" alt=""/></div>
			<div class="item"><img src="${imagem}/educacao_foto3.jpg" alt=""/></div>
		</div>
		<a class="left carousel-control" href="#carouselEducacao" data-slide="prev"><span class="icon-prev"></span></a>
		<a class="right carousel-control" href="#carouselEducacao" data-slide="next"><span class="icon-next"></span></a>
	</div>

	<div id="espacador"></div>
	
	<div class="areaFormatacao">	
		<div class="esquerda">
			<img class="imgMenuPrincipal" src="${imagem}/iconeEducacaoHover.png"/>
		</div>
		<span style="float: left; font-size: xx-large; padding-top: 15px;">Educa&ccedil;&atilde;o</span>
			<div class="direita">
			<span class="paddingPadrao azulClaro">Tamanho da letra do texto:</span>
			<span id="sizeSmall" style="font-size: small;" class="ponteiro" >A</span>
			<span id="sizeMedium" style="font-size: medium;" class="ponteiro" >A</span>
			<span id="sizeLarge" style="font-size: large;" class="ponteiro" >A</span>
			<span id="sizeXLarge" style="font-size: x-large;" class="ponteiro" >A</span>
			<span id="sizeXxLarge" style="font-size: xx-large;" class="ponteiro" >A</span>
		</div>	
	</div>
	
	<div id="espacador"></div>
	
	<div id="textoLeituraEducacao" class="cardViewText">
		<c:forEach items="${sessaoCliente.textoEducacao}" var="paragrafo">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${paragrafo.trechoTexto}</p>		
		</c:forEach>
	</div>

	<div id="espacador"></div>

</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
