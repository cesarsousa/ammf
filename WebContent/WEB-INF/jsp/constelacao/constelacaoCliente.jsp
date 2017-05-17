<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div align="center" class="fundoPadrao"> 
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
</div>

<div id="divConstelacaoNiteroi" align="center">





<div class="jumbotron">
  <h1>Constelações Sistêmicas</h1>
  <h2>Workshop</h2>
  <h3 class="paddingPadrao tamanhoDefault justificado"><b>${sessaoCliente.constelacao.textoInicial}</b></h3>
  <iframe width="560" height="315" src="https://www.youtube.com/embed/a-iUNpnUv-c" frameborder="0" allowfullscreen></iframe>
</div>

			<div class="fundoNiteroiConstelacao">
			<div class="tamanhoDefault justificado paddingPadrao">
			<h3 style="color: black;"><b>${sessaoCliente.constelacao.textoFinal}</b></h3>
			</div>
			</div>
			
			<div class="jumbotron">
			
			<table>
			<thead>
			<tr><td colspan="2"><h3 align="center">Clique na imagem para visualizar o local e data do evento.</h3></td></tr>
			
			<tbody>
			<tr>			
				<td align="center" width="400" class="ponteiro paddingPadrao"> 
					<img src="${imagem}/praia-de-icarai-niteroi.jpg" alt="Constelação em Niterói" class="img-circle destaqueFoto" width="300px" height="300px" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
				</td>
			
				<td align="center" width="600" class="ponteiro paddingPadrao">
					<div class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
					<h1 class="textoFotoConstelacao" align="center">${sessaoCliente.constelacao.localEvento}</h1>
					<h3 class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacao.dataFormatada}</h3>
					</div>			
				</td>			
			</tr>			
			<tr>
			
				<td align="center" width="600" class="ponteiro paddingPadrao">
					<div class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoBarra">
					<h1 class="textoFotoConstelacao" align="center">${sessaoCliente.constelacaoBarra.localEvento}</h1>
					<h3 class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacaoBarra.dataFormatada}</h3>
					</div>
				</td>
			
				<td align="center" width="400" class="ponteiro paddingPadrao">
				<img src="${imagem}/brra-da-tijuca.jpg" alt="Constelação na Barra" class="img-circle destaqueFoto" width="300px" height="300px" data-toggle="modal" data-target="#modalConstelacaoBarra">
				</td>			
			</tr>			
			</tbody>
			</table>
			
			</div>
		
			<div class="tamanhoDefault justificado">
			<div align="center">
			<h3>${sessaoCliente.constelacao.informacao}</h3>
			</div>
		
			<br>
		
			<div align="right">	
			<table class="fundoConstelacaoDadosTerapeuta" style="color: black;">
			<tr>
			<td>
			<div align="center" class="paddingPadrao">
			<img src="${imagem}/owner2.jpg" alt="Alcindo Miguel Martins Filho" class="img-circle destaqueFoto" width="250px" height="250px">		
			</div>
			</td>
			<td>
			<h4>${sessaoCliente.constelacao.dadosPessoais}</h4>
			</td>
			</tr>
			</table>		
			<div >			
			
			</div>
			</div>
			</div>
			<br>
</div>

<!-- Modal -->
<div class="modal fade" id="modalConstelacaoNiteroi" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<%-- <div class="modal-header">
				<h4 class="modal-title">${sessaoCliente.constelacao.data}</h4>
			</div> --%>
			<div class="modal-body">
				<div class="fundoConstelacaoData" style="color: white;">
					<h4 class="modal-title">${sessaoCliente.constelacao.data}</h4>
					<p>${sessaoCliente.constelacao.localizacao}</p>
					<h3>Investimento:</h3>
					<b>${sessaoCliente.constelacao.formaPagamento}</b>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
				</div> -->
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="modalConstelacaoBarra" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<%-- <div class="modal-header">
				<h4 class="modal-title">${sessaoCliente.constelacaoBarra.data}</h4>
			</div> --%>
			<div class="modal-body">
				<div class="fundoConstelacaoData" style="color: white;">
					<h4 class="modal-title">${sessaoCliente.constelacaoBarra.data}</h4>
					<p>${sessaoCliente.constelacaoBarra.localizacao}</p>
					<h3>Investimento:</h3>
					<b>${sessaoCliente.constelacaoBarra.formaPagamento}</b>
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
				</div> -->
			</div>
		</div>
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
