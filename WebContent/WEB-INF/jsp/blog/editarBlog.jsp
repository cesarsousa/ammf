
<%@ include file="/headerLib.jsp" %>
<!-- <div class="paddingHeader"></div> -->
<%@ include file="/headerSite.jsp" %>

<div align="center">

<h2>Blog do Miguel</h2>
<span class="info azulClaro" >Cadastro, atualiza&ccedil;&atilde;o e remo&ccedil;&atilde;o de textos.</span>

<c:if test="${not empty blogMensagemSucesso}">
<table class="tamanhoDefault">
	<tr>
	<td>
	<div class="msgBorder msgSucesso">
		${blogMensagemSucesso} 
	</div>
</td>
</tr>
</table>
<div id="separador"></div>
</c:if>

<table class="tamanhoDefault">
	<tr>
	<td class="tdTableIcone">
	<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
	<img id="btMenuAdm" alt="Menu Principal" title="Menu Principal" src="${imagem}/icone_menu.png" width="50" height="50" class="ponteiro esquerda">
	</form>
	</td>
	
	<td class="tdTableIcone">
	<img id="btAddTextoBlog" alt="Adicionar novo texto" title="Adicionar novo texto" src="${imagem}/icone_add.png" width="50" height="50" class="ponteiro esquerda">
	</td>
	
	<td class="tdTableIcone">
	<img id="btEdtTextoBlog" alt="Editar um texto" title="Editar um texto" src="${imagem}/icone_editar.png" width="50" height="50" class="ponteiro esquerda">
	</td>
	
	</tr>
</table>

<!-- ADICIONAR UM NOVO TEXTO -->
<div id="divBlogNovoTexto">
	<hr class="separador" />
	
	<table class="tamanhoDefault">
		<tr>
			<td>
			<div class="cartao tamanhoEdicaoIndex" >
			<form id="formBlogNovoTexto" action="<c:url value="/blog/novo"/>" method="post" class="paddingPadrao">				
								
				<h3>T&iacute;tulo :</h3>
				<input id="blogTituloNovoTexto" type="text" class="areaTitulo bordaPadrao corAzul" name="texto.titulo" />
					
				<h3>Autor :</h3>
				<input id="blogAutorNovoTexto" type="text" class="areaTitulo bordaPadrao" name="texto.autor" value="Alcindo Miguel Martins Filho"/>	
								
				<h3>Texto:</h3>
				<div class="tamanhoDefault">
				<div class="areaFormatacao">					
						<div class="esquerda">						
						<span id="sizeSmallIndex" style="font-size: small;" class="ponteiro" >A</span>
						<span id="sizeMediumIndex" style="font-size: medium;" class="ponteiro" >A</span>
						<span id="sizeLargeIndex" style="font-size: large;" class="ponteiro" >A</span>
						<span id="sizeXLargeIndex" style="font-size: x-large;" class="ponteiro" >A</span>
						<span id="sizeXxLargeIndex" style="font-size: xx-large;" class="ponteiro" >A</span>
					</div>	
				</div>
				</div>
				<textarea id="blogConteudoNovoTexto" class="areaTexto bordaPadrao" rows="20" name="texto.conteudo"></textarea>		
				
				<p>
				<input type="submit" value="cadastrar" class="buttonCadastrar">
				<input id="btBlogCancelNovoTexto" type="button" value="cancelar" class="button">				
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>
</div>

<!-- Editar um texto cadastrado -->


<!-- BUSCA DE TEXTO PELO TITULO -->
<div id="divBlogNovoTexto">
	<hr class="separador" />
	<table width="100%">
		<tr>
			<td class="esquerda">
			<label class="corPrincipal">T&iacute;tulo do texto. </label>
			<form id="formBlogEdtTexto">
			<input id="campoBuscaTxtEdtBlog" type="text" class="fundoLupa sizebtGenerico areaTitulo3 bordaPadrao" />
			</form>
			</td>
		</tr>
		<tr>
			<td>
			<div id="resultBuscaTxtBlog" class="cartao" >
			<!-- <input id="btFecharBuscaTexto" type="button" class="button direita" value="fechar"> -->
				<label id="labelBuscaTexto">resultado da busca</label>				
				<table width="100%">
					<thead>
						<tr>						
						<td class="headTabelaBlog2">data da postagem</td>
						<td class="headTabelaBlog1">t&iacute;tulo</td>
						<td class="headTabelaBlog1">Conte&uacute;do</td>						
						</tr>
					</thead>
						
					<tbody id="tabEdtTextoBlog">						
					</tbody>
					
				</table>				
			</div>
			</td>
		</tr>
	</table>
</div>
	
	<!-- <hr class="separador"  />

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
	</table> -->
	
</div> <!-- div center -->

<div id="espacadorRodape"></div>
<%@ include file="/footerFixed.jsp" %>
