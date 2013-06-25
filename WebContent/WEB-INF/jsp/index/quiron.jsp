<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>

<!-- <script>

// Funcao adaptImage()
// Parametros: targetimg (objeto jquery com elementos selecionados)
function adaptImage(targetimg) {
	var wheight = $(window).height(); // altura da janela do navegador
	var wwidth = $(window).width(); // largura da janela do navegador
	
	// removemos os atributos de largura e altura da imagem
    targetimg.removeAttr("width")
    		 .removeAttr("height")
    		 .css({ width: "", height: "" }); // removemos poss�veis regras css tamb�m
	
    var imgwidth = targetimg.width(); // largura da imagem
    var imgheight = targetimg.height(); // altura da imagem
	
    var destwidth = wwidth; // largura que a imagem deve ter
    var destheight = wheight; // altura que a imagem deve ter
    
	// aqui vamos determinar o tamanho final da imagem
	if(imgheight < wheight) {
		// se a altura da imagem for menor que a altura da tela, fazemos um c�lculo
		// para redefinir a largura da imagem para bater com a altura que queremos
		destwidth = (imgwidth * wheight)/imgheight;
		
		$('#fundo img').height(destheight);
		$('#fundo img').width(destwidth);
	}
	
	// aqui utilizamos um c�lculo simples para determinar o posicionamento da imagem
	// para que a mesma fique no meio da tela
	// posicao = dimens�o da imagem/2 - dimens�o da tela/2
	destheight = $('#fundo img').height();
	var posy = (destheight/2 - wheight/2);
	var posx = (destwidth/2 - wwidth/2);
	
	//se o c�lculo das posicoes der resultado positivo, trocamos para negativo
	if(posy > 0) {
		posy *= -1;
	}
	if(posx > 0) {
		posx *= -1;
	}
	
	// colocamos atraves da funcao css() do jquery o posicionamento da imagem
	$('#fundo').css({'top': posy + 'px', 'left': posx + 'px'});
}

//quando a janela for redimensionada, adaptamos a imagem
$(window).resize(function() {
	adaptImage($('#fundo img'));
});

//quando a pagina carregar, fazemos o mesmo
$(window).load(function() {
	$(window).resize();
});</script> -->

<%-- <%@ include file="/headerSite.jsp" %> --%>


<div id="fundo-externo">
    <div id="fundo">
        <img src="${imagem}/quironFixed.jpg"/>
    </div>
</div>

<div id="conteudoQuiron">
    <h1>Site Exemplo</h1>
    <p>
        conteudo com texto...
    </p>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<br/>

<div id="footer" style="color: #000000;">
<%@ include file="/footerQuiron.jsp" %>
</div>