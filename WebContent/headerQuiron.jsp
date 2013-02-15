<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<form id="quironForm" action="<c:url value="/login" />" method="get"></form>

<div align="center">
<div id="headerQuiron">

	<table width="100%">
	<tr>
	<td width="50%" align="center" valign="middle">
		<label id="labelQuironForm" class="labelQuiron esquerda ponteiro">Quiron</label>
	</td>
	<td width="50%" align="center" valign="middle">
		<img id="imagemQuiron" class="direita" width="100px" height="100px" src="${imagem}/quiron.jpg"></img>
	</td>	
	</tr>
	
	</table>

<%-- <div align="center" style="width: 1000px;">
	
	<label id="labelQuironForm" class="labelQuiron esquerda ponteiro">Quiron</label>	
	<img id="imagemQuiron" class="direita" width="100px" height="100px" src="${imagem}/quiron.jpg"></img>
</div> --%>
</div>
</div>
<br/>
<script type="text/javascript">
$(document).ready(function() { 

	$('#labelQuironForm').click(function(){
		$('#quironForm').submit();	
	});
    
});
</script>