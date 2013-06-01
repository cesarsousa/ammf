
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">

	<ul id="carouselPsicologia">
		<li><img src="${imagem}/psico_foto_1.jpg"></li>
		<li><img src="${imagem}/psico_foto_2.jpg"></li>
		<li><img src="${imagem}/psico_foto_3.jpg"></li>
	</ul>	

	<div id="espacador"></div>
	
	<div class="areaFormatacao">	
		<div class="esquerda">
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconePsicologiaHover.png"/>
		</div>
		<span style="float: left; font-size: xx-large; padding-top: 15px;">Psicologia</span>
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

	<div id="textoLeituraPsicologia" class="cardViewText">
		<c:forEach items="${sessaoCliente.textoPsicologia}" var="paragrafo">
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