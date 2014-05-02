
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
    
    $('#tabBlogNews').hover(function() {
		$('#tabBlogNews').addClass('cartao ponteiro');
		$('#tabBlogNews').click(function(){
			$('#formBlogNews').submit();
		});
	}, function() {
		$('#tabBlogNews').removeClass('cartao ponteiro');
	});	
    
    $('#tabResenhaNews').hover(function() {
		$('#tabResenhaNews').addClass('cartao ponteiro');
		$('#tabResenhaNews').click(function(){
			$('#formResenhaNews').submit();
		});
	}, function() {
		$('#tabResenhaNews').removeClass('cartao ponteiro');
	});	
    
    $('#tabLinkNews').hover(function() {
		$('#tabLinkNews').addClass('cartao ponteiro');
		$('#tabLinkNews').click(function(){
			$('#formLinkNews').submit();
		});
	}, function() {
		$('#tabLinkNews').removeClass('cartao ponteiro');
	});	
    
    $('#tabDepoimentoNews').hover(function() {
		$('#tabDepoimentoNews').addClass('cartao ponteiro');
		$('#tabDepoimentoNews').click(function(){
			$('#formDepoimentoNews').submit();
		});
	}, function() {
		$('#tabDepoimentoNews').removeClass('cartao ponteiro');
	});	
    
    $('#tabLojaNews').hover(function() {
		$('#tabLojaNews').addClass('cartao ponteiro');
		$('#tabLojaNews').click(function(){
			$('#formLojaNews').submit();
		});
	}, function() {
		$('#tabLojaNews').removeClass('cartao ponteiro');
	});	
    
    $('#tabFaqNews').hover(function() {
		$('#tabFaqNews').addClass('cartao ponteiro');
		$('#tabFaqNews').click(function(){
			$('#formFaqNews').submit();
		});
	}, function() {
		$('#tabFaqNews').removeClass('cartao ponteiro');
	});	
    
    
    
    
    
    
    /*
    // fixar o menu durante a rolagem da pagina
    
    var nav = $('.nav-total');
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            nav.addClass("f-nav");
        } else {
            nav.removeClass("f-nav");
        }
    });
    
    // fixar o menu durante a rolagem da pagina
    */
    
    /*$('#ultimasNovidades').hide();
	$("#gatilhoNews").hover(function(){
        $('#ultimasNovidades').slideDown(500);
    },
    function(){
    	$('#ultimasNovidades').slideUp(500);
    });*/
      
});
