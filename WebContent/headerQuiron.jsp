<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div align="center">
<div id="headerQuiron">

	<table width="1000px">
		<tr>
		<td width="50%" align="center" valign="middle">
			<a href="<c:url value="/login" />">
			<label id="labelQuironForm" class="labelQuiron esquerda ponteiro">Quiron</label>
			</a>
		</td>
		<td width="50%" align="center" valign="middle">
			<a href="<c:url value="/login" />">
			<img id="imagemQuiron" class="direita" width="100px" height="100px" src="${imagem}/quiron.jpg"></img>
			</a>
		</td>	
		</tr>	
	</table>
</div>
</div>
<br/>

<div align="center">
	


	<table id="tabRedesSociais" style="width: 1000px; border: 1px solid #CCCCCC; background-color: #FFFFFF;">
		<tr>
			<td width="151px"><img id="imagemShare" src="${imagem}/imageShare.png"></img></td>
			<td width="849px" valign="middle">
			<div id="divRedesSociais" class="azulClaro">
			compartilhe em suas redes sociais preferidas<br/>
			<a href="https://twitter.com/share" class="twitter-share-button" data-lang="pt">Tweetar</a>
			<div class="fb-like" data-href="http://www.alcindomiguel.com.br" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
			<div class="g-plusone" data-size="medium"></div>
			</div>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
$(document).ready(function() {
	   
});
</script>