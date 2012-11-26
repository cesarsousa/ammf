<%@ include file="/headerLib.jsp" %>

<diV align="center">
	<div id="mainCard">
		<div id="cardViewText">
			<h1>${texto.titulo}</h1>
			<h2>Texto postado em ${texto.dataFormatada}.</h2>	
			<h3>${texto.conteudo}</h3>
		</div>
		
		<div align="right">
			<a href="<c:url value="texto/anterior/${texto.uuid}"/>">anterior</a>
			<a href="<c:url value="/"></c:url>">home</a>
			<a href="<c:url value="texto/proximo/${texto.uuid}"/>">proximo</a>		
		</div>	
	</div>
</diV>

<%@ include file="/footer.jsp" %>