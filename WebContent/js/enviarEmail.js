
$(document).ready(function() {
	
	$('#telaAguardeEnviarEmail').hide();
	
	$('#btEnviarEmailAdmin').click(function(){
		$('#divPgEnviarEmail').slideUp(500);
		$('#telaAguardeEnviarEmail').slideUp(500);
	});
			
});
