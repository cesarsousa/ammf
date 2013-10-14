
function submitFormulario(elemento){
	var elementoId = elemento.id;
	var formId = "#" + elementoId.replace("bt", "form");
	$(formId).submit();	
}

$(document).ready(function() {   
    
    addRemoveOpacidade('#linkPsicologia', '#imagemPsicologia');
    addRemoveOpacidade('#linkEducacao', '#imagemEducacao');
    addRemoveOpacidade('#linkCultura', '#imagemCultura');
    addRemoveOpacidade('#linkOrientais', '#imagemOrientais');
   
});