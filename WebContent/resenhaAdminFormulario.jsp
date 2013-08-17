<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="divIdResenha">				
<h3>C&oacute;digo:</h3>
<input id="resenhaId" type="text" class="areaTitulo bordaPadrao backCinza" name="resenha.id" value="${resenha.id}" readonly="readonly" />
</div>

<h3>T&iacute;tulo :</h3>
<input id="resenhaTitulo" type="text" class="areaTitulo bordaPadrao corAzul" name="resenha.titulo" value="${resenha.titulo}" />

	
<h3>Autor :</h3>
<input id="resenhaAutor" type="text" class="areaTitulo bordaPadrao" name="resenha.autor" value="${resenha.autor}"/>	

<p align="center"><label class="info azulClaro">Alterar o tamanho da fonte do texto de coment&aacute;rio:</label>
	<span id="sizeSmallResenha" style="font-size: small;" class="ponteiro" >A</span>
	<span id="sizeMediumResenha" style="font-size: medium;" class="ponteiro" >A</span>
	<span id="sizeLargeResenha" style="font-size: large;" class="ponteiro" >A</span>
	<span id="sizeXLargeResenha" style="font-size: x-large;" class="ponteiro" >A</span>
	<span id="sizeXxLargeResenha" style="font-size: xx-large;" class="ponteiro" >A</span>
</p>
<h3>Coment&aacute;rio: at&eacute; 2250 caracteres.</h3>				
<textarea id="textoDescricaoResenha" class="areaTexto bordaPadrao" rows="20" name="resenha.descricao">${resenha.descricao}</textarea>		
