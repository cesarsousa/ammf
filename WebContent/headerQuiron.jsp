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

<%-- <div align="center" style="width: 1000px;">
	
	<label id="labelQuironForm" class="labelQuiron esquerda ponteiro">Quiron</label>	
	<img id="imagemQuiron" class="direita" width="100px" height="100px" src="${imagem}/quiron.jpg"></img>
</div> --%>
</div>
</div>

<!-- <script type="text/javascript">
$(document).ready(function() { 

	$('#labelQuironForm').click(function(){
		$('#quironForm').submit();	
	});
    
});
</script> -->