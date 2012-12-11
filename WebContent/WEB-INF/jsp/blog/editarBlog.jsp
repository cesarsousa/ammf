
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>Blog do Miguel</h2>
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de textos.</span>

<hr class="separador" />

<!-- BUSCA DE TEXTO PELO TITULO -->
<table class="tamanhoDefault">
		<tr>
			<td class="direita">
			<label class="corPrincipal">Pesquisar pelo t&iacute;tulo do texto. </label>
			<input id="campoBuscaTexto" type="text" class="sizebtGenerico areaTitulo3 bordaPadrao" />
			<img id="btIniciarBuscaTexto" alt="Buscar Pessoa" title="Buscar Pessoa" src="${imagem}/lupa.png" class="lupa ponteiro">
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoBuscaTexto" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharBuscaTexto" type="button" class="button direita" value="fechar">
				<label id="labelBuscaTexto">resultado da busca</label>				
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulBuscaTexto">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<hr class="separador"  />

	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoCadastradas" type="button" class="sizebtGenerico button esquerda" value="Visualizar todas as pessoas cadastradas" />
			<span class="info azulClaro" >Lista das pessoas cadastradas no site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasCadastradas" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoCadastradas" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoas">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<hr class="separador"  />
	
	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoConfirmadas" type="button" class="sizebtGenerico backVerde button esquerda" value="Visualizar pessoas confirmadas" />
			<span class="info azulClaro" >Lista das pessoas que recebem notifica&ccedil;&atilde;o de textos do site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasConfirmadas" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoConfirmadas" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoasConfirmadas">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
	
	<hr class="separador"  />
	
	<table class="tamanhoDefault">
		<tr>
			<td >
			<input id="btAbrirConteudoPendentes" type="button" class="sizebtGenerico backVermelho button esquerda" value="Visualizar pessoas pendentes" />
			<span class="info azulClaro" >Lista das pessoas pendente confirma&ccedil;&atilde;o para receber notifica&ccedil;&atilde;o de textos do site.</span>
			</td>
		</tr>
		<tr>
			<td>
			<div id="conteudoPessoasPendentes" class="cartao tamanhoEdicaoIndex" >
			<input id="btFecharConteudoPendentes" type="button" class="button direita" value="fechar">
								
				<table>
					<thead>
						<tr>
						<td class="headTabela">Nome</td>
						<td class="headTabela">Email</td>
						<td class="headTabela">Data Cadastro</td>
						<td class="headTabela">Status</td>
						</tr>
					</thead>
						
					<tbody id="ulPessoasPendentes">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
</div>

<div id="espacadorRodape"></div>
<%@ include file="/footerFixed.jsp" %>
