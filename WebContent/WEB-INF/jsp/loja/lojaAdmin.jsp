<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<%-- <div id="divAdmMsgCadCliente">
<c:if test="${not empty nomeEmBranco or not empty emailEmBranco}">
	<div class="msgBorder msgErro ponteiro closeClick">
	${nomeEmBranco}<br/>${emailEmBranco}	
	</div>
</c:if>
</div> --%>

<div id="mensagensPgLojaAdmin">
<c:if test="${not empty msgErroLojaCadastroLivro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		<p><b>Verifique campos obrigat&oacute;rios n&atilde;o preenchidos</b></p>
		${autorEmBranco}${tituloEmBranco}${paginaEmBranco}${edicaoEmBranco}${anoEmBranco}
	</div>
</c:if>
<c:if test="${not empty msgErroLojaAdm}">
	<div class="msgBorder msgErro ponteiro closeClick">${msgErroLojaAdm}</div>
</c:if>

<c:if test="${not empty msgLojaAdm}">
	<div class="msgBorder msgSucesso ponteiro closeClick">${msgLojaAdm}</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgAdmCadastroCliente" align="center">

<h2>LOJA VIRTUAL - Administra&ccedil;&atilde;o</h2>
<p>
<span class="info azulClaro">Gerenciamento da loja virtual</span>
</p>

<div align="center" class="divMenuOpcao">
<table class="menuOpcao">
<tr>
<td>
<ul class="itemMenuOpcao">
	<li class="itemMenuPrincipal">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div id="btMenuAdm" title="menu principal" class="ponteiro esquerda"></div>
		</form>
	</li>
	<li>
		<img id="iconOpcaoLivro" alt="livros" title="livros" src="${imagem}/iconeLivro.png" class="icone50 ponteiro esquerda">
	</li>
	<%-- <li>
		<img id="iconAddPessoa" alt="cadatrar pessoa" title="cadatrar pessoa" src="${imagem}/iconeAddPessoaHover.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasCadastradas" alt="ver todas as pessoas" title="ver todas as pessoas" src="${imagem}/usuario_cinza.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasConfirmadas" alt="zer pessoas confirmadas" title="ver pessoas confirmadas" src="${imagem}/usuario_verde.png" width="50" height="50" class="ponteiro esquerda">
	</li>
	<li>
		<img id="iconPessoasPendentes" alt="zer pessoas pendentes" title="ver pessoas pendentes" src="${imagem}/usuario_vermelho.png" width="50" height="50" class="ponteiro esquerda">
	</li> --%>	
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div style="width: 100%">

<table id="tabIconesLivros" style="padding: 10px;">	
	<tr>
		<td>
		<img id="fecharTabIconesLivros" alt="fechar livros" title="fechar livros" src="${imagem}/iconeCulturaHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="abrirAddLivro" alt="adicionar livro" title="adicionar livro" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="abrirBuscarEditarLivro" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeEditarHover.png" class="icone50 ponteiro esquerda">
		</td>
		<td>
		<img id="" alt="listar todos os livros" title="listar todos os livros" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
		</td>
	</tr>
</table>

<!-- CONSULTAR LIVROS -->
<table id="tabBuscaLivro" class="cardViewText superFooter bordaLateral">	
	<tr>
		<td>
		<div align="right">
		<input id="btFecharBuscaLivro" type="button" value="fechar" class="backVermelho button">
		</div>
		<img alt="left" src="${imagem}/iconeEditarHover.png" class="icone50 esquerda">
		<h2 align="center">Buscar e editar livro</h2>
		</td>
	</tr>
	<tr>		
		<td style="padding: 10px;">
		<form id="formBuscaLivro">
		<input id="campoBuscaLivro" type="text" class="fundoLupa areaTitulo3 bordaPadrao"/>
		</form>
		<p>
		<label id="labelResultadoConsultaLivro"></label>		
		</p>			
		</td>		
	</tr>
	<tr>
		<td>
		<div id="conteudoConsultaLivros" class="cartao">								
			<table>
				<thead>
					<tr>
					<td class="headTabela">C&oacute;digo</td>
					<td class="headTabela">Nome</td>
					<td class="headTabela">Email</td>
					<td class="headTabela">Data Cadastro</td>
					<td class="headTabela">Status</td>
					<td class="headTabela">Situa&ccedil;&atilde;o</td>
					<td class="w50 headTabela">A&ccedil;&atilde;o</td>
					</tr>
				</thead>
					
				<tbody id="ulLivrosConsultados">						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>

<br/>

<!-- CADASTRAR LIVRO -->
<input id="flagCadastroLivroVazio" type="hidden" value="${flagCadastroLivroVazio}"  /> 
<table id="tabCadastrarLivro" class="cardViewText superFooter bordaLateral">
<tr>
	<td>
	<div align="right">
		<input id="btFecharCadastrarLivro" type="button" value="fechar" class="backVermelho button">
	</div>	
	<img align="left" src="${imagem}/iconeAddHover.png" width="50" height="50" class="esquerda">
	<h2 align="center">Cadastrar Livro</h2>
	</td>
</tr>

<tr align="center">
<td>
	<p>
		<span class="info azulClaro">Entre com os dados referente ao cadastrado do novo livro.</span>
	</p>	
	
	<form action="<c:url value="/livro/cadastrar"/>" method="post">	 
		
		<div class="cartao campoObrigatorio">		
			<label class="labelForm" style="color: #8B0000">Campos de preenchimento obrigat&oacute;rio</label>
			<br/>
			<div class="paddingPadrao">
			<label class="labelForm">Autor</label>
			<input id="livroAutor" type="text" name="livro.autor" value="${livroCadastro.autor}" class="letraCinza largura100 altura30 bordaPadrao${comErroAutor}" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">				
			<label class="labelForm">T&iacute;tulo</label>
			<input id="livroTitulo" type="text" name="livro.titulo" value="${livroCadastro.titulo}" class="letraCinza largura100 altura30 bordaPadrao${comErroTitulo}" maxlength="100"/>
			</div>
		
			<div class="paddingPadrao">
			<label class="labelForm">N&uacute;mero de p&aacute;ginas</label>
			<br/>
			<input id="livroPaginas" type="text" name="livro.paginas" value="${livroCadastro.paginas}" class="letraCinza largura100 altura30 bordaPadrao${comErroPagina}" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Edi&ccedil;&atilde;o</label>
			<br/>
			<input id="livroEdicao" type="text" name="livro.edicao" value="${livroCadastro.edicao}"  class="letraCinza largura100 altura30 bordaPadrao${comErroEdicao}" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Ano</label>
			<br/>
			<input id="livroAno" type="text" name="livro.ano" value="${livroCadastro.ano}" class="letraCinza largura100 altura30 bordaPadrao${comErroAno}" maxlength="100"/>
			</div>
				
		</div>
		
		<br/><br/>
		
		<div class="campoOpcional">
			
			<hr style="width: 90%; border: 1px dashed #CCCCCC;" >
			
			<p>
				<span class="info azulClaro">
					Os campos abaixo s&atilde;o de preenchimento opcional utilizado para exibir informa&ccedil;&atilde;o adicional para os us&uacute;arios do site.<br/>
					Quanto mais campo for deixado em branco menos informa&ccedil;&atilde;o sobre o livro estar&aacute; dispon&iacute;vel e menos atrativa poder&aacute; se tornar a oferta.
				</span>
			</p>
			
			<div class="paddingPadrao">
			<div class="msgBorderInterno msgAlerta">
			<b>Pre&ccedil;o:... </b> Deixar o pre&ccedil;o em branco implica em disponibiliar o produto com valor de R$ 0,00.
			</div>			
			<label class="labelForm">Pre&ccedil;o</label>
			<br/>
			<input id="livroPreco" type="text" name="livro.preco" value="${livroCadastro.precoFormatado}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Subt&iacute;tulo: <span class="info azulClaro">ex. volume 1, parte 1, ...</span></label>
			<br/>
			
			<input id="livroSubtitulo" type="text" name="livro.subtitulo" value="${livroCadastro.subtitulo}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Sinopse</label>
			<br/>
			<textarea id="livroSinopse" name="livro.sinopse" class="letraCinza largura90 bordaPadrao" rows="5">${livroCadastro.sinopse}</textarea>
			<span class="info azulClaro">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterLivro">1000</span> caracteres.</span>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Editora</label>
			<br/>
			<input id="livroEditora" type="text" name="livro.editora" value="${livroCadastro.editora}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>			
			
			<div class="paddingPadrao">
			<label class="labelForm">ISBN</label>
			<br/>
			<input id="livroIsbn" type="text" name="livro.isbn" value="${livroCadastro.isbn}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>			
			
			<div class="paddingPadrao">
			<label class="labelForm">Assunto</label>
			<br/>
			<input id="livroAssunto" type="text" name="livro.assunto" value="${livroCadastro.assunto}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Idioma</label>
			<br/>
			<input id="livroIdioma" type="text" name="livro.idioma" value="${livroCadastro.idioma}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">C&oacute;digo de barras</label>
			<br/>
			<input id="livroCodigoBarra" type="text" name="livro.codigoBarra" value="${livroCadastro.codigoBarra}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
			
			<div class="paddingPadrao">
			<label class="labelForm">Link de venda</label>
			<br/>
			<input id="livroLinkVenda" type="text" name="livro.linkVenda" value="${livroCadastro.linkVenda}" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100"/>
			</div>
					
			<div class="paddingPadrao">
			<input id="btnCadastrarPessoa" type="submit" value="Cadastrar"  class="button direita tamanhoPadrao"/>
			</div>
		</div>
		
		
		
			
	</form>
</td>
</tr>
</table>

<br/>

<form id="formListarPessoasCadastradas" action="<c:url value="/pessoa/listar" />" method="get"></form>
<form id="formListarPessoasConfirmadas" action="<c:url value="/pessoa/confirmadas" />" method="get"></form>
<form id="formListarPessoasPendentes" action="<c:url value="/pessoa/pendentes" />" method="get"></form>

<!--  LIVROS SOLICITADOS -->
<c:if test="${visualizarLivros}">
<table id="tabLivrosSolicitadas" class="superFooter bordaLateral">
	<tr>
		<td>
		<div align="right">
			<input id="btFecharLivrosSolicitadas" type="button" value="fechar" class="backVermelho button">
		</div>
		
		<c:if test="${isPessoasCadastradas}">
			<img src="${imagem}/usuario_cinza.png" width="50" height="50" class="esquerda">
		</c:if>
		<c:if test="${isPessoasConfirmadas}">
			<img src="${imagem}/usuario_verde.png" width="50" height="50" class="esquerda">
		</c:if>
		<c:if test="${isPessoasPendentes}">
			<img src="${imagem}/usuario_vermelho.png" width="50" height="50" class="esquerda">
		</c:if>	
		
		<span class="titulo ${cssCorFonte}">${tituloPessoasSolicitadas}</span>
		
		</td>
	</tr>	
	<tr>
		<td>
		<div id="conteudoLivrosSolicitadas">
			<table class="display dataTable cardViewText superFooter bordaLateral" >				
				<thead>
					<tr>
					<th class="metadado" style="width: 90px;">C&oacute;digo</th>
					<th class="metadado">Nome</th>
					<th class="metadado">Email</th>
					<th class="metadado">Data Cadastro</th>
					<th class="metadado">Status</th>
					<th class="metadado">Situa&ccedil;&atilde;o</th>
					<th class="metadado">A&ccedil;&otilde;es</th>
					</tr>
				</thead>					
				<tbody>
					<c:forEach items="${pessoasSolicitadas}" var="pessoa">
						<tr class="zebrado">
							<td class="infoTabela" style="width: 90px;">${pessoa.id}</td>
							<td class="infoTabela">${pessoa.nome}</td>
							<td class="infoTabela">${pessoa.email}</td>
							<td class="infoTabela">${pessoa.dataFormatada}</td>
							<td class="infoTabela ${pessoa.status}">${pessoa.status}</td>
							<td class="infoTabela">${pessoa.situacao}</td>
							<td>
								<c:if test="${pessoa.inativa}">							
									<a href="<c:url value="/pessoa/notificar/${pessoa.uuid}" />">
										<img id="btNotificarPessoa" src="${imagem}/iconeNotificacao.png" class="icone20 ponteiro" alt="reenviar notificacao" title="reenviar notificacao">
									</a>
								</c:if>
																
								<c:if test="${pessoa.pendente}">
									<a href="<c:url value="/pessoa/confirmar/${pessoa.uuid}" />">
										<img id="btConfirmarPessoa" src="${imagem}/icone_confirmar.png" class="icone20 ponteiro" alt="confirmar esta pessoa" title="confirmar esta pessoa">
									</a>
								</c:if>
								
								<a href="<c:url value="/pessoa/remover/${pessoa.uuid}" />">
									<img src="${imagem}/icone_excluir.png" onclick="return confirmarExclusao()" class="icone20 ponteiro" alt="excluir esta pessoa" title="excluir esta pessoa">
								</a>								
							</td>
						</tr>
					</c:forEach>						
				</tbody>
				
			</table>				
		</div>
		</td>
	</tr>	
</table>
</c:if>

</div>
</div> <!-- centralizacao -->

<div id="telaAguardeAdmCadastroLivro">
	<div align="center">
		
		<h2>Cadastro de Livro</h2>    
		<span class="info azulClaro" >Cadastro de livro. </span>
								
		<h3 class="paddingTelaAguarde">cadastrando livro.</h3>
		
		<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
		<br />
		<br />			
	</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
