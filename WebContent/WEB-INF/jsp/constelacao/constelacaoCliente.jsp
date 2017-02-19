<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<div align="center" class="fundoPadrao"> 
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
<div align="center" class="paddingPadrao"><h1><b>Constela&ccedil;&otilde;es Sist&ecirc;micas</b></h1></div>
</div>

<div id="divConstelacaoNiteroi" class="fundoNiteroiConstelacao" align="center">

<div>
<H2 class="paddingPadrao" style="color: white;"><b>Workshop</b></H2>

<div class="tamanhoDefault justificado">		
			<h3 class="paddingPadrao" style="color: white;"><b>${sessaoCliente.constelacao.textoInicial}</b></h3>
			<br>
			<h3 style="color: white;"><b>${sessaoCliente.constelacao.textoFinal}</b></h3>
			<br>
			
			<table>
			<tr>
			
			<td align="center" width="500">
				<div id="constelacaoNiteroi" class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
				<h1 align="center">${sessaoCliente.constelacao.localEvento}</h1>
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
			<h1 align="center">${sessaoCliente.constelacaoBarra.localEvento}</h1>
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
			</table>
		
			<br>
		
			<div align="right">
			<div class="fundoConstelacaoInformacao" style="color: white;">
			<h3>${sessaoCliente.constelacao.informacao}</h3>
			</div>
			</div>
		
			<br>
		
			<div align="right">
			<div class="fundoConstelacaoDadosTerapeuta" style="color: white;">
			<h4>${sessaoCliente.constelacao.dadosPessoais}</h4>
			</div>
			</div>
		
			<br>
		
		</div>
</div>

	
</div>

</div> <!-- main -->
</div> <!-- wrap -->


<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
