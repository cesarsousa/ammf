<%@ include file="/headerLib.jsp" %>

<diV align="center">
	<div id="mainCard">
		<div id="cardViewText">
			<c:forEach items="${titulos}" var="titulo">						
				<a href="<c:url value="/texto/visualiza/${titulo.uuid}" />">${titulo.descricao}</a>					
				<h2>Texto postado em ${titulo.data}.</h2>
				<h4>${titulo.uuid}</h4>
			</c:forEach>			
		</div>
	</div>
</diV>

<%@ include file="/footer.jsp" %>