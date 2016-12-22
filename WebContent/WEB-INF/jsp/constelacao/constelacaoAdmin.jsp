<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div align="center">
	<c:if test="${not empty constelacaoMensagemSucesso}">
		<div class="msgBorder msgSucesso ponteiro closeClick">
			${constelacaoMensagemSucesso} 
		</div>
	</c:if>

	<c:if test="${not empty flagLinkConstelacaoCadastro}">
		<div class="msgBorder msgErro ponteiro closeClick">
		${dataEmBranco}
		${localEmBranco}
		${valorIngressoEmBranco}
		${valorConstelacaoEmBranco}	
		</div>
	</c:if>
</div>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerSite.jsp" %>

<div id="divPgConstelacaoAdm" class="paddingPadrao">
<div align="center">

<h2>Constela&ccedil;&otilde;es Sist&ecirc;micas</h2>

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
		<img id="btAddNovoConstelacao" alt="Adicionar constelação" title="Adicionar constelação" src="${imagem}/iconeAddHover.png" class="icone50 ponteiro esquerda">
	</li>	
	<li>
		<img id="btListarConstelacao" alt="listar constelações" title="listar constelações" src="${imagem}/iconeListarHover.png" class="icone50 ponteiro esquerda">
	</li> 	
</ul>
</td>
</tr>
</table>
</div>
 
<div class="separador"></div>


<!-- LISTAR CONSTELAÇÕES -->
<div id="tabListagemConstelacao" class="paddingPadrao tamanhoDefault">
	
	<div align="right" class="paddingPadrao">		
	<input id="btFecharListagemConstelacao" type="button" value="fechar" class="btn btn-danger">
	</div>
	
	<table class="display dataTable cardViewText superFooter bordaLateral">
		<thead align="left">
			<tr>
				<th class="metadado">ID</th>
				<th class="metadado">Postagem</th>
				<th class="metadado">Data</th>
				<th class="metadado">Endereço</th>				
				<th class="metadado" style="width: 160px;">Participante</th>
				<th class="metadado" style="width: 30px;">.</th>
				<th class="metadado" style="width: 30px;">..</th>			
			</tr>
		</thead>
		<tbody>
	 		<c:forEach items="${eventos}" var="item">
				<tr class="zebrado">
					<td class="infoTabelaConteudo">${item.id}</td>
					<td class="infoTabelaConteudo">${item.postagem}</td>
					<td class="infoTabelaConteudo">${item.data}</td>
					<td class="infoTabelaConteudo">${item.local}</td>					
					<td class="infoTabelaConteudo" style="width: 160px;">${item.totalParticipantes}</td>
										
					<td class="infoTabelaData" style="width: 30px;" align="center">
						<a href="<c:url value="/constelacao/gerenciar/${item.id}"/>">
							<img class="icone" alt="Incluir participante" title="Incluir participante" src="${imagem}/iconeAddPessoaHover.png"></a>
					</td>
					
					<td class="infoTabelaData" style="width: 30px;" align="center">
						<a href="<c:url value="/constelacao/remover/${item.id}"/>" onclick="return confirmarExclusao()" >
							<img class="icone" alt="Excluir constelação e todos os participantes" title="Excluir constelação e todos os participantes" src="${imagem}/icone_excluir.png"></a>
					</td>
				</tr>			
			</c:forEach>		
		</tbody>			
	</table>
</div>

<!-- ADICIONAR CONSTELAÇÃO -->
<input id="flagLinkConstelacaoCadastro" type="hidden" value="${flagLinkConstelacaoCadastro}" />
<table id="tabNovaConstelacao" class="cardViewText">		
	<tr>
		<td>
		<div align="right">
		<input id="btFecharAddConstelacao" type="button" value="fechar" class="btn btn-danger">
		</div>
		<img src="${imagem}/iconeAddHover.png" class="icone50 esquerda">		
		<h2 align="center">Cadastrar Constelação</h2>
		
		<form id="formCadastrarConstelacao" action="<c:url value="/constelacao/cadastrar"/>" method="post">
		
			<h3>Data:</h3>
			<input id="constelacaoData" class="form-control" name="evento.data" value="${evento.data}" maxlength="254" required="required"/>
			<br/>			
						
			<h3>Endereço do local:</h3>
			<input id="constelacaoEndereco" class="form-control" name="evento.local" value="${evento.local}" maxlength="254" required="required"/>
			<br/>
			
			<h3>Valor do Ingresso:</h3>
			<input id="constelacaoIngresso" class="form-control" name="evento.valorIngresso" value="${evento.valorIngresso}" maxlength="254" required="required"/>
			<br/>
			
			<h3>Valor para Constelar:</h3>
			<input id="constelacaoConstelar" class="form-control" name="evento.valorParticipacao" value="${evento.valorParticipacao}" maxlength="254" required="required"/>
			<br/>
					
			<p class="paddingPadrao">
			<input id="btCadastrarConstelacao" type="button" value="cadastrar" class="btn btn-success">
			<input id="btCancelarConstelacao" type="button" value="cancelar" class="btn btn-default">				
			</p>
		</form>			
		</td>
	</tr>
</table>

<!-- GERENCIAR CONSTELAÇÕES -->
<input id="flagGerenciarConstelacao" type="hidden" value="${flagGerenciarConstelacao}" />



<div id="divAdmGerenciarConstelacao">

<div align="right" class="paddingPadrao">
		<input id="btFecharGerenciarConstelacao" type="button" value="fechar" class="btn btn-danger">
</div>

<table style="width: 100%">
<tr>
<td style="width:100%" align="center" valign="top">
<div class="tamanhoDefault">
	<div class="alert alert-info paddingPadrao">			
			<h2><b>Gerenciar Constelação</b></h2>
			<div align="left" class="paddingPadrao">
			<h5><b>Data e Local:</b> ${evento.data}, ${evento.local}</h5>
			<h5><b>Valores:</b> Do Ingresso: R$ ${evento.valorIngresso}, da constelação: R$ ${evento.valorParticipacao}</h5>			
			</div>
	</div>
	
	<div class="alert alert-info paddingPadrao">
		
	<c:if test="${not empty constelacaoMensagemCadastroSucesso}">
		<div class="alert alert-success ponteiro closeClick">
			${constelacaoMensagemCadastroSucesso} 
		</div>
	</c:if>
	
	
	<!-- Trigger the modal with a button -->
  	<button type="button" class="btn btn-success" data-toggle="modal" data-target="#modalCadastrarParticipante">Incluir Participante</button>

  <!-- Modal -->
  <div class="modal fade" id="modalCadastrarParticipante" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Incluir Participante</h4>
        </div>
        <div class="modal-body">
          	<!-- ADICIONAR PARTICIPANTE -->
		 	<div class="campoObrigatorio">
			<form id="formCadastrarParticipante" action="<c:url value="/constelacao/participante/cadastrar"/>" method="post">
					
				<img class="icone" alt="Incluir participante" title="Incluir participante" src="${imagem}/iconeAddPessoaHover.png">
				<h3 align="center">Incluir Participante</h3>
				
				<input type="hidden" name="participante.evento.id" value="${evento.id}">		
						
				<div class="paddingPadrao">				
					<label class="esquerda">Nome</label>
					<input id="edtConstelacaoCadPessoa" type="text" name="participante.nome" class="form-control" maxlength="254" required="required"/>
				</div>
				
				<div class="paddingPadrao">				
					<label class="esquerda">E-mail</label>
					<input type="text" name="participante.email" class="form-control" maxlength="254"/>
				</div>
				
				<div class="paddingPadrao">				
					<label class="esquerda">Celular</label>
					<input id="telefoneParticipante" type="text" name="participante.celular" class="form-control"/>
				</div>
				
				<div class="paddingPadrao">
					<label class="esquerda">Como soube</label>
					<textarea name="participante.comoSoube" class="form-control" rows="3" maxlength="254"></textarea>
				</div>
				
				<div align="left">
				<P>
				<label><input type="checkbox" name="participante.pagouIngresso" /> pagou ingresso.</label>
				</P>
				
				<P>
				<label><input type="checkbox" name="participante.constelou" /> constelou.</label>
				</P>
				
				<P>
				<label><input type="checkbox" name="participante.pagouContelacao" /> pagou constelação.</label>
				</P>
				</div>
				
				<p>
				<textarea name="participante.observacao" class="form-control" placeholder="Observações" rows="5"></textarea>					
				</p>
				
				<div align="left">
				<button type="submit" class="btn btn-success">Cadastrar</button>
				</div>
			
			</form>	
			</div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>      
    </div>
  </div>
  
  <c:if test="${flagEditarParticipante}">
  
  <button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalEditarParticipante">Editar dados de ${participante.nome}</button>
  
  <!-- Modal Editar Participante -->
  <div class="modal" id="modalEditarParticipante" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Editar Participante</h4>
        </div>
        <div class="modal-body">
          	<!-- EDITAR PARTICIPANTE -->
			
			<!-- <div id="divEditarParticipante" class="campoObrigatorio"> -->
			<div class="campoObrigatorio">
			<form id="formEditarParticipante" action="<c:url value="/constelacao/participante/confirmarEditar"/>" method="post">
				
				<img class="icone" alt="editar" title="editar" src="${imagem}/iconeEditarHover.png">	
				<h3 align="center">Editar Participante</h3>
				
				<input type="hidden" name="participante.id" value="${participante.id}">
				<input type="hidden" name="participante.evento.id" value="${idEvento}">		
						
				<div class="paddingPadrao">				
					<label class="esquerda">Nome</label>
					<input type="text" name="participante.nome" class="form-control" maxlength="254" value="${participante.nome}" required="required"/>
				</div>
				
				<div class="paddingPadrao">				
					<label class="esquerda">E-mail</label>
					<input type="text" name="participante.email" class="form-control" maxlength="254" value="${participante.email}"/>
				</div>
				
				<div class="paddingPadrao">				
					<label class="esquerda">Celular</label>
					<input id="editarTelefoneParticipante" type="text" name="participante.celular" class="form-control" value="${participante.celular}"/>
				</div>
				
				<div class="paddingPadrao">
					<label class="esquerda">Como soube</label>
					<textarea name="participante.comoSoube" class="form-control" rows="3" maxlength="254">${participante.comoSoube}</textarea>
				</div>
				
				<div align="left">
				
				<P>
				<c:choose>
					<c:when test="${participante.pagouIngresso}">
						<label><input type="checkbox" name="participante.pagouIngresso" checked="checked" /> pagou ingresso.</label>
					</c:when>
					<c:otherwise>
						<label><input type="checkbox" name="participante.pagouIngresso" /> pagou ingresso.</label>
					</c:otherwise>
				</c:choose>	
				</P>
				
				<P>
				<c:choose>
					<c:when test="${participante.constelou}">
						<label><input type="checkbox" name="participante.constelou" checked="checked" /> constelou.</label>
					</c:when>
					<c:otherwise>
						<label><input type="checkbox" name="participante.constelou" /> constelou.</label>
					</c:otherwise>
				</c:choose>	
				</P>
			
				<P>
				<c:choose>
					<c:when test="${participante.pagouContelacao}">
						<label><input type="checkbox" name="participante.pagouContelacao" checked="checked" /> pagou constelação.</label>
					</c:when>
					<c:otherwise>
						<label><input type="checkbox" name="participante.pagouContelacao" /> pagou constelação.</label>
					</c:otherwise>
				</c:choose>	
				</P>
				</div>
				
				<p>
				<textarea name="participante.observacao" class="form-control" placeholder="Observações" rows="5">${participante.observacao}</textarea>					
				</p>
			
				<div align="left">
				<button type="submit" class="btn btn-success">Editar</button>
				</div>
				
			</form>	
			</div>
			
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>      
    </div>
  </div>
  </c:if>	
		
	</div>

	<c:choose>
		
		<c:when test="${evento.totalParticipantes eq 0}">
		<div class="alert alert-warning paddingPadrao">
		Não existem participantes nesta Constelação		
		</div>
		</c:when>
		
		<c:otherwise>		
		<table class="table table-hover letraPequena">
  		<thead>
  			<tr>
		  		<th colspan="3">${evento.totalParticipantes} Participante(s) nesta constelação</th>
	  		</tr>
	  		<tr>
		  		<th>Nome</th>
		  		<th>E-mail</th>
		  		<th>Telenone</th>
		  		<th>Ingresso</th>
				<th>Constelou</th>
				<th>Constelação</th>
				<th>Obs.</th>
				<th>Ações</th>
	  		</tr>
  		</thead>
  		
  		<tbody>
  			<c:forEach items="${evento.participantes}" var="p">
  			
  			<c:choose>
  			<c:when test="${p.inadimplente}">
  			<tr style="background-color: #FFC1C1">
  			</c:when>
  			<c:otherwise>
  			<tr>
  			</c:otherwise>
  			</c:choose>
  			
  			
	  			<td>${p.nome}</td>
	  			<td>${p.email}</td>
	  			<td>${p.celular}</td>
	  			<td>${p.ingressoPago}</td>
				<td>${p.participouEvento}</td>
				<td>${p.constelacaoPaga}</td>
				<td>
					
					<c:choose>
						<c:when test="${p.comObservacao}">
							<img class="icone" alt="${p.observacao}" title="${p.observacao}" src="${imagem}/icone_novo_depoimento.png"></img>
						</c:when>
						<c:otherwise>
							<img class="icone" src="${imagem}/icone_novo_comentario.png"></img>
						</c:otherwise>
					</c:choose>
					
					
				</td>
				<td>
				<a href="<c:url value="/constelacao/participante/alterar/${p.id}/${evento.id}" />" ><img class="icone" alt="editar" title="editar" src="${imagem}/iconeEditarHover.png"></a>				
				<a href="<c:url value="/constelacao/participante/remover/${p.id}/${evento.id}" />" onclick="return confirmarExclusao()" ><img class="icone" alt="excluir" title="excluir" src="${imagem}/icone_excluir.png"></a>
				</td>
	  		</tr>
  			</c:forEach>  			
  		</tbody>
  		
  		<tfoot>
  		<tr class="alert alert-info">
  			<td></td>
  			<td></td>
  			<td><b>Totais Gerais</b></td>
  			<td><b>R$ ${evento.capitalIngresso}</b></td>
  			<td><b>${evento.constelacoesRealizadas}</b></td>
  			<td><b>R$ ${evento.capitalConstelacao}</b></td>
  			<td></td>
  			<td><b>R$ ${evento.capitalTotal}</b></td>
  		</tr>
  		</tfoot>
  		  		
		</table>		
		</c:otherwise>
	</c:choose>
</div>
</td>
</tr>

</table>
	
</div>

</div>
</div>



<div id="telaAguardeAdmConstelacaoCadastrar">
	<div align="center">
		
		<h2>Constela&ccedil;&otilde;es Sist&ecirc;micas</h2>
		<span class="info azulClaro letraGrande" >Constela&ccedil;&atilde;o sendo cadastrada/atualizada.</span>
								
		<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
		
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
