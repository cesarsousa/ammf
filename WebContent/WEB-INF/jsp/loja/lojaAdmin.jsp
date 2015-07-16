<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div id="mensagensPgLojaAdmin" align="center">
<c:if test="${not empty msgErroLojaCadastroLivro}">
	<div class="msgBorder msgErro ponteiro closeClick">
		<p><b>Verifique campos obrigat&oacute;rios n&atilde;o preenchidos</b></p>
		${autorEmBranco}${tituloEmBranco}${subtituloEmBranco}${paginaEmBranco}${edicaoEmBranco}${anoEmBranco}${precoEmBranco}${fotoInvalida}${linkEmBranco}
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

<div id="divPgAdmCadastroCliente" align="center" class="paddingPadrao">

<h2>LOJA VIRTUAL</h2>
<h3>Livros</h3>

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
	<%-- <li>
		<img id="iconOpcaoLivro" alt="livros" title="livros" src="${imagem}/iconeLivro.png" class="icone50 ponteiro esquerda">
	</li> --%>
	
	<li>
		<table> <!-- id="tabIconesLivros" -->	
		<tr>
			<%-- <td>
			<img id="fecharTabIconesLivros" alt="fechar livros" title="fechar livros" src="${imagem}/iconeCulturaHover.png" class="icone50 ponteiro esquerda">
			</td> --%>
			<td>
			<img id="abrirAddLivro" alt="adicionar livro" title="adicionar livro" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
			</td>
			<td>
			<img id="abrirBuscarEditarLivro" alt="buscar e editar" title="buscar e editar" src="${imagem}/iconeBuscar.png" class="icone50 ponteiro esquerda">
			</td>
			<td>
			<a href="<c:url value="/livro/adm/listar"/>"> 
			<img alt="listar todos os livros" title="listar todos os livros" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
			</a>
			</td>
		</tr>
		</table>
	</li>
</ul>
</td>
</tr>
</table>
</div>

<div class="separador"></div>

<div style="width: 100%">

<!-- BUSCAR LIVROS -->
<input id="flagBuscarLivro" type="hidden" value="${flagBuscarLivro}"  />
<table id="tabBuscaLivro" class="cardViewText">	
	
	<tr>		
		<td style="padding: 10px;">
		<form id="formBuscaLivro" action="<c:url value="/livro/adm/busca" />" method="get">
			<div align="center">
			<input id="campoBuscaLivro" type="text" name="param" class="form-control" placeholder="Buscar por nome de autor ou título..."/>
			<br>
			<input type="submit" class="btn btn-success" value="Pesquisar">
			<input id="btFecharBuscaLivro" type="button" value="fechar" class="btn btn-danger">
			
			</div>
		</form>
		
		<c:if test="${not empty buscaSemResultado}">
		<div align="center">		
		<span class="info"><b>${buscaSemResultado}</b></span>
		</div>
		</c:if>
						
		</td>		
	</tr>		
</table>

<!-- CADASTRAR LIVRO -->
<input id="flagCadastroLivroVazio" type="hidden" value="${flagCadastroLivroVazio}"/> 
<table id="tabCadastrarLivro" class="cardViewText">
	<tr>
		<td>
		<div align="right">
			<input id="btFecharCadastrarLivro" type="button" value="fechar" class="btn btn-danger">
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
		
		<form id="formCadLivro" action="<c:url value="/livro/adm/cadastrar"/>" enctype="multipart/form-data" method="post">
			
			<div class="campoObrigatorio">
			
				<div class="alert alert-warning" align="center">
					<b>Campos de preenchimento obrigat&oacute;rio</b>
				</div>
					
				<label class="labelForm" style="text-align: center; color: #8B0000,"></label>
				<br/>
				<div class="paddingPadrao">
				<label class="labelForm">Autor: no caso de livro propriet&aacute;rio utilize o nome completo<br/>Alcindo Miguel Martins Filho.</label>
				<input id="livroAutor" type="text" name="livro.autor" value="${livroCadastro.autor}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">				
				<label class="labelForm">T&iacute;tulo</label>
				<input id="livroTitulo" type="text" name="livro.titulo" value="${livroCadastro.titulo}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">Subt&iacute;tulo: ex. volume 1, parte 1, ...</label>
				<br/>
				
				<input id="livroSubtitulo" type="text" name="livro.subtitulo" value="${livroCadastro.subtitulo}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">				
				<label class="labelForm">Categoria <span id="btCadastrarCategoria" class="info azulClaro ponteiro">Cadastrar uma nova categoria?</span></label>
					
					<div id="divCadastrarCategoria">				
						<div class="alert alert-info">
						    <div class="input-group">
						      <input id="inputCadastrarCategoria" type="text" class="form-control" maxlength="100" placeholder="Digite a categoria">
						      <span class="input-group-btn">
						        <button id="ajaxCadastrarCategoria" class="btn btn-success" type="button">Cadastrar Categoria</button>
						      </span>
						    </div>
						 </div>				
						<img id="iconeAguardeCadastrarCategoria" src="${imagem}/gif_aguarde.gif" width="100" height="100">				
					</div>	
				
				<select id="comboBoxCategoriasLivro" name="livro.categoria.id" class="form-control"></select>
				</div>
				
			
				<div class="paddingPadrao">
				<label class="labelForm">N&uacute;mero de p&aacute;ginas</label>
				<br/>
				<input id="livroPaginas" type="text" name="livro.paginas" value="${livroCadastro.paginas}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">Edi&ccedil;&atilde;o</label>
				<br/>
				<input id="livroEdicao" type="text" name="livro.edicao" value="${livroCadastro.edicao}"  class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">Ano</label>
				<br/>
				<input id="livroAno" type="text" name="livro.ano" value="${livroCadastro.ano}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">						
				<label class="labelForm">Pre&ccedil;o</label>
				<br/>
				<input id="livroPreco" type="text" name="livro.preco" value="${livroCadastro.precoFormatado}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">Link de venda</label>
				<br/>
				<input id="livroLinkVenda" type="text" name="livro.linkVenda" value="${livroCadastro.linkVenda}" class="form-control" maxlength="100"/>
				</div>
					
			</div>
			
			<br/>
			
			<div class="campoOpcional">
				
				<div class="alert alert-info" align="center">
					<p><b>Os campos abaixo s&atilde;o de preenchimento opcional</b></p>
					<p>Utilizado para exibir informa&ccedil;&atilde;o adicional para os us&uacute;arios.</p>
					<p>Quanto menos campos forem deixados em branco mais informa&ccedil;&atilde;o sobre o livro estar&aacute; dispon&iacute;vel e mais atrativa poder&aacute; se tornar a oferta.
				</div>
											
				<table class="msgMiniBorder msgInfo">
					<tr align="center">
					<td>
						<label class="labelForm">Foto da capa do livro</label>
					</td>
					</tr>
					<tr>			
					<td>
						<div id="divUploadFotoLivro">
						<input id="inputImagemLivro" type="file" name="imagemLivro"/>
					</div>
					</td>
					</tr>
					<tr>			
					<td align="center">
						<input id="btRemoverUploadFotoLivro" type="button" value="remover foto" class="btn btn-danger"/>
					</td>
					</tr>
				</table>						
				
				<div class="paddingPadrao">
				<label class="labelForm">Sinopse</label>
				<br/>
				<textarea id="livroSinopse" name="livro.sinopse" class="form-control" rows="5">${livroCadastro.sinopse}</textarea>
				<h3 class="letraPequena">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterLivro">1000</span> caracteres.</h3>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">Editora</label>
				<br/>
				<input id="livroEditora" type="text" name="livro.editora" value="${livroCadastro.editora}" class="form-control" maxlength="100"/>
				</div>			
				
				<div class="paddingPadrao">
				<label class="labelForm">ISBN</label>
				<br/>
				<input id="livroIsbn" type="text" name="livro.isbn" value="${livroCadastro.isbn}" class="form-control" maxlength="100"/>
				</div>			
								
				<div class="paddingPadrao">
				<label class="labelForm">Idioma</label>
				<br/>
				<input id="livroIdioma" type="text" name="livro.idioma" value="${livroCadastro.idioma}" class="form-control" maxlength="100"/>
				</div>
				
				<div class="paddingPadrao">
				<label class="labelForm">C&oacute;digo de barras</label>
				<br/>
				<input id="livroCodigoBarra" type="text" name="livro.codigoBarra" value="${livroCadastro.codigoBarra}" class="form-control" maxlength="100"/>
				</div>				
						
				<div class="paddingPadrao">
				<input name="btnCadastrarLivro" type="button" value="Cadastrar"  class="btn btn-success direita" onclick="verificarExtensao(this.form, this.form.imagemLivro.value)"/>
				</div>
			</div>			
		</form>
	</td>
	</tr>
</table>

<!--  LIVROS SOLICITADOS tabLivrosSolicitadas -->
<c:if test="${not empty listagemLivros and empty livrosSolicitados}">
<table id="tabLivrosSolicitadas" class="superFooter bordaLateral">
	<tr>
		<td>
		<div align="center">
		<h2>N&atilde;o existem livro cadastrados</h2>
		</div>
		</td>
	</tr>
</table>
</c:if>
<c:if test="${not empty livrosSolicitados}">
<table id="tabLivrosSolicitadas" class="superFooter">
	<tr>
		<td>
		<div align="right" class="paddingPadrao">
			<input id="btFecharLivrosSolicitados" type="button" value="fechar" class="btn btn-danger">
		</div>
				
		<img src="${imagem}/iconeLivro.png" class="icone50 esquerda">
		
		<div align="center">		
		<span class="titulo">${labelResultadoConsultaLivro}</span>
		</div>
		
		</td>
	</tr>	
	<tr>
		<td>
		<div id="conteudoLivrosSolicitadas">
			<table class="display dataTable cardViewText superFooter bordaLateral" >				
				<thead>
					<tr>
					<th class="metadado" style="width: 50px;"></th>
					<th class="metadado">T&iacute;tulo </th>
					<th class="metadado">Autor</th>
					<th class="metadado">Categoria</th>
					<th class="metadado" style="width: 90px;">Ano</th>
					<th class="metadado" style="width: 150px;">Pre&ccedil;o (R$)</th>
					<th class="metadado" style="width: 150px;">Postagem</th>
					<th class="metadado">A&ccedil;&otilde;es</th>
					</tr>
				</thead>					
				<tbody>
					<c:forEach items="${livrosSolicitados}" var="livro">
						<tr class="zebrado">
							<td class="infoTabelaConteudo" style="width: 50px;"><img src="<c:url value="/loja/visualizador/${livro.uuid}" />" class="icone25"></td>
							<td class="infoTabelaConteudo">${livro.titulo}</td>
							<td class="infoTabelaConteudo">${livro.autor}</td>
							<td class="infoTabelaConteudo">${livro.categoria.descricao}</td>
							<td class="infoTabelaConteudo" style="width: 90px;">${livro.ano}</td>
							<td class="infoTabelaConteudo" style="width: 150px;">${livro.precoFormatado}</td>
							<td class="infoTabelaConteudo" style="width: 150px;">${livro.dataFormatadaCompleta}</td>
							<td>															
								<a href="<c:url value="/livro/adm/editar/${livro.uuid}" />">
									<img src="${imagem}/iconeEditarHover.png" class="icone20 ponteiro" alt="editar livro" title="editar">
								</a>
								
								<a href="<c:url value="/livro/adm/remover/${livro.uuid}" />">
									<img src="${imagem}/icone_excluir.png" onclick="return confirmarExclusao()" class="icone20 ponteiro" alt="excluir" title="excluir">
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

<!-- EDITAR LIVROS -->
<c:if test="${editarLivro}">
<c:choose>
<c:when test="${empty livro}">
	<table id="tabCadastrarLivro" class="cardViewText superFooter bordaLateral">
		<tr>
			<td>
			<div align="center">
				<h3>O livro solicitado n&atilde;o est&aacute; cadastrado. C&oacute;digo do livro solicitado: ${uuid}</h3>
			</div>
			</td>
		</tr>
	</table>
</c:when>
<c:otherwise>
	<table id="tabAtualizarLivro" class="cardViewText superFooter">
		<tr>
			<td>
			<div align="right" class="paddingPadrao">
				<input id="btFecharAtualizarLivro" type="button" value="fechar" class="btn btn-danger">
			</div>	
			<img align="left" src="${imagem}/iconeEditarHover.png" class="esquerda icone50">
			<h2 align="center">Atualizar Livro</h2>
			</td>		
		</tr>
	
		<tr align="center">
		<td>
			<p>
				<span class="info azulClaro">Formul&aacute;rio de atualiza&ccedil;&aacute;o de livro.</span>
			</p>	
			
			<form id="formAtualizaLivro" action="<c:url value="/livro/adm/atualizar"/>" enctype="multipart/form-data" method="post">
				<input type="hidden" name="livro.uuid" value="${livro.uuid}">
				<input type="hidden" name="dataPostagem" value="<fmt:formatDate value="${livro.postagem}" type="date" pattern="dd/MM/yyyy HH:mm:ss" />">		
				
				<div class="campoObrigatorio">
					<div class="paddingPadrao">				
					<label class="labelForm">C&oacute;digo do livro</label>
					<input type="text" name="livro.id" value="${livro.id}" class="form-control" readonly="readonly"/>
					</div>
					
					<div class="alert alert-warning">
						<b>Campos de preenchimento obrigat&oacute;rio</b>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Autor</label>
					<input id="livroAtualizaAutor" type="text" name="livro.autor" value="${livro.autor}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">				
					<label class="labelForm">T&iacute;tulo</label>
					<input id="livroAtualizaTitulo" type="text" name="livro.titulo" value="${livro.titulo}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Subt&iacute;tulo <span class="info">ex. volume 1, parte 1, ...</span></label>
					<br/>
					
					<input id="livroAtualizaSubtitulo" type="text" name="livro.subtitulo" value="${livro.subtitulo}" class="form-control" maxlength="100"/>
					</div>
					
					<label class="labelForm" style="color: #8B0000">Aten&ccedil;&atilde;o! Altere a categoria para '${livro.categoria.descricao}' ou selecione uma nova categoria.</label>
					<br/>
					
					<div class="paddingPadrao">				
					<label class="labelForm">Categoria <span id="btCadastrarCategoriaEdt" class="info azulClaro ponteiro">Cadastrar uma nova categoria?</span></label>
						
						<div id="divCadastrarCategoriaEdt">				
							<div class="alert alert-info">
							    <div class="input-group">
							      <input id="inputCadastrarCategoriaEdt" type="text" class="form-control" maxlength="100" placeholder="Digite a categoria">
							      <span class="input-group-btn">
							        <button id="ajaxCadastrarCategoriaEdt" class="btn btn-success" type="button">Cadastrar Categoria</button>
							      </span>
							    </div>
							 </div>				
							<img id="iconeAguardeCadastrarCategoriaEdt" src="${imagem}/gif_aguarde.gif" width="100" height="100">				
						</div>	
						
					<select id="comboBoxCategoriasLivroEdt" name="livro.categoria.id" class="form-control"></select>
					</div>
				
					<div class="paddingPadrao">
					<label class="labelForm">N&uacute;mero de p&aacute;ginas</label>
					<br/>
					<input id="livroAtualizaPaginas" type="text" name="livro.paginas" value="${livro.paginas}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Edi&ccedil;&atilde;o</label>
					<br/>
					<input id="livroAtualizaEdicao" type="text" name="livro.edicao" value="${livro.edicao}"  class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Ano</label>
					<br/>
					<input id="livroAtualizaAno" type="text" name="livro.ano" value="${livro.ano}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Pre&ccedil;o</label>
					<br/>
					<input id="livroAtualizaPreco" type="text" name="livro.preco" value="${livro.precoFormatado}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Link de venda</label>
					<br/>
					<input id="livroAtualizaLinkVenda" type="text" name="livro.linkVenda" value="${livro.linkVenda}" class="form-control" maxlength="100"/>
					</div>
						
				</div>
				
				<br/><br/>
				
				<div class="campoOpcional">
					
					<div class="alert alert-info" align="center">
						<p><b>Os campos abaixo s&atilde;o de preenchimento opcional</b></p>
						<p>Utilizado para exibir informa&ccedil;&atilde;o adicional para os us&uacute;arios.</p>
						<p>Quanto menos campos forem deixados em branco mais informa&ccedil;&atilde;o sobre o livro estar&aacute; dispon&iacute;vel e mais atrativa poder&aacute; se tornar a oferta.
					</div>
					
					<div class="paddingPadrao bordaPadrao">					
											
						<img src="<c:url value="/loja/visualizador/${livro.uuid}" />" class="fotoLivro">
						
						<p>
						<label class="inline">
						<input type="checkbox" value="true" name="removerImagemLivroEdt"/>	
						<span class="labelForm">Remover e n&atilde;o adicionar nenhuma imagem</span>
											
						</label>
						
						</p>
						<p>
						<label class="labelForm">Selecionar nova imagem da capa do livro</label><br/>
						</p>
						<div id="divUploadNovaFotoLivro" class="alert alert-info">
							<input type="hidden" name="livro.imagem.nome" value="${livro.imagem.nome}"/>
							<input type="hidden" name="livro.imagem.id" value="${livro.imagem.id}"/>
							<input type="hidden" name="livro.imagem.caminho" value="${livro.imagem.caminho}"/>
							<input id="inputNovaImagemLivro" type="file" name="novaImagemLivro"/>
						</div>
						<input id="btRemoverUploadNovaFotoLivro" type="button" value="Selecionar outra foto" class="btn btn-danger"/>
					</div>				
					
					<div class="paddingPadrao">
					<label class="labelForm">Sinopse</label>
					<br/>
					<textarea id="livroAtualizaSinopse" name="livro.sinopse" class="form-control" rows="5">${livro.sinopse}</textarea>
					<h3 class="letraPequena">breve descri&ccedil;&atilde;o. Pode conter ate <span id="contadorCaracterAtualizaLivro">1000</span> caracteres.</h3>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">Editora</label>
					<br/>
					<input id="livroAtualizaEditora" type="text" name="livro.editora" value="${livro.editora}" class="form-control" maxlength="100"/>
					</div>			
					
					<div class="paddingPadrao">
					<label class="labelForm">ISBN</label>
					<br/>
					<input id="livroAtualizaIsbn" type="text" name="livro.isbn" value="${livro.isbn}" class="form-control" maxlength="100"/>
					</div>			
										
					<div class="paddingPadrao">
					<label class="labelForm">Idioma</label>
					<br/>
					<input id="livroAtualizaIdioma" type="text" name="livro.idioma" value="${livro.idioma}" class="form-control" maxlength="100"/>
					</div>
					
					<div class="paddingPadrao">
					<label class="labelForm">C&oacute;digo de barras</label>
					<br/>
					<input id="livroAtualizaCodigoBarra" type="text" name="livro.codigoBarra" value="${livro.codigoBarra}" class="form-control" maxlength="100"/>
					</div>					
							
					<div class="paddingPadrao">
					<input name="btnAtualizarLivro" type="button" value="Atualizar"  class="btn btn-success" onclick="verificarExtensao(this.form, this.form.novaImagemLivro.value)"/>
					</div>
				</div>			
			</form>
		</td>
		</tr>
	</table>


</c:otherwise>
</c:choose>
</c:if>

</div>
</div> <!-- centralizacao -->

<div id="telaAguardeAdmCadastroLivro">
	<div align="center">
		
		<h2>Cadastro de Livro</h2>    
		<span class="info azulClaro letraGrande" >Cadastro/atualização de livro, neste momento estamos notificando as pessoas sobre o livro</span>
		<h3>Esta opera&ccedil;&atilde;o pode levar alguns segundos...</h3>
				
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
