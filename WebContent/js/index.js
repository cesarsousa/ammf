
function submitFormulario(elemento){
	var elementoId = elemento.id;
	var formId = "#" + elementoId.replace("bt", "form");
	$(formId).submit();	
}

$(document).ready(function() {   
    
    $('#imglinkHome, #imglinkTerapeuta, #imglinkPsicologia, #imglinkEducacao, #imglinkCultura, #imglinkOrientais').click(function(){
    	var idFormulario = "#form" + this.id;
    	$(idFormulario).submit();
    });
    
    
    // fixar o menu durante a rolagem da pagina
    //
    //var nav = $('.nav-total');
    //
    //$(window).scroll(function () {
    //    if ($(this).scrollTop() > 100) {
    //        nav.addClass("f-nav");
    //    } else {
    //        nav.removeClass("f-nav");
    //    }
    //});
    
    // fixar o menu durante a rolagem da pagina


    
    /*$('#ultimasNovidades').hide();
	$("#gatilhoNews").hover(function(){
        $('#ultimasNovidades').slideDown(500);
    },
    function(){
    	$('#ultimasNovidades').slideUp(500);
    });*/
      
});
