
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
      
});
