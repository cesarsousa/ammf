
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">

	<div id="wowslider-container1">
	<div class="ws_images"><ul>
	<li><img src="${imagem}/cultura_foto1.jpg" alt="" title="" id="wows1_0"/></li>
	<li><img src="${imagem}/cultura_foto2.jpg" alt="" title="" id="wows1_1"/></li>
	<li><img src="${imagem}/cultura_foto3.jpg" alt="" title="" id="wows1_2"/></li>
	</ul>
	</div>
	</div>

	<%-- <ul id="carouselCultura">
		<li><img src="${imagem}/cultura_foto1.jpg"></li>
		<li><img src="${imagem}/cultura_foto2.jpg"></li>
		<li><img src="${imagem}/cultura_foto3.jpg"></li>
	</ul> --%>

	<div id="espacador"></div>
	
	<div class="areaFormatacao">	
		<div class="esquerda">
			<img class="imgMenuPrincipal" src="${imagem}/iconeCulturaHover.png"/>
		</div>
		<span style="float: left; font-size: xx-large; padding-top: 15px;">Cultura</span>
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
	
	<div id="textoLeituraCultura" class="cardViewText">
		<c:forEach items="${sessaoCliente.textoCultura}" var="paragrafo">
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
