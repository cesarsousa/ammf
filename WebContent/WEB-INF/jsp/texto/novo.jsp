<%@ include file="/headerLib.jsp" %>

<div align="center">
<div class="campoDeTexto">

<form action="/texto/cadastra" method="post">
<p>
<input id="campoTituloTexto" type="text" class="areaTitulo letraCinza" name="texto.titulo">
</p>
<textarea id="campoTextoPrincipal" class="areaTexto letraCinza" name="texto.conteudo"></textarea>
<p align="right">
<input type="submit" value="cadastrar" class="button">
</p>
</form>

</div>
</div>

<%@ include file="/footer.jsp" %>