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
			<a href="<c:url value="/quiron" />">
			<img id="imagemQuiron" class="direita" width="100px" height="100px" src="${imagem}/quiron.jpg"></img>
			</a>
		</td>	
		</tr>	
	</table>
</div>
</div>

<div align="center" style="width: 100%; padding: 20px; background-color: #FFFFFF; border-bottom: 1px solid #CCCCCC; ">

	<table id="tabRedesSociais" style="width: 1000px;">
		<tr>
			<td width="550px" class="pad10" align="center">
			<span  class="azulClaro">Compartilhe em suas redes sociais preferidas</span>
			</td>
			<td width="150px" align="center">
			<div id="padRedeSocial" class="fb-like" data-href="http://www.alcindomiguel.com.br" data-send="false" data-layout="button_count" data-width="450" data-show-faces="true"></div>
			</td>
			<td width="150px" align="center">
			<div id="padRedeSocial" class="g-plusone" data-size="medium"></div>
			</td>
			<td width="150px" align="center">
			<a id="padRedeSocial" href="https://twitter.com/share" class="twitter-share-button" data-lang="pt">Tweetar</a>
			</td>
		</tr>
	</table>
</div>

<script type="text/javascript">
$(document).ready(function() {
	   
});
</script>