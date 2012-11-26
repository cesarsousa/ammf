
$(document).ready(function() {
	
	var usuario = "Usuário";
	$('#usuarioLogin').puts(usuario);	
		
	$('#boxErroLogin').addClass('ponteiro');
	$('#boxErroLogin').click(function(){
		$('#boxErroLogin').fadeOut(1000);
	});
	
	$('#passwordChecker').show();
    $('#usuarioSenha').hide();

    $('#passwordChecker').focus(function() {
        $('#passwordChecker').hide();
        $('#usuarioSenha').show();
        $('#usuarioSenha').focus();
    });
    $('#usuarioSenha').blur(function() {
        if($('#usuarioSenha').val() == '') {
                $('#passwordChecker').show();
                $('#usuarioSenha').hide();
        }
    });
    
    addRemoveDestaque("#usuarioLogin");
    
    addRemoveDestaque("#usuarioSenha");
});