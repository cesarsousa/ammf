
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
    
    $('#divQuemSou').hide();
    $('#mainCardHeader').toggle(
			function(){$('#divQuemSou').slideDown(500);},
			function(){$('#divQuemSou').slideUp(500);}
	);	
    
    
    $('#btFecharQuemSou').click(function(){
    	$('#divQuemSou').slideUp(500);
    });
   
});