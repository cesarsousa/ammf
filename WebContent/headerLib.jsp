<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<title>Alcindo Miguel Martins Filho</title>

<link href="${css}/estilo.css" rel="stylesheet" type="text/css" />
<link href="${css}/table.css" rel="stylesheet" type="text/css" />
<link href="${css}/jquery-ui-1.8.4.custom.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="${javascript}/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${javascript}/jquery.autocomplete.min.js"></script>
<script type="text/javascript" src="${javascript}/jquery.maskedinput-1.3.min.js"></script>
<script type="text/javascript" src="${javascript}/jquery.puts.js"></script>
<script type="text/javascript" src="${javascript}/jquery.autoresize.js"></script>
<script type="text/javascript" src="${javascript}/jquery.infinitecarousel3.js"></script>
<script type="text/javascript" src="${javascript}/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${javascript}/jquery.maskmoney.js"></script>

<script type="text/javascript" src="${javascript}/COMMONS.js"></script>
<script type="text/javascript" src="${javascript}/index.js"></script>
<script type="text/javascript" src="${javascript}/menu.js"></script>
<script type="text/javascript" src="${javascript}/login.js"></script>
<script type="text/javascript" src="${javascript}/psicologia.js"></script>
<script type="text/javascript" src="${javascript}/educacao.js"></script>
<script type="text/javascript" src="${javascript}/cultura.js"></script>
<script type="text/javascript" src="${javascript}/artesOrientais.js"></script>
<script type="text/javascript" src="${javascript}/cadastroAdmin.js"></script>
<script type="text/javascript" src="${javascript}/blogCliente.js"></script>
<script type="text/javascript" src="${javascript}/blogAdmin.js"></script>
<script type="text/javascript" src="${javascript}/cadastroCliente.js"></script>
<script type="text/javascript" src="${javascript}/depoimentoCliente.js"></script>
<script type="text/javascript" src="${javascript}/depoimentoAdmin.js"></script>
<script type="text/javascript" src="${javascript}/contatoCliente.js"></script>
<script type="text/javascript" src="${javascript}/assinaturaEmail.js"></script>
<script type="text/javascript" src="${javascript}/lojaCliente.js"></script>
<script type="text/javascript" src="${javascript}/lojaAdmin.js"></script>
<script type="text/javascript" src="${javascript}/resenhaAdmin.js"></script>
<script type="text/javascript" src="${javascript}/resenhaCliente.js"></script>
<script type="text/javascript" src="${javascript}/linkAdmin.js"></script>

</head>
<body>

<input id="imageContexto" type="hidden" value="${imagem}"/>

<!-- rede social facebook -->
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

<!-- rede social tweeter -->
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>

<!-- rede social google +1 -->
<script type="text/javascript">
  window.___gcfg = {lang: 'pt-BR'};

  (function() {
    var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
    po.src = 'https://apis.google.com/js/plusone.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
  })();
</script>

<div id="wrap">
<div id="main">

<input id="contexto" type="hidden" value="${contextoApp}"/>
