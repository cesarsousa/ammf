<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp"%>
<%@ include file="/headerQuiron.jsp"%>

<div align="center" class="fundoPadrao">
	<%@ include file="/headerSite.jsp"%>
	<%@ include file="/menuPrincipal.jsp"%>
</div>

<div id="divConstelacaoNiteroi" align="center">

	<div class="jumbotron">
		<h1>Constelações Sistêmicas</h1>
		<h2>Workshop</h2>
		<h3 class="paddingPadrao tamanhoDefault justificado">
			<b>${sessaoCliente.constelacao.textoInicial}</b>
		</h3>
		<iframe width="560" height="315"
			src="https://www.youtube.com/embed/a-iUNpnUv-c" frameborder="0"
			allowfullscreen></iframe>
	</div>

	<div class="fundoNiteroiConstelacao">
		<div class="tamanhoDefault justificado paddingPadrao">
			<h3 style="color: black;">
				<b>${sessaoCliente.constelacao.textoFinal}</b>
			</h3>
		</div>
	</div>

	<div class="jumbotron">

		<table>
			<thead>
				<tr>
					<td colspan="2"><h3 align="center">Clique na imagem para visualizar o local e data do evento.</h3></td>
				</tr>
			<tbody>
				<tr>
					<td align="center" width="400" class="ponteiro paddingPadrao">
						<img src="${imagem}/praia-de-icarai-niteroi.jpg" alt="Constelação em Niterói" class="img-circle destaqueFoto" width="300px" height="300px" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
					</td>

					<td align="center" width="600" class="ponteiro paddingPadrao">
						<div class="ponteiro" data-toggle="modal" data-target="#modalConstelacaoNiteroi">
							<h1 class="textoFotoConstelacao" align="center">${sessaoCliente.constelacao.localEvento}</h1>
							<h3 class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacao.dataFormatada}</h3>
							<h4 class="texto2FotoConstelacao" align="center">${sessaoCliente.constelacao.localizacaoSimples}</h4>
							<h2>Investimento:</h2>
							<h3>${sessaoCliente.constelacao.formaPagamentoSimples}</h3>
						</div>
					</td>					
				</tr>
				<tr>
					<td align="center" colspan="2">
					<div class="separador"></div>
						<h2>Calendário 2026</h2>
						
						<div align="center">
						<table border="1" style="width:60%">
						<tr>
							<td style="padding: 2px; width: 25%" >
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Janeiro</div>
							<div align="center" style="font-size: xx-large;">10</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Fevereiro</div>
							<div align="center" style="font-size: xx-large;">8</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Março</div>
							<div align="center" style="font-size: xx-large;">8</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Abril</div>
							<div align="center" style="font-size: xx-large;">12</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>							
						</tr>
						</table>
						
						<table border="1" style="width:60%">
						<tr>
							<td style="padding: 2px; width: 25%" >
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Maio</div>
							<div align="center" style="font-size: xx-large;">17</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Junho</div>
							<div align="center" style="font-size: xx-large;">14</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Julho</div>
							<div align="center" style="font-size: xx-large;">12</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Agosto</div>
							<div align="center" style="font-size: xx-large;">16</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>							
						</tr>
						</table>
						
						<table border="1" style="width:60%">
						<tr>
							<td style="padding: 2px; width: 25%" >
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Setembro</div>
							<div align="center" style="font-size: xx-large;">13</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Outubro</div>
							<div align="center" style="font-size: xx-large;">3</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Novembro</div>
							<div align="center" style="font-size: xx-large;">8</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>
							
							<td style="padding: 2px; width: 25%">
							<div align="center" style="padding: 2px; background-color: black; color: white; font-size: medium;">Dezembro</div>
							<div align="center" style="font-size: xx-large;">6</div>
							<div align="center" style="font-size: small;">domingo</div>
							</td>							
						</tr>
						
						</table>
						</div>
						
					</td>
				</tr>
			</tbody>
		</table>

	</div>

	<div class="tamanhoDefault justificado">
		<div align="center">
			<h2>${sessaoCliente.constelacao.informacao}</h2>
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
			<div></div>
		</div>
	</div>
	<br>
</div>

<!-- Modal -->
<div class="modal fade" id="modalConstelacaoNiteroi" role="dialog">
	<div class="modal-dialog modal-lg">

		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-body">
				<div class="fundoConstelacaoData" style="color: white;">
					<h4 class="modal-title">${sessaoCliente.constelacao.data}</h4>
					<p>${sessaoCliente.constelacao.localizacao}</p>
					<p>
					<iframe 
						src="${sessaoCliente.constelacao.localMapa}"
						width="600" 
						height="400" 
						frameborder="0"
						style="border:0"
						allowfullscreen></iframe>
					</p>
					<h3>Investimento:</h3>
					<b>${sessaoCliente.constelacao.formaPagamento}</b>
				</div>
			</div>
		</div>
	</div>
</div>

</div>
<!-- main -->
</div>
<!-- wrap -->


<div id="footer">
	<%@ include file="/footer.jsp"%>
</div>
