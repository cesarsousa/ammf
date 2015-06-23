<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="msgInfo">
<table id="tabLogAdm">
<tr align="center">
	<td>
	<form id="formLogout" action="<c:url value="/logout" />"></form>
	<form id="formLogout" action="<c:url value="/logout" />"></form>
	ADMINISTRADOR - Voc&ecirc; est&aacute; logado como ${sessaoUsuario.usuario.nome} (${sessaoUsuario.usuario.email}). 
	</td>
	
	<td style="height: 100%">
	<div id="btLogout" class="msgBorderAdm msgLogout ponteiro">Sair</div>
	</td>
</tr>
</table>
</div>
