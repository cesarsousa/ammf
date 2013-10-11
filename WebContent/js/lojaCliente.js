
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
	
	$('#telaAguardeLojaCliente, #livroBuscaPersonalizada, #tabLivrosPublicados').hide();
	
	$('#btLivroBuscaPersonalizada').click(function (){
		$('#livroBuscaPersonalizada').slideDown(500);
	});
	
	addRemoveDestaque('#campoBuscaLivro');
	$('#campoBuscaLivro').puts('Digite parte do nome e pressione a tecla ENTER');
	
	$('#btFecharLivroBuscaPersonalizada').click(function (){
		$('#livroBuscaPersonalizada').slideUp(500);
	});
	
	$('#btLivrosPublicados').click(function (){
		$('#tabLivrosPublicados').slideDown(500);
	});
	
	$('#btFecharTabLivrosPublicados').click(function (){
		$('#tabLivrosPublicados').slideUp(500);
	});
	
	
	
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