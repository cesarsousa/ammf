<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center">
<div id="headerQuiron">
<div align="center" style="width: 1000px;">
	<form id="quironForm" action="<c:url value="/login" />" method="get"></form>
	<label id="labelQuironForm" class="labelQuiron esquerda ponteiro">Quiron</label>	
	<div id="imagemQuiron" class="direita"><img width="100px" height="100px" src="${imagem}/quiron.jpg"></img></div>
</div>
</div>
<br/>
</div>
<script type="text/javascript">
$(document).ready(function() { 

	$('#labelQuironForm').click(function(){
		$('#quironForm').submit();	
	});
    
});
</script>