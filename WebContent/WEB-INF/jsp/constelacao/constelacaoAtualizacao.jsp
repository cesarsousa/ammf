<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/logAdmin.jsp" %>

<%@ include file="/headerLib.jsp" %>

<div align="center">

<c:if test="${not empty mensagemErro}">
	<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">${mensagemErro}</div>
</c:if>

<c:if test="${not empty mensagem}">
	<div id="boxMsgSucesso" class="msgBorder msgSucesso ponteiro closeClick">${mensagem}</div>
</c:if>

<table>
<tr>
<td>
<div align="center">
<ul class="itemMenuOpcao">
	<li class="itemMenuPrincipal">
		<form id="formMenuPrincipal" action="<c:url value="/menu/adm"/>" method="post">
			<div align="center" id="btMenuAdm" title="menu principal" class="ponteiro"></div>
		</form>
	</li>
</ul>
</div>
</td>
</tr>
</table>


	<table class="tamanhoDefault">
		<tr>
			<td>
			<div class="tamanhoEdicaoIndex  bordaPadrao" >
			<img align="left" src="${imagem}/fundoConstelacao.jpg" class="esquerda icone50">
			<h2 align="center">Constelações Sistêmicas</h2>
			<h3 align="center">Atualiza&ccedil;&atilde;o do conte&uacute;do da constelação de Niterói</h3>
		
			<form action="<c:url value="/constelacao/niteroi/atualizar"/>" method="post" class="paddingPadrao">			
				
				<h3>Local do Evento:</h3>
				<input type="text" class="form-control" name="constelacao.localEvento" value="${sessaoUsuario.constelacao.localEvento}"/>
											
				<h3>Texto Inicial:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.textoInicial" >${sessaoUsuario.constelacao.textoInicial}</textarea>				
								
				<h3>Forma de Pagamento:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.formaPagamento" >${sessaoUsuario.constelacao.formaPagamento}</textarea>				
								
				<h3>Texto Final:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.textoFinal" >${sessaoUsuario.constelacao.textoFinal}</textarea>				
								
				<h3>Data: Este texto define parte do título do e-mail</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h2&gt;</b> para iniciar, e o marcador <b>&lt;/h2&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="5" name="constelacao.data" >${sessaoUsuario.constelacao.data}</textarea>				
								
				<h3>Localiza&ccedil;&atilde;o (Endere&ccedil;o):</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.localizacao" >${sessaoUsuario.constelacao.localizacao}</textarea>
				
				<h3>Localiza&ccedil;&atilde;o (Google Maps):</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h3&gt;</b> para iniciar, e o marcador <b>&lt;/h3&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.localMapa" >${sessaoUsuario.constelacao.localMapa}</textarea>				
				
				<h3>Link para compartilhar Google Maps:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Gere esse link pelo Google Maps.
				</div>
				<textarea class="form-control" rows="3" name="constelacao.linkMapa" >${sessaoUsuario.constelacao.linkMapa}</textarea>				
				
								
				<h3>Informa&ccedil;&otilde;es:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.informacao" >${sessaoUsuario.constelacao.informacao}</textarea>				
								
				<h3>Dados Pessoais:</h3>
				<div class="alert alert-warning">
				<b>Dica de Preenchimento!</b> Para delimitar um par&aacute;grafo utilize o marcador <b>&lt;h4&gt;</b> para iniciar, e o marcador <b>&lt;/h4&gt;</b> para finalizar o par&aacute;grafo.
				</div>
				<textarea class="form-control" rows="10" name="constelacao.dadosPessoais" >${sessaoUsuario.constelacao.dadosPessoais}</textarea>				
								
				<br>
				<input type="text" class="form-control" name="emailAdicional" placeholder="Enviar notificação da constelação para este e-mail"/>
																
				<div class="checkbox" align="right">
				    <label>
				      <input type="checkbox" name="constelacaoEnviarEmail"> Enviar e-mail da constela&ccedil;&atilde;o para as pessoas.
				    </label>
				 </div>
				  
				 <div id="telaAguardeEmailConstelacaoAtualizacao">
					<div align="center">
						
						<h2>Constela&ccedil;&otilde;es Sist&ecirc;micas</h2>
						<span class="info azulClaro letraGrande" >Constela&ccedil;&atilde;o sendo cadastrada/atualizada.</span>
												
						<h3 class="paddingTelaAguarde">Enviando notifica&ccedil;&atilde;o por email para as pessoas cadastradas no site.<br/>Esta opera&ccedil;&atilde;o pode levar alguns minutos.</h3>
						
						<div class="paddingTelaAguarde backgroundTelaAguarde" align="center"><img alt="Aguarde" src="${imagem}/gif_aguarde.gif"></div>			
						<br />
						<br />			
					</div>
				</div>
								
				<p class="paddingPadrao">
				<input id="btFormCostelacaoNiteroiAtualizar" type="submit" value="atualizar" class="btn btn-success direita" >			
				</p>
			</form>			
			</div>
			</td>
		</tr>
	</table>





</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footerADM.jsp" %>
</div>
