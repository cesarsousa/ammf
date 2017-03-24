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

			<!-- <div class="fundoNiteroiConstelacao"> -->
			<div class="tamanhoDefault justificado">
			<h3 style="color: black;"><b>${sessaoCliente.constelacao.textoFinal}</b></h3>
			</div>
			<!-- </div> -->
			
			<div class="jumbotron">
			
			<table>
			<thead>
			<tr><td colspan="2"><h3 align="center">Clique na imagem para visualizar o local e data do evento.</h3></td></tr>
			
			<tbody>
			<tr>
			
			<td align="center" width="500">
				<div id="constelacaoNiteroi" style="vertical-align: middle;" class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
				<p class="textoFotoConstelacao" align="center">${sessaoCliente.constelacao.localEvento}</p>
				<p class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacao.dataFormatada}</p>
				</div>			
				  <!-- Modal -->
				  <div class="modal fade" id="modalConstelacaoNiteroi" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h4 class="modal-title">${sessaoCliente.constelacao.data}</h4>
				        </div>
				        <div class="modal-body">
				          	<div class="fundoConstelacaoData" style="color: white;">
								<p>${sessaoCliente.constelacao.localizacao}</p>
								<h3>Investimento:</h3>
								<b>${sessaoCliente.constelacao.formaPagamento}</b>
				            </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
				        </div>
				      </div>      
				    </div>
				  </div>
				  </div>
			</td>
			
			<td align="center" width="500">
			<div id="constelacaoBarra" class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoBarra">
			<p class="textoFotoConstelacao" align="center">${sessaoCliente.constelacaoBarra.localEvento}</p>
			<p class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacaoBarra.dataFormatada}</p>
			</div>
				<!-- Modal -->
				  <div class="modal fade" id="modalConstelacaoBarra" role="dialog">
				    <div class="modal-dialog">
				    
				      <!-- Modal content-->
				      <div class="modal-content">
				        <div class="modal-header">
				          <h4 class="modal-title">${sessaoCliente.constelacaoBarra.data}</h4>
				        </div>
				        <div class="modal-body">
				          	<div class="fundoConstelacaoData" style="color: white;">
								<p>${sessaoCliente.constelacaoBarra.localizacao}</p>
								<h3>Investimento:</h3>
								<b>${sessaoCliente.constelacaoBarra.formaPagamento}</b>
				            </div>
				        <div class="modal-footer">
				          <button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
				        </div>
				      </div>      
				    </div>
				  </div>
				  </div>
			
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
			<div class="fundoConstelacaoDadosTerapeuta" style="color: black;">
			<h4>${sessaoCliente.constelacao.dadosPessoais}</h4>
			</div>
			</div>
			</div>
			<br>
</div>


</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
