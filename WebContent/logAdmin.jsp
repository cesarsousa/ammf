<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<div class="alert alert-info" align="center">
<div class="paddingDuplo">
	<b>Sistema de Administração - Bem Vindo ${sessaoUsuario.usuario.nome}.</b>
	
	<div class="direita">
		<form id="formLogout" action="<c:url value="/logout" />">
			<button type="submit" class="btn btn-danger">Sair</button>
		</form>
	</div>
</div> 
</div>
