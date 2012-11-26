
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">

	<ul id="carouselArtesOrientais">
		<li><img src="${imagem}/artesorientais_foto1.jpg"></li>
		<li><img src="${imagem}/artesorientais_foto2.jpg"></li>
		<li><img src="${imagem}/artesorientais_foto3.jpg"></li>
	</ul>	

	<div id="espacador"></div>
	
	<div class="areaFormatacao">	
		<div class="esquerda">
			<img class="imgMenuPrincipal opacidade" src="${imagem}/iconeOriental.png"/>
		</div>
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
	
	<div id="textoLeituraArtesOrientais" class="cardViewText">
		<c:forEach items="${sessaoCliente.textoArtesOrientais}" var="paragrafo">
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${paragrafo.trechoTexto}.</p>		
		</c:forEach>
	</div>

	<div id="espacador"></div>

</div>

<%@ include file="/footer.jsp" %>
