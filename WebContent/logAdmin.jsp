<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="">
<table id="tabLogAdm">
<tr align="center">
	<td>
	<form id="formLogout" action="<c:url value="/logout" />"></form>
	<b>Sistema de Administração do Site - Bem Vindo ${sessaoUsuario.usuario.nome}.</b> 
	</td>
	
	<td style="height: 100%">
	<div id="btLogout" class="msgBorderAdm msgLogout ponteiro">Sair</div>
	</td>
</tr>
</table>
</div>
