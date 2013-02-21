<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<table width="100%">
<tr>
	<td>
	<div class="msgBorder msgInfo">
	ADMINISTRADOR - Voc&ecirc; est&aacute; logado como ${sessaoUsuario.usuario.nome} (${sessaoUsuario.usuario.email}). 
	</div>
	</td>
	
	<td>
	<div id="btLogout" class="msgBorder msgLogout ponteiro">Sair</div>
	</td>

</tr>
</table>
<form id="formLogout" action="<c:url value="/logout" />"></form>