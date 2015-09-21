
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>
<%@ include file="/headerQuiron.jsp" %>
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>

<div id="espacador"></div>

<br/>
<div align="center">

	<div class="areaFormatacao">	
		<div class="esquerda">
			<img id="imagemPsicologia" class="imgMenuPrincipal" src="${imagem}/iconeFreud.png"/>
		</div>		
	</div>

	<div align="center"><h1>O Terapeuta</h1></div>

	<div class="cardViewText">
	
		<div align="center">
			<img src="${imagem}/owner2.jpg" alt="Alcindo Miguel Martins Filho" class="img-circle destaqueFoto" width="300px" height="300px">		
		</div>
		
		<div align="center"><h1>Alcindo Miguel Martins Filho.</h1></div>
		
		<!-- <h3>
		Psic&oacute;logo, com gradua&ccedil;&atilde;o em Ci&ecirc;ncias Sociais e 
		tamb&eacute;m em Psicologia, e com especializa&ccedil;&otilde;es e forma&ccedil;&otilde;es complementares.			
		</h3>
	
		<h3>
		Tem uma dur&aacute;vel, intensa e variada experi&ecirc;ncia no tratamento de diferentes 
		e diversas dificuldades existenciais, psicol&oacute;gicas e/ou psiqui&aacute;tricas. 
		</h3>
		
		<h3>
		Sua experi&ecirc;ncia vai al&eacute;m da Psicologia Cl&iacute;nica e da Psican&aacute;lise, 
		atuando tamb&eacute;m como Coaching no desenvolvimento de estudantes, profissionais, 
		conflitos no trabalho e rela&ccedil;&otilde;es de lideran&ccedil;a, al&eacute;m de atuar com 
		Terapias Alternativas e Criatividade se necess&aacute;rio. 
		</h3>
		
		<h3>
		Como sua forma&ccedil;&atilde;o atravessa as Ci&ecirc;ncias Sociais, sua pr&aacute;tica em Psicologia 
		possui uma forte sensibilidade em rela&ccedil;&atilde;o as diversidades e dificuldades s&oacute;cio-culturais 
		e de fluxo econ&ocirc;mico dentro de uma postura e posi&ccedil;&atilde;o existencialista.
		</h3>
		
		<h4>
		Formação b&aacute;sica em Ci&ecirc;ncias Sociais e Psicologia.
		</h4>
		<h4>
		Especializa&ccedil;&otilde;es em Pedagogia e Acupuntura.
		</h4>	
		<h4>
		Forma&ccedil;&otilde;es em Psican&aacute;lise, Terapia Ericsoniana e Administra&ccedil;&atilde;o.
		</h4>
		<h4>
		Cursos e pr&aacute;ticas em Psicologia Cognitiva, Qi Gong e Terapias Alternativas.
		</h4>
		<h4>
		Mestrado em Letras.
		</h4>
		<h4>
		Doutorado em Literatura Comparada.
		</h4>
	
		<h2 class="descricaoTextoIndex">Áreas de Atua&ccedil;&atilde;o</h2>
		<ul class="azulClaro">
		<li>Psican&aacute;lise</li>
		<li>Psicoterapia</li>
		<li>Psicologia Cl&iacute;nica</li>
		<li>An&aacute;lise S&oacute;cio Cultural</li>
		<li>Terapias Alternativas</li>
		<li>Literaturas</li>
		</ul>
		
		<h2 class="descricaoTextoIndex">Áreas de Tratamento</h2>
		<ul class="azulClaro">
		<li>Individual</li>
		<li>Casais</li>
		<li>Fam&iacute;lias</li>
		<li>Da Adolesc&ecirc;ncia &agrave; Terceira idade</li>
		<li>Coaching Educacional e Profissional</li>
		<li>Talentos e Criatividade</li>
		<li>Sexualidade e Afetividade</li>
		<li>Educa&ccedil;&atilde;o e Desenvolvimento</li>
		<li>Dor, Sofrimento, Doen&ccedil;a e Morte</li>
		</ul> -->
		
		<h2>${sessaoCliente.terapeuta.titulo}</h2>
				
		<c:if test="${not empty sessaoCliente.terapeuta.informacoes}">
		<c:forEach items="${sessaoCliente.terapeuta.informacoes}" var="informacao">
		<h3>${informacao}</h3>
		</c:forEach>
		</c:if>
		
		
		<div style="padding-bottom: 20px; padding-top: 20px;">
		<c:if test="${not empty sessaoCliente.terapeuta.formacoes}">
		<h2 class="descricaoTextoIndex">Forma&ccedil;&atilde;o</h2>
		<c:forEach items="${sessaoCliente.terapeuta.formacoes}" var="formacao">
		<h4>${formacao}</h4>
		</c:forEach>
		</c:if>
		</div>
		
		<c:if test="${not empty sessaoCliente.terapeuta.atuacoes}">
		<h2 class="descricaoTextoIndex">Áreas de Atua&ccedil;&atilde;o</h2>
		<ul class="azulClaro">
		<c:forEach items="${sessaoCliente.terapeuta.atuacoes}" var="atuacao">
			<li>${atuacao}</li>
		</c:forEach>
		</ul>
		</c:if>
		
		<c:if test="${not empty sessaoCliente.terapeuta.tratamentos}">
		<h2 class="descricaoTextoIndex">Áreas de Tratamento</h2>
		<ul class="azulClaro">
		<c:forEach items="${sessaoCliente.terapeuta.tratamentos}" var="tratamento">
			<li>${tratamento}</li>
		</c:forEach>
		</ul>
		</c:if>
			
	</div>	
</div>

<br/>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>