<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>

<c:if test="${not empty msgIndex}">
	<div class="msgBorder msgSucesso closeClick ponteiro">${msgIndex}</div>
	<br/>
</c:if>

<c:if test="${not empty msgErroIndex}">
	<div class="msgBorder msgErro closeClick ponteiro">${msgErroIndex}</div>
	<br/>
</c:if>

<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<div align="center">	
	
	<div class="cardPrincipal">
		<div id="mensagemIndex">
		
			<table id="tabMensagemIndex">
			<tr>
			<td>
			<label class="descricaoTextoIndex corPrincipal"><span class="xLarge">&ldquo;</span> ${sessaoCliente.textoIndex.conteudo} <span class="xLarge">&bdquo;</span></label>
			<br/>
			<label class="autorTextoIndex azulClaro">${sessaoCliente.textoIndex.autor}</label>
			</td>
			</tr>
			</table>	
		
		</div>
		<div id="shiva"></div>
	</div>
	
	<br/>
	
	<div class="cardViewText">
	<p>Quem sou.</p>
	
	add a foto do computador sentado no consultório.
	
	<p>
	Alcindo Martins Filho é Psicólogo (CRP 05/35489),  
	especialista no tratamento de síndrome do pânico, estresse, ansiedade, depressão, fobias, traumas, 
	estresse pós traumático, burn out, problemas de relacionamento, luto em função de morte ou separação 
	entre outros.
	</p>
	<p>
	Sua experiência além da psicologia clínica, 
	inclui a literatura e mais de tantos anos. Atua também como Coaching no desenvolvimento de profissionais, 
	conflitos no trabalho, líderes e atletas de alto desempenho.
	</p>
	
	<p>Formado em psicologia pela universidade tal</p>
	<p>Pós graduado em psicologia pela universidade tal</p>
	<p>Mestre em psicologia pela universidade tal</p>
	<p>Doutor em psicologia pela universidade tal</p>
	
	<p>Áreas de Atuação</p>
	<ul>
	<li>Psicoterapia</li>
	<li>Hipnose</li>
	<li>Acupuntura</li>
	<li>Atendimento online</li>
	</ul>
	
	<p>Áreas de tratamento</p>
	<ul>
	<li>Relacionamento</li>
	<li>Ansiedade</li>
	<li>Depreção</li>
	<li>Transtorno do pânico ou síndrome do pânico</li>
	<li>Transtorno bipolar</li>
	<li>Fobia</li>
	<li>Transtorno obsessivo compulsivo (T.O.C)</li>
	<li>Sexualidade</li>
	<li>Falar em público</li>
	<li>Talentos e pontos fortes</li>
	</ul>
	

	
	</div>
	
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<br/>

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>