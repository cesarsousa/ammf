<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- javascript desta pagina esta em index.js -->

<form id="formimglinkHome" action="<c:url value="/"/>" method="get"></form>
<form id="formimglinkTerapeuta" action="<c:url value="/index/terapeuta"/>" method="get"></form>
<form id="formimglinkPsicologia" action="<c:url value="/index/psicologia"/>" method="get"></form>
<form id="formimglinkEducacao" action="<c:url value="/index/educacao"/>" method="get"></form>
<form id="formimglinkCultura" action="<c:url value="/index/cultura"/>" method="get"></form>
<form id="formimglinkOrientais" action="<c:url value="/index/artesorientais"/>" method="get"></form>

<br/>
<div align="center">
<table id="tabMenuPrincipal">
	<tr>
		<td align="center">
			<ul id="menu">
				<li>
					<a href="<c:url value="/"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/icone_home.png"/></a>
					<a href="<c:url value="/"/>">Home</a></li>	
				<li>
					<a href="<c:url value="/index/terapeuta"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeFreud.png"/></a>
					<a href="<c:url value="/index/terapeuta"/>">O Terapeuta</a></li>
				<li>
					<a href="<c:url value="/index/psicologia"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconePsicologiaHover.png"/></a>
					<a href="<c:url value="/index/psicologia"/>">Psicologia</a></li>
				<li>
					<a href="<c:url value="/index/educacao"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeEducacaoHover.png"/></a>
					<a href="<c:url value="/index/educacao"/>">Educa&ccedil;&atilde;o</a></li>
				<li>
					<a href="<c:url value="/index/cultura"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeCulturaHover.png"/></a>
					<a href="<c:url value="/index/cultura"/>">Cultura</a></li>
				<li>
					<a href="<c:url value="/index/artesorientais"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeOrientalHover.png"/></a>
					<a href="<c:url value="/index/artesorientais"/>">Artes Orientais</a></li>
				<li>
					<a href="<c:url value="/ame"/>"><img class="imgMenuPrincipal clarear ponteiro" src="${imagem}/logoAme.png"/></a>
					<a href="<c:url value="/ame"/>">Cursos</a></li>
			</ul>
		</td>
	</tr>
</table>
</div>

<!-- javascript desta pagina em index.js -->

<form id="formClienteHome" action="<c:url value="/" />"></form>
<form id="formClienteConstelacao" action="<c:url value="/constelacao/cliente" />" method="get"></form>
<form id="formClienteBlog" action="<c:url value="/blog/cliente" />" method="get"></form>
<form id="formClienteResenhas" action="<c:url value="/resenha/cliente" />" method="get"></form>
<form id="formClienteLinks" action="<c:url value="/link/cliente" />" method="get"></form>
<form id="formClienteCadastro" action="<c:url value="/cliente/cadastro" />" method="get"></form>
<form id="formClienteContato" action="<c:url value="/cliente/contato" />" method="get"></form>
<form id="formClienteLojaVirtual" action="<c:url value="/cliente/loja" />" method="get"></form>
<form id="formClienteAme" action="<c:url value="/ame" />" method="get"></form>

<div align="center" class="nav-total">
	<div class="separador"></div>
	
		<div align="center">
		<div id="menuLink" >
			<label id="btClienteConstelacao" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Constelação</label>
			<label id="btClienteBlog" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Blog</label>
			<label id="btClienteResenhas" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Resenhas</label>
			<label id="btClienteLinks" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Links</label>
			<label id="btClienteCadastro" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Cadastro</label>
			<label id="btClienteContato" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Contato</label>
			<label id="btClienteLojaVirtual" class="btMenuCliente" onclick="javascript: submitFormulario(this)">Loja Virtual</label>
		</div>		
	</div>

</div>

<%-- <form action="<c:url value="/login/autenticacao" />" method="post">
<button type="submit" class="btn btn-success" >Login</button>
</form> --%>

