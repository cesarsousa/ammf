
function abrirInformacaoProduto(elemento){
	var id = elemento.id;
	var uuid = id.replace("btInformacaoLivro", "");
	var tabInfoLivro = "#tabInfoLivro" + uuid;	
	$(tabInfoLivro).slideDown(500);
}

function fecharInformacaoProduto(elemento){
	var id = elemento.id;
	var uuid = id.replace("btFecharInfoLivro", "");
	var tabInfoLivro = "#tabInfoLivro" + uuid;	
	$(tabInfoLivro).fadeOut(500).slideUp(500);
}

$(document).ready(function() {
	
	$('#telaAguardeLojaCliente').hide();
	
	// Programacao das abas
	$('div.htmltabs div.tabsContent').hide();
	$('div.tab1').show();
	$('div.htmltabs ul.tabs li.tab1 a').addClass('tab-current');
	$('div.htmltabs ul li a').click(function(){
	    var thisClass = this.className.slice(0,4);
	    $('div.htmltabs div.tabsContent').hide();
	    $('div.' + thisClass).show();
	    $('div.htmltabs ul.tabs li a').removeClass('tab-current');
	    $(this).addClass('tab-current');
	});
	
	$('.modoHidden').hide();
	
	$('#tabInformacaoLivro').hide();
	$('#btInformacaoLivro').click(function(){
		$('#tabInformacaoLivro').slideDown(500);
	});
	$('#btFecharInfoLivro').click(function(){
		$('#tabInformacaoLivro').slideUp(500);
	});
	
	$('#btComprarLivro').click(function(){
		$('#formDownloadBoleto').submit();
	});
	
});