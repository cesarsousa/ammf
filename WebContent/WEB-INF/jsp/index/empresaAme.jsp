<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp" %>

<div class="pgEmpresaAme" align="center">

<div class="jumbotron">	
<%@ include file="/headerSite.jsp" %>
<%@ include file="/menuPrincipal.jsp" %>
		
	<div id="logoAme"></div>			
	
	<c:if test="${not empty msgSucesso}">
		<div class="msgBorder msgSucesso ponteiro closeClick">
			${msgSucesso} 
		</div>
	</c:if>
	<c:if test="${not empty msgErro}">
		<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">
			${msgErro}
		</div>
	</c:if>
	
	<div align="center">
		<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
			<h2 align="center" style="color:rgb(29,23,82) ">Conceito da Nossa Empresa</h2>
			<p>Oferecer atendimentos na área ampla de Psicologia e Terapia; 
			dinâmicas de Análise e Treinamento de Vida, de Estudos, de Aperfeiçoamento e Organização Profissional; 
			Workshops Temáticos; Treinamentos, Formações e Cursos Específicos.</p>
			<p>Nosso objetivo está em apresentar produtos de alta qualidade e desempenho.</p> 
			<p>Nossa meta será sempre atender de um modo efetivo as necessidades dos nossos clientes.</p>
			<p>Trabalhamos com a concepção de uma necessidade e premência atual de Formações Continuadas, 
			incluindo o Aperfeiçoamento das Capacidades Individuais e Coletivas, 
			com feedbacks dinâmicos para o equilíbrio entre as vidas e perspectivas individuais e as demandas do mercado.</p>
		</div>
	</div>
</div> <!-- end jumbotrom -->

<div class="alert alert-warning" role="alert">
  <h1>Continuação do curso de formação terapêutica previsto para 2024, contéudo e datas serão disponibilizados em breve...</h1>
</div>

<div align="center">
<div align="center" class="tamanhoDefault">	
			<table class="fundoConstelacaoDadosTerapeuta" style="color: black;">
			<tr>
			<td>
			<div align="center" class="paddingPadrao">
			<img src="${imagem}/owner2.jpg" alt="Alcindo Miguel Martins Filho" class="img-circle destaqueFoto" width="250px" height="250px">		
			</div>
			</td>
			<td>
			<h4>Dr. Alcindo Miguel Martins Filho</h4>
			<h4>Doutor pela Universidade Federal Fluminense, possui Mestrado e Especializações em áreas afins. Graduado em Psicologia e em Ciências Sociais.</h4>
			<h4>Com extensa atuação e formação nas áreas diretamente vinculadas à prática terapêutica, Educação, Terapia Comportamental Cognitiva - TCC, Hipnose, Constelações Sistêmicas, Acupuntura e Psicanálise.</h4>
			<h4>Tem ampla vivência em diversos sistemas terapêuticos, relativos às áreas humanas além de um contínuo aperfeiçoamento nas práticas correlatas de meditação, atenção e conhecimento tradicional.</h4>
			</td>
			</tr>
			</table>		
			<div >			
			</div>
</div>
</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
