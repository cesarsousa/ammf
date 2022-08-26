<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<div align="center">
<c:if test="${not empty erroConfConta}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">
	Verifique dado(s) obrigat&oacute;rio(s) de configura&ccedil;&atilde;o da conta n&atilde;o preenchido(s)
	</div>
</c:if>

<c:if test="${not empty mensagemErro}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">${mensagemErro}</div>
</c:if>

<c:if test="${not empty mensagemAviso}">
	<div class="msgBorder msgAlerta">${mensagemAviso}</div>
</c:if>

<c:if test="${not empty mensagem}">
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagem}</div>
</c:if>

<c:if test="${not empty mensagemMenuSecundario}">		
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagemMenuSecundario}</div>
</c:if>

<c:if test="${not empty sessaoUsuario.notificacoes}">
	<div class="msgBorder msgAlerta">
	<c:forEach items="${sessaoUsuario.notificacoes}" var="notificacao">
		${notificacao}<br/>
	</c:forEach>
	</div>
</c:if>
</div>

<%@ include file="/headerLib.jsp" %>

<div id="divPgMenu" align="center">

<h2>Menu Principal</h2>

<div class="tamanhoDefault">

	<table class="tamanhoDefault">
		<tr>
			<td>			
			<c:if test="${not empty usuarioUuidBranco}">
			<div id="boxMsgErro" class="msgBorder msgErro tamanhoEdicaoIndex ponteiro">${usuarioUuidBranco}</div>
			</c:if>				
			</td>
		</tr>				
	</table>
	
	<table class="tamanhoDefault">
	<tr>
	<td>
	
	<a href="<c:url value="/menu/adm" ></c:url>">
	<img id="btMenuRefresh" alt="atualizar pagina" title="atualizar pagina" src="${imagem}/iconeRefresh.png" class="icone50 ponteiro esquerda clarear">
	</a>
	</td>
	</tr>
	</table>
	
	<!-- EDITAR CONTEUDO SHIVA -->
	<!-- Botão para acionar modal -->
	<button type="button" class="btn btn-light" data-toggle="modal" data-target="#modalEditarShiva" style="width: 100%; color: black;">
	  <b>Shiva <span class="info azulClaro">Altere o nome do autor e a frase que os da imagem do Shiva.</span></b>
	</button>	
	<!-- Modal -->
	<div class="modal fade" id="modalEditarShiva" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">Atualiza&ccedil;&atilde;o da frase e autor da p&aacute;gina do Shiva</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
					<div>
					<img align="left" src="${imagem}/Shiva500.jpg" class="esquerda icone50">			
					
					<form id="formAtualizarTextoIndex" action="<c:url value="/menu/index/atualizar"/>" method="post" class="paddingPadrao">			
						<div align="right">
						<table>
							<tr>
							<td><span id="sizeLargeIndex" style="font-size: large;" class="ponteiro" >A</span></td>
							<td><span id="sizeXLargeIndex" style="font-size: x-large;" class="ponteiro" >A</span></td>
							<td><span id="sizeXxLargeIndex" style="font-size: xx-large;" class="ponteiro" >A</span></td>
							
							<td><span id="sizeSmallAreaIndex" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
							<td><span id="sizeLargeAreaIndex" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
							<td><span id="sizeXxLargeAreaIndex" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					
							</tr>				
						</table>
						</div>						
						
						<h3>Frase:</h3>
						<textarea id="campoFraseIndex" class="form-control" rows="7" name="texto.conteudo" style="resize: none;">${sessaoUsuario.textoIndex.conteudo}</textarea>				
										
						<h4 class="azulClaro" align="right">
							Voc&ecirc; pode digitar <span id="contadorCaracterShiva">600</span> caracteres na frase.
						</h4>
						
						<h3>Autor:</h3>
						<input id="campoAutorFraseIndex" type="text" class="form-control" name="texto.autor" value="${sessaoUsuario.textoIndex.autor}">
						
					</form>			
					</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <button id="btAtualizarTextoIndex" type="button" class="btn btn-success">Salvar mudanças</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="separador"></div>
	
	<!-- EDITAR CONTEUDO QUIRON -->
	<!-- Botão para acionar modal -->
	<button type="button" class="btn btn-light" data-toggle="modal" data-target="#modalEditarQuiron" style="width: 100%; color: black;">
	  <b>Quiron <span class="info azulClaro">Altere o conte&uacute;do do texto da p&aacute;gina sobre quiron.</span></b>
	</button>
	<!-- Modal -->
	<div class="modal fade" id="modalEditarQuiron" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">Atualiza&ccedil;&atilde;o do conte&uacute;do do texto da p&aacute;gina quiron.</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
					<div>
					<img align="left" src="${imagem}/quiron.jpg" class="esquerda icone50">

					<form id="formAtualizarTextoQuiron" action="<c:url value="/menu/quiron/atualizar"/>" method="post" class="paddingPadrao">			
						<div align="right">
						<table>
							<tr>
							<td><span id="sizeLargeQuiron" style="font-size: large;" class="ponteiro" >A</span></td>
							<td><span id="sizeXLargeQuiron" style="font-size: x-large;" class="ponteiro" >A</span></td>
							<td><span id="sizeXxLargeQuiron" style="font-size: xx-large;" class="ponteiro" >A</span></td>
							
							<td><span id="sizeSmallAreaQuiron" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
							<td><span id="sizeLargeAreaQuiron" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
							<td><span id="sizeXxLargeAreaQuiron" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					
							</tr>				
						</table>
						</div>
						
						<p>				
						<c:choose>
							<c:when test="${sessaoUsuario.textoQuiron.confirmado}">
								<label class="labelForm2"><input id="quironBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
							</c:when>
							<c:otherwise>
								<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
							</c:otherwise>
						</c:choose>
						</p>
						
						<textarea id="campoConteudoQuiron" class="form-control" rows="10" name="texto.conteudo" style="resize: none;" >${sessaoUsuario.textoQuiron.conteudo}</textarea>				
						
						<h4 class="azulClaro" align="right">
							Voc&ecirc; pode digitar <span id="contadorCaracterQuiron">3000</span> caracteres no texto.
						</h4>
					</form>			
					</div>
	        
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <button id="btAtualizarTextoQuiron" type="button" class="btn btn-success">atualizar e destravar texto</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="separador"></div>
	
	<!-- CONFIGURACOES DA CONTA -->
	<!-- Botão para acionar modal -->
	<input id="flagEditarUsuario" type="hidden" value="${editarUsuario}"/>
	<button type="button" class="btn btn-light" data-toggle="modal" data-target="#modalEditarConfiguracaoConta" style="width: 100%; color: black;">
	  <b>Configura&ccedil;&otilde;es da Conta <span class="info azulClaro">Altere os dados de acesso ao sistema.</span></b>
	</button>
	<!-- Modal -->
	<div class="modal fade" id="modalEditarConfiguracaoConta" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">Configura&ccedil;&atilde;o dos dados da conta e acesso ao sistema</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<div align="left">
				
				<img align="left" src="${imagem}/icone_setting.png" class="esquerda icone50">
				
				<br/><br/><br/>
				
				<form id="formAlterarUsuario" action="<c:url value="/usuario/configuracao"/>" method="post" class="paddingPadrao">			
				
				<input id="usuarioUuid" type="hidden" name="usuario.uuid" value="${sessaoUsuario.usuario.uuid}" />
					
				<label class="labelForm2 h3">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.administrativo}">
							<input id="usuarioAdministrativo" type="checkbox" name="usuario.administrativo" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="usuarioAdministrativo" type="checkbox" name="usuario.administrativo" />
						</c:otherwise>
					</c:choose>				
					Perfil Administrativo					
				</label>
				<ul style="list-style-type: none;">
					<li>Marcar para utilizar SMTP servidor Google</li>
					<li>Desmarcar para utilizar SMTP servidor Integrator</li>
				</ul>
				
				<label class="labelForm2 h3">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.dominioPadrao}">
							<input id="usuarioDominioPadrao" type="checkbox" name="usuario.dominioPadrao" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="usuarioDominioPadrao" type="checkbox" name="usuario.dominioPadrao" />
						</c:otherwise>
					</c:choose>				
					Domínio Padrão					
				</label>
				<ul style="list-style-type: none;">
					<li>Marcar para utilizar domínio link de email como produção</li>
					<li>Desmarcar para utilizar domínio link de email como localhost</li>
				</ul>
				
				<label class="labelForm2 h3">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.imagemPadrao}">
							<input id="usuarioImagemPadrao" type="checkbox" name="usuario.imagemPadrao" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="usuarioImagemPadrao" type="checkbox" name="usuario.imagemPadrao" />
						</c:otherwise>
					</c:choose>				
					Imagem padrão					
				</label>
				<ul style="list-style-type: none;">
					<li>Marcar para utilizar path de imagem do servidor de produção</li>
					<li>Desmarcar para utilizar path de imagem em desenvolvimento</li>
				</ul>		
								
				<h3>Nome Completo:</h3>
				<c:if test="${not empty usuarioNomeBranco}">
				<p class="labelFormErro">${usuarioNomeBranco}</p>
				<input id="campoContaNome" type="text" class="form-control" name="usuario.nome" value="${sessaoUsuario.usuario.nome}" />
				</c:if>
				<c:if test="${empty usuarioNomeBranco}">
				<input id="campoContaNome" type="text" class="form-control" name="usuario.nome" value="${sessaoUsuario.usuario.nome}" />
				</c:if>
				
				<h3>Telefone:</h3>
				<c:if test="${not empty usuarioTelefoneBranco}">
				<p class="labelFormErro">${usuarioTelefoneBranco}</p>
				<input id="campoContaTelefone" type="text" class="form-control" name="usuario.telefone" value="${sessaoUsuario.usuario.telefone}" />
				</c:if>
				<c:if test="${empty usuarioTelefoneBranco}">
				<input id="campoContaTelefone" type="text" class="form-control" name="usuario.telefone" value="${sessaoUsuario.usuario.telefone}" />
				</c:if>
				
				
				<h3>Login:</h3>
				<c:if test="${not empty usuarioLoginBranco}">
				<p class="labelFormErro">${usuarioLoginBranco}</p>
				<input id="campoContaLogin" type="text" class="form-control" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				<c:if test="${empty usuarioLoginBranco}">
				<input id="campoContaLogin" type="text" class="form-control" name="usuario.login" value="${sessaoUsuario.usuario.login}" />
				</c:if>
				
				
				<h3>Email de envio: <span class="info azulClaro">utilizado para enviar as notifica&ccedil;&otilde;es aos usu&aacute;rios.</span></h3>
				<div class="msgBorderInterno msgAlerta t100">
				<b>Aten&ccedil;&atilde;o !</b><br/>
				&Eacute; obrigat&oacute;rio o uso de um email fornecido pelo servidor (<i>site@quiron.psc.br</i>) para o funcionamento correto do site.
				</div>
				<p>
				<c:if test="${not empty usuarioErroEmail}">				
				<p class="labelFormErro">${usuarioErroEmail}</p>
				
				<input id="campoContaEmail" type="text" class="form-control" name="usuario.email" value="${sessaoUsuario.usuario.email}" />
				</c:if>				
				<c:if test="${empty usuarioErroEmail}">
				<input id="campoContaEmail" type="text" class="form-control" name="usuario.email" value="${sessaoUsuario.usuario.email}" />
				</c:if>
				</p>
				
				<h3>Senha:
				<label id="checkMostrarSenha" class="info azulClaro ponteiro"> Mostrar Senha</label>
				<label id="checkOcultarSenha" class="info azulClaro ponteiro"> Ocultar Senha</label>
				</h3>				
				<div class="msgBorderInterno msgAlerta t100">				
				<b>Lembrete !</b><br/>
				&Eacute; obrigat&oacute;rio que a senha seja a mesma do email cadastrado no servidor do site no site (<i>270879cm</i>).				
				</div>
				
				<c:if test="${not empty usuarioSenhaBranco}">				
				<p class="labelFormErro">${usuarioSenhaBranco}</p>
				<input id="campoContaSenha" type="password" class="form-control" name="usuario.senha" value="${sessaoUsuario.usuario.senha}">
				<input id="campoContaSenhaTexto" type="text" class="form-control" value="${sessaoUsuario.usuario.senha}" readonly="readonly" disabled="disabled">
					
				</c:if>				
				<c:if test="${empty usuarioSenhaBranco}">
					<p>
					<input id="campoContaSenha" type="password" class="form-control" name="usuario.senha" value="${sessaoUsuario.usuario.senha}">
					<input id="campoContaSenhaTexto" type="text" class="form-control" value="${sessaoUsuario.usuario.senha}" readonly="readonly" disabled="disabled">
					</p>
				</c:if>
				
				<h3>Email de recebimento: <span class="info azulClaro">utilizado para receber as notifica&ccedil;&otilde;es dos usu&aacute;rios.</span></h3> 	
				<table>
				<tr>
				<td align="left">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.emailAtivado}">
							<input id="usuarioEmailAtivado" type="checkbox" name="usuario.emailAtivado" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="usuarioEmailAtivado" type="checkbox" name="usuario.emailAtivado" />
						</c:otherwise>
					</c:choose>				
				</td>
				<td align="left"><h3 class="info azulClaro letraPequena">Ativar o envio de email pelo site para os clientes e para o administrador dos eventos ocorridos no sistema.</h3></td>
				</tr>
				</table>
				<div class="msgBorderInterno msgAlerta t100">
				<b>Aten&ccedil;&atilde;o !</b><br/>
				&Eacute; obrigat&oacute;rio o uso de um email para o recebimento das notifica&ccedil;&otilde;es disparadas pelo site.
				</div>
				<p>
				<c:if test="${not empty usuarioErroEmailNotificacao}">				
				<p class="labelFormErro">${usuarioErroEmailNotificacao}</p>
				<input id="campoContaEmailNotificacao" type="text" class="form-control" name="usuario.emailNotificacao" value="${sessaoUsuario.usuario.emailNotificacao}" />
				</c:if>				
				<c:if test="${empty usuarioErroEmailNotificacao}">
				<input id="campoContaEmailNotificacao" type="text" class="form-control" name="usuario.emailNotificacao" value="${sessaoUsuario.usuario.emailNotificacao}" />
				</c:if>
				</p>	
				
				<p>
				<span id="linked">Linked</span> <span id="in">in</span>
				</p>
				<p>
				<input id="campoContaLinkedin" type="text" class="form-control" name="usuario.linkedin" value="${sessaoUsuario.usuario.linkedin}">
				</p>
				
				<!-- <p>http://br.linkedin.com/pub/alcindo-miguel-martins-filho/2b/28b/364</p>
				<p>http://www.linkedin.com/pub/cesar-sousa-junior/66/583/a43</p>
				
				<textarea rows="10" cols="100">
				<iframe width="1000" height="350" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://www.google.com.br/maps?f=q&amp;source=s_q&amp;hl=pt-BR&amp;geocode=&amp;q=Rua+da+Concei%C3%A7%C3%A3o,+13,+Niter%C3%B3i+-+Rio+de+Janeiro&amp;aq=0&amp;oq=Rua+da+Concei%C3%A7%C3%A3o+13,+Niter%C3%B3i+-+Rio+de+Janeiro&amp;sll=-22.894233,-43.12092&amp;sspn=0.008441,0.009645&amp;ie=UTF8&amp;hq=&amp;hnear=R.+da+Concei%C3%A7%C3%A3o,+13+-+Centro,+Niter%C3%B3i+-+Rio+de+Janeiro,+24020-080&amp;t=m&amp;ll=-22.894204,-43.120909&amp;spn=0.027674,0.085831&amp;z=14&amp;iwloc=A&amp;output=embed"></iframe>
				</textarea>
				 -->				
				
				<hr style="width: 100%; border: 1px dashed #CCCCCC;" />			
					
				<h3>Dados de localiza&ccedil;&atilde;o e configura&ccedil;&atilde;o do Google Maps</h3>
				
				<h3>Endere&ccedil;o:<span class="info azulClaro" >Entre com as informa&ccedil;&otilde;es que voc&ecirc; deseja que os clientes visualizem.</span></h3>
				<c:if test="${not empty usuarioLoginBranco}">
				<label class="labelFormEndereco">${usuarioLoginBranco}</label>
				<input id="campoContaEndereco" type="text" class="form-control" name="usuario.endereco" value="${sessaoUsuario.usuario.endereco}" />
				</c:if>
				<c:if test="${empty usuarioLoginBranco}">
				<input id="campoContaEndereco" type="text" class="form-control" name="usuario.endereco" value="${sessaoUsuario.usuario.endereco}" />
				</c:if>	
				
				<h3>Google Maps</h3>
				<table>
				<tr>
				<td align="left">
					<c:choose>
						<c:when test="${sessaoUsuario.usuario.mostrarMapa}">
							<input id="checkHabilitarMapa" type="checkbox" name="usuario.mostrarMapa" checked="checked" />
						</c:when>
						<c:otherwise>
							<input id="checkHabilitarMapa" type="checkbox" name="usuario.mostrarMapa" />
						</c:otherwise>
					</c:choose>				
				</td>
				<td align="left"><h3 class="info azulClaro letraPequena">Habilitar mapa com a visualiza&ccedil;&atilde;o do endere&ccedil;o na p&aacute;gina de contato do site.</h3></td>
				</tr>
				</table>
				
				<div id="divGeoLocalizacao">
				<div class="msgBorderInterno msgAlerta t100">
				Ao marcar a op&ccedil;&atilde;o de <b>visualiza&ccedil;&atilde;o com Google Maps</b> ser&aacute; habilitado para o usu&aacute;rio o mapa contendo o endere&ccedil;o da empresa. Para desabilitar esta funcionalidade mantenha a op&ccedil;&atilde;o desmarcada.
				</div>				
				<h3>Insira o HTML contendo a localiza&ccedil;&atilde;o do endere&ccedil;o.</h3>
				<textarea id="areaLocalizacaoMapa" class="form-control" rows="10" name="usuario.localizacao">${sessaoUsuario.usuario.localizacao}</textarea>
				</div>
				<br/>
				</form>
			</div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	        <button id="btAlterarUsuario" type="button" class="btn btn-success">Salvar mudanças</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="separador"></div>
	
	<!-- EDITAR CONTEUDO CONSTELACAO NITERÓI -->
	<!-- Botão para acionar modal -->
	<button type="button" class="btn btn-light" data-toggle="modal" data-target="#modalEditarConstelacao" style="width: 100%; color: black;">
	  <b>Constelação Niterói ${sessaoUsuario.constelacao.dataFormatada} <span class="info azulClaro">Altere o conte&uacute;do sobre constelação de Niterói.</span></b>
	</button>	
	<!-- Modal -->
	<div class="modal fade" id="modalEditarConstelacao" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">Atualiza&ccedil;&atilde;o do conte&uacute;do da p&aacute;gina da constela&ccedil;&atilde;o.</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<div align="left">
			
				<img align="left" src="${imagem}/fundoConstelacao.jpg" class="esquerda icone50">
				
				<br/><br/><br/>
				
				<h3>Local do Evento:</h3>
				
				<input id="constelacaoNiteroiLocalEvento" type="text" class="form-control" name="constelacao.localEvento" value="${sessaoUsuario.constelacao.localEvento}" readonly="readonly"/>
											
				<h3>Texto Inicial:<img id="iconeconstelacaoNiteroiTextoInicial" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiTextoInicial" class="form-control" rows="10" name="constelacao.textoInicial" >${sessaoUsuario.constelacao.textoInicial}</textarea>				
								
				<h3>Forma de Pagamento:<img id="iconeconstelacaoNiteroiFormaPagamento" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiFormaPagamento" class="form-control" rows="10" name="constelacao.formaPagamento" >${sessaoUsuario.constelacao.formaPagamento}</textarea>				
								
				<h3>Texto Final:<img id="iconeconstelacaoNiteroiTextoFinal" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiTextoFinal" class="form-control" rows="10" name="constelacao.textoFinal" >${sessaoUsuario.constelacao.textoFinal}</textarea>				
								
				<h3>Data: Este texto define parte do título do e-mail<img id="iconeconstelacaoNiteroiData" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h2&gt;</b> para iniciar, e o marcador <b>&lt;/h2&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiData" class="form-control" rows="5" name="constelacao.data" >${sessaoUsuario.constelacao.data}</textarea>				
								
				<h3>Localiza&ccedil;&atilde;o (Endere&ccedil;o):<img id="iconeconstelacaoNiteroiLocalizacao" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiLocalizacao" class="form-control" rows="10" name="constelacao.localizacao" >${sessaoUsuario.constelacao.localizacao}</textarea>
				
				<h3>Localiza&ccedil;&atilde;o (Google Maps):<img id="iconeconstelacaoNiteroiLocalMapa" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiLocalMapa" class="form-control" rows="10" name="constelacao.localMapa" >${sessaoUsuario.constelacao.localMapa}</textarea>				
				
				<h3>Link para compartilhar Google Maps:<img id="iconeconstelacaoNiteroiLinkMapa" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Gere esse link pelo Google Maps.
				</div>
				<textarea id="constelacaoNiteroiLinkMapa" class="form-control" rows="3" name="constelacao.linkMapa" >${sessaoUsuario.constelacao.linkMapa}</textarea>				
				
								
				<h3>Informa&ccedil;&otilde;es:<img id="iconeconstelacaoNiteroiInformacao" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiInformacao" class="form-control" rows="10" name="constelacao.informacao" >${sessaoUsuario.constelacao.informacao}</textarea>				
								
				<h3>Dados Pessoais:<img id="iconeconstelacaoNiteroiDadosPessoais" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="constelacaoNiteroiDadosPessoais" class="form-control" rows="10" name="constelacao.dadosPessoais" >${sessaoUsuario.constelacao.dadosPessoais}</textarea>				
				
				<br/>
				
				<div align="center">
				<img id="aguardeNotificacaoConstelacaoNiteroi" alt="Aguarde" src="${imagem}/gif_aguarde.gif">
				</div>
				
				<div id="msgSucessoAjaxNiteroi" class="msgBorderInterno msgSucesso ponteiro closeClick"></div>
				<div id="msgErroAjaxNiteroi" class="msgBorderInterno msgErro"></div>
				
				<div class="paddingPadrao">
				<input id="constelacaoNiteroiEmailAdicional" type="email" class="form-control" placeholder="Enviar notificação da constelação para este e-mail">
				</div>
				
				<div class="paddingPadrao">
				<button id="constelacaoNiteroiEnviarEmails" class="btn btn-success" type="button">Enviar e-mail da constela&ccedil;&atilde;o para todas as pessoas</button>
				</div>
			</div>			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="separador"></div>
	
	<!-- EDITAR CONTEUDO CURSO -->
	<!-- Botão para acionar modal -->
	<button type="button" class="btn btn-light" data-toggle="modal" data-target="#modalEditarCurso" style="width: 100%; color: black;">
	  <b>Curso ${sessaoUsuario.curso.dataFormatada} <span class="info azulClaro">Altere o conte&uacute;do sobre o curso.</span></b>
	</button>	
	<!-- Modal -->
	<div class="modal fade" id="modalEditarCurso" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-lg" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h3 class="modal-title">Atualiza&ccedil;&atilde;o do conte&uacute;do do e-mail do curso.</h3>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
			<div align="left">
			
				<img align="left" src="${imagem}/seloCurso.jpg" class="esquerda icone50">
				
				<br/><br/><br/>
				
				<h3>Local do Evento:</h3>
				
				<input id="CursoLocalEvento" type="text" class="form-control" name="curso.localEvento" value="${sessaoUsuario.curso.localEvento}" readonly="readonly"/>
											
				<h3>Nome:<img id="iconecursoNome" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoNome" class="form-control" rows="10" name="curso.nome" >${sessaoUsuario.curso.nome}</textarea>				
								
				<h3>Descri&ccedil;&atilde;o:<img id="iconecursoDescricao" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoDescricao" class="form-control" rows="10" name="curso.descricao" >${sessaoUsuario.curso.descricao}</textarea>				
								
				<h3>Forma de pagamento:<img id="iconecursoFormaPagamento" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoFormaPagamento" class="form-control" rows="10" name="curso.formaPagamento" >${sessaoUsuario.curso.formaPagamento}</textarea>				
								
				<h3>Data: Este texto define parte do título do e-mail<img id="iconecursoData" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h2&gt;</b> para iniciar, e o marcador <b>&lt;/h2&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoData" class="form-control" rows="5" name="curso.data" >${sessaoUsuario.curso.data}</textarea>				
								
				<h3>Localiza&ccedil;&atilde;o (Endere&ccedil;o):<img id="iconecursoLocalizacao" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoLocalizacao" class="form-control" rows="10" name="curso.localizacao" >${sessaoUsuario.curso.localizacao}</textarea>
				
				<h3>Localiza&ccedil;&atilde;o (Google Maps):<img id="iconecursoLocalMapa" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoLocalMapa" class="form-control" rows="10" name="curso.localMapa" >${sessaoUsuario.curso.localMapa}</textarea>				
				
				<h3>Link para compartilhar Google Maps:<img id="iconecursoLinkMapa" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Gere esse link pelo Google Maps.
				</div>
				<textarea id="cursoLinkMapa" class="form-control" rows="3" name="curso.linkMapa" >${sessaoUsuario.curso.linkMapa}</textarea>				
				
								
				<h3>Informa&ccedil;&otilde;es:<img id="iconecursoInformacao" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoInformacao" class="form-control" rows="10" name="curso.informacao" >${sessaoUsuario.curso.informacao}</textarea>				
								
				<h3>Dados Pessoais:<img id="iconecursoDadosPessoais" src="${imagem}/icone_confirmar.png" class="icone20"></h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea id="cursoDadosPessoais" class="form-control" rows="10" name="curso.dadosPessoais" >${sessaoUsuario.curso.dadosPessoais}</textarea>				
				
				<br/>
				
				<div align="center">
				<img id="aguardeNotificacaoCurso" alt="Aguarde" src="${imagem}/gif_aguarde.gif">
				</div>
				
				<div id="msgSucessoAjaxCurso" class="msgBorderInterno msgSucesso ponteiro closeClick"></div>
				<div id="msgErroAjaxCurso" class="msgBorderInterno msgErro"></div>
				
				<div class="paddingPadrao">
				<input id="cursoEmailAdicional" type="email" class="form-control" placeholder="Enviar notificação do curso para este e-mail">
				</div>
				
				<div class="paddingPadrao">
				<button id="cursoEnviarEmails" class="btn btn-success" type="button">Enviar e-mail do curso para todas as pessoas</button>
				</div>
			</div>			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<div class="separador"></div>
	
	<table id="tabMenuPrincipal">
	<tr>
		<td align="center">
			<ul id="menu">
				<li>
					<img id="imglinkTerapeuta" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeFreud.png"/>
					<a id="linkEditarTerapeuta" href="">O Terapeuta</a></li>
				<li>
					<img id="imglinkPsicologia" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconePsicologiaHover.png"/>
					<a id="linkEditarPsicologia" href="">Psicologia</a></li>
				<li>
					<img id="imglinkEducacao" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeEducacaoHover.png"/>
					<a id="linkEditarEducacao" href="">Educa&ccedil;&atilde;o</a></li>
				<li>
					<img id="imglinkCultura" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeCulturaHover.png"/>
					<a id="linkEditarCultura" href="">Cultura</a></li>
				<li>
					<img id="imglinkOrientais" class="imgMenuPrincipal clarear ponteiro" src="${imagem}/iconeOrientalHover.png"/>
					<a id="linkEditarOrientais" href="">Artes Orientais</a></li>
			</ul>
		</td>
	</tr>
</table>	
	
	<table id="tabTerapeuta" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconeFreud.png"/>			
			<label class="tituloEdicao"> O Terapeuta </label>
			<h3>Altera&ccedil;&atilde;o das informa&ccedil;&otilde;es que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre o terapeuta.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="">			
			
			<form action="<c:url value="/usuario/atualizar/terapeuta"/>" method="post" class="paddingPadrao">
			
				<table class="largura80">
				<tr>
					<td>	
					<div align="left">		
						<img src="${imagem}/owner.jpg" class="destaqueFoto">
					</div>
					</td>
					<td>
					<h2>Alcindo Miguel Martins Filho.</h2>										
					<input id="edtTituloTerapeuta" type="text" class="letraCinza largura100 altura30 bordaPadrao" maxlength="100" name="terapeuta.titulo" value="${sessaoUsuario.terapeuta.titulo}">
					</td>
				</tr>
				</table>
				
				<div class="bordaInferior">
				<h3>
					Texto com informa&ccedil;&otilde;es gerais. (at&eacute; 2000 caracteres).
				</h3>										
													
				<textarea id="edtInfoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.informacao">${sessaoUsuario.terapeuta.informacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterInfoTerapeuta">2000</span></h4>	
				</div>
				
				<div class="bordaInferior">
				<h3>
					Texto com as forma&ccedil;&otilde;es. (at&eacute; 2000 caracteres).
				</h3>
									
				<textarea id="edtFormacaoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.formacao">${sessaoUsuario.terapeuta.formacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterFormacaoTerapeuta">2000</span></h4>	
				</div>
				
				<div class="bordaInferior">
				<h3>
					&Aacute;reas de Atua&ccedil;&atilde;o: (at&eacute; 2000 caracteres).
				</h3>
				
				<span class="info azulClaro">Utilize o caracter ponto '.' para delimitar par&aacute;grafos. <b>Para a &uacute;ltima &Aacute;rea de Atua&ccedil;&atilde;o N&Atilde;O utilize ponto.</b> </span>	
			
				<textarea id="edtAtuacaoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.atuacao">${sessaoUsuario.terapeuta.atuacao}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterAtuacaoTerapeuta">2000</span></h4>	
				</div>
				
				<div>
				<h3>
					&Aacute;reas de Tratamento: (at&eacute; 2000 caracteres).
				</h3>
				
				<span class="info azulClaro">Utilize o caracter ponto '.' para delimitar par&aacute;grafos. <b>Para a &uacute;ltima &Aacute;rea de Tratamento N&Atilde;O utilize ponto.</b> </span>	
							
				<textarea id="edtTratamentoTerapeuta" class="areaTexto h200 bordaPadrao" name="terapeuta.tratamento">${sessaoUsuario.terapeuta.tratamento}</textarea>
				<h4>Caracteres restantes: <span id="contadorCaracterTratamentoTerapeuta">2000</span></h4>	
				</div>
				
				<p class="paddingPadrao">
				<input id="brAlterarDadosTerapeuta" type="submit" class="btn btn-success" value="Atualizar">
				<input id="btFecharEditarTerapeuta" type="button" class="btn btn-default" value="Cancelar">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>	
	
	<table id="tabPsicologia" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconePsicologiaHover.png"/>			
			<label class="tituloEdicao"> Psicologia </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre psicologia.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoPsicologia">						
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">			
			<form action="<c:url value="/menu/psicologia/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterPsicologia">3000</span> caracteres no texto sobre psicologia.
				</h3>	
			
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallPsicologia" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumPsicologia" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargePsicologia" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargePsicologia" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargePsicologia" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaPsicologia" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaPsicologia" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaPsicologia" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaPsicologia" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaPsicologia" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>			
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoPsicologia.confirmado}">
						<label class="labelForm2"><input id="psicologiaBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
													
				<textarea id="campoTextoPsicologia" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoPsicologia.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="brAlterarTxtPsicologia" type="submit"  class="btn btn-success" value="atualizar e destravar texto">
				<input id="btFecharEditarPsicologia" type="button" class="btn btn-default" value="Cancelar">
				</p>
			
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabEducacao" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img id="imagemEducacao" class="imgMenuPrincipal" src="${imagem}/iconeEducacaoHover.png"/>			
			<label class="tituloEdicao"> Educa&ccedil;&atilde;o </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre educa&ccedil;&atilde;o.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoEducacao">			
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/educacao/atualizar" />" method="post" class="paddingPadrao">
				
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterEducacao">3000</span> caracteres no texto sobre Educa&ccedil;&atilde;o.
				</h3>
			
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallEducacao" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumEducacao" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeEducacao" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeEducacao" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeEducacao" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaEducacao" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaEducacao" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaEducacao" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaEducacao" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaEducacao" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoEducacao.confirmado}">
						<label class="labelForm2"><input id="educacaoBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
								
				<textarea id="campoTextoEducacao" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoEducacao.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarTxtEducacao" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarEducacao" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabCultura" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeCulturaHover.png"/>			
			<label class="tituloEdicao"> Cultura </label>
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre cultura.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoCultura">
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/cultura/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterCultura">3000</span> caracteres no texto sobre cultura.
				</h3>
				
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallCultura" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumCultura" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeCultura" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeCultura" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeCultura" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaCultura" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaCultura" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaCultura" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaCultura" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaCultura" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoCultura.confirmado}">
						<label class="labelForm2"><input id="culturaBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
				
				<textarea id="campoTextoCultura" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoCultura.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarTxtCultura" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarCultura" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<table id="tabArtesOrientais" class="cartao tamanhoEdicaoIndex">
		<tr>
			<td>
			<img class="imgMenuPrincipal" src="${imagem}/iconeOrientalHover.png"/>			
			<label class="tituloEdicao"> Artes Orientais </label>
			<div class="bordaPadrao" align="center">
				<h3>LOKAH SAMASTAH SUKHINO BHAVANTHU</h3>
				<h4 class="azulClaro">"Que todos os seres sejam felizes"</h4>
			</div>
			
			<h3>Altera&ccedil;&atilde;o do texto que os usu&aacute;rios ir&atilde;o ler na p&aacute;gina sobre artes orientais.</h3>
			</td>
		</tr>
		<tr>
			<td>
			<div id="edicaoArtesOrientais">
			<img align="left" src="${imagem}/iconeEditar.png" class="esquerda icone50">
			<form action="<c:url value="/menu/artesorientais/atualizar" />" method="post" class="paddingPadrao">
			
				<h3 class="azulClaro">
					Voc&ecirc; pode digitar <span id="contadorCaracterArtesOrientais">3000</span> caracteres no texto sobre artes orientais.
				</h3>
								
				<table class="tamanhoDefault">
					<tr>
					<td><span id="sizeSmallArtesOrientais" style="font-size: small;" class="ponteiro" >A</span></td>
					<td><span id="sizeMediumArtesOrientais" style="font-size: medium;" class="ponteiro" >A</span></td>
					<td><span id="sizeLargeArtesOrientais" style="font-size: large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXLargeArtesOrientais" style="font-size: x-large;" class="ponteiro" >A</span></td>
					<td><span id="sizeXxLargeArtesOrientais" style="font-size: xx-large;" class="ponteiro" >A</span></td>
					
					<td><span id="sizeSmallAreaArtesOrientais" style="font-size: small;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeMediumAreaArtesOrientais" style="font-size: medium;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeLargeAreaArtesOrientais" style="font-size: large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXLargeAreaArtesOrientais" style="font-size: x-large;" class="ponteiro" >&equiv;</span></td>
					<td><span id="sizeXxLargeAreaArtesOrientais" style="font-size: xx-large;" class="ponteiro" >&equiv;</span></td>
					</tr>				
				</table>
				
				<p>				
				<c:choose>
					<c:when test="${sessaoUsuario.textoArtesOrientais.confirmado}">
						<label class="labelForm2"><input id="artesorientaisBtTravarTexto" type="checkbox" onclick="javascript: travarTextoParaEdicao(this)" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:when>
					<c:otherwise>
						<label class="labelForm2"><input type="checkbox" checked="checked" disabled="disabled" />Travar texto para edi&ccedil;&atilde;o.</label>
					</c:otherwise>
				</c:choose>
				</p>
				
				<textarea id="campoTextoOrientais" class="areaTexto h200 bordaPadrao" name="texto.conteudo">${sessaoUsuario.textoArtesOrientais.conteudo}</textarea>
				
				<p class="paddingPadrao">
				<input id="btAlterarArtOriental" type="submit" value="atualizar e destravar texto" class="btn btn-success">
				<input id="btFecharEditarArtesOrientais" type="button" value="Cancelar" class="btn btn-default">
				</p>
				
			</form>			
			</div>
			</td>
		</tr>
	</table>
	
	<div class="separador"></div>
		
	<div align="center">	
	
	<div id="menuLink">		
			<ul id="menuRodape" >
				<li>
				<form action="<c:url value="/logout/site" />">
				<input type="submit" value="Site" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/constelacao" />" method="get">
				<input type="submit" value="Constelações" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/blog" />" method="get">
				<input type="submit" value="Blog" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/resenha" />" method="get">
				<input type="submit" value="Resenhas" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/video" />" method="get">
				<input type="submit" value="Videos" class="buttonFooter">
				</form>
				</li>							
				
				<li>
				<form action="<c:url value="/menu/link" />" method="get" >
				<input type="submit" value="Links" class="buttonFooter">
				</form>
				</li>				
				
				<li>
				<form action="<c:url value="/menu/cadastro" />" method="get" >
				<input type="submit" value="Cadastro" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/loja" />" method="get" >
				<input type="submit" value="Loja Virtual" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/email" />" method="get" >
				<input type="submit" value="E-mail" class="buttonFooter">
				</form>
				</li>
				
				<li>
				<form action="<c:url value="/menu/erroAplicacao" />" method="get" >
				<input type="submit" value="ERRO" class="buttonFooter">
				</form>
				</li>
			</ul>		
				
		</div>
	</div>	
	
</div>
</div>

<div id="telaAguardeMenu">
	<div align="center">						
		<h3 class="paddingTelaAguarde">O sistema est&aacute; realizando as altera&ccedil;&otilde;es solicitadas.
		<br/>
		Esta opera&ccedil;&atilde;o pode levar alguns minutos porque v&aacute;rios emails podem estar sendo enviados...</h3>			
		
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
