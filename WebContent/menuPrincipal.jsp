<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<br/>
<div align="center">
<table id="tabMenuPrincipal">
	<tr>
		<td align="center">
			<ul id="menu">
				<li>
					<img class="imgMenuPrincipal" src="${imagem}/icone_home.png"/>
					<a href="<c:url value="/"/>">Home</a></li>	
				<li>
					<img class="imgMenuPrincipal" src="${imagem}/iconePsicologiaHover.png"/>
					<a id="linkPsicologia" href="<c:url value="/index/psicologia"/>">Psicologia</a></li>
				<li>
					<img class="imgMenuPrincipal" src="${imagem}/iconeEducacaoHover.png"/>
					<a id="linkEducacao" href="<c:url value="/index/educacao"/>">Educa&ccedil;&atilde;o</a></li>
				<li>
					<img class="imgMenuPrincipal" src="${imagem}/iconeCulturaHover.png"/>
					<a id="linkCultura" href="<c:url value="/index/cultura"/>">Cultura</a></li>
				<li>
					<img class="imgMenuPrincipal" src="${imagem}/iconeOrientalHover.png"/>
					<a id="linkOrientais" href="<c:url value="/index/artesorientais"/>">Artes Orientais</a></li>
			</ul>
		</td>
	</tr>
</table>
</div>

<!-- javascript desta pagina em index.js -->

<form id="formClienteHome" action="<c:url value="/" />"></form>
<form id="formClienteBlog" action="<c:url value="/blog/cliente" />" method="get"></form>
<form id="formClienteResenhas" action="<c:url value="/resenha/cliente" />" method="get"></form>
<!-- <form> Consultas
	<form> Calendario -->
<form id="formClienteLinks" action="<c:url value="/link/cliente" />" method="get"></form>
<form id="formClienteDepoimento" action="<c:url value="/cliente/depoimentos" />" method="get"></form>
<!-- <form> Cursos  -->
<form id="formClienteCadastro" action="<c:url value="/cliente/cadastro" />" method="get"></form>
<form id="formClienteContato" action="<c:url value="/cliente/contato" />" method="get"></form>
<form id="formClienteLojaVirtual" action="<c:url value="/cliente/loja" />" method="get"></form>
<form id="formClienteFaq" action="<c:url value="/cliente/faq" />" method="get"></form>

<div align="center">
	<div class="separador"></div>
	
		<div align="center">
		<div id="menuLink" >
			<label id="btClienteHome" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Home</label>
			<label id="btClienteBlog" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Blog</label>
			<label id="btClienteResenhas" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Resenhas</label>
			<label id="btClienteLinks" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Links</label>
			<label id="btClienteDepoimento" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Depoimento</label>
			<label id="btClienteCadastro" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Cadastro</label>
			<label id="btClienteContato" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Contato</label>
			<label id="btClienteLojaVirtual" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Loja Virtual</label>
			<label id="btClienteFaq" class="btMenuCliente" onclick="javascript: submitFormulario(this)">FAQ</label>
		</div>
	</div>

</div>
