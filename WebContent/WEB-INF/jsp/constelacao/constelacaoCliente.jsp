<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div class="jumbotron">	
	<%@ include file="/headerSite.jsp" %>
	<%@ include file="/menuPrincipal.jsp" %>
	<div align="center"><h1>Piscoterapia & Constela&ccedil;&atilde;o</h1></div>
</div>

<div class="fundoConstelacao" align="center">

	<div style="color: white;">
		<H2 class="paddingPadrao"><b>Workshop</b></H2>
		
		<div class="tamanhoDefault justificado">		
			<h3 class="paddingPadrao"><b>${sessaoCliente.constelacao.textoInicial}</b></h3>
		
			<br><br>
		
			<div class="fundoConstelacaoInvestimento">
			<h3><b>${sessaoCliente.constelacao.formaPagamento}</b></h3>
			</div>
		
			<br><br>
		
			<h3><b>${sessaoCliente.constelacao.textoFinal}</b></h3>
		
			<br><br>
		
			<div class="fundoConstelacaoData">
			<h3>${sessaoCliente.constelacao.localizacao}</h3>
			</div>
		
			<br><br>
		
			<div align="right">
			<div class="fundoConstelacaoInformacao">
			<h3>${sessaoCliente.constelacao.informacao}</h3>
			</div>
			</div>
		
			<br><br>
		
			<div align="right">
			<div class="fundoConstelacaoDadosTerapeuta">
			<h4>${sessaoCliente.constelacao.dadosPessoais}</h4>
			</div>
			</div>
		
			<br><br>
		
		</div>
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
