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
  <h1>Curso de Formação em Terapia Sistêmica, Transpessoal e Transdisciplinar com Constelações</h1>
</div>

<div class="jumbotron" style="background-color: #ffffff">
	<div align="center">
		<div class="  cardViewTextNoBackground ">
			<h1 align="center" style="color:rgb(29,23,82)">Curso 2024</h1>
			
			<table style="width: 100%">
				<tr>
					<td width="80%" class="paddingPadrao">
					<h2 style="color:rgb(29,23,82)">A Perspectiva Junguiana e os Arquétipos do Inconsciente Coletivo:
					Manejo e dinâmica na prática transpessoal sistêmica.</h2></td>
					<%-- <td width="20%" class="paddingPadrao"><img class="ml-3" src="${imagem}/seloCurso.jpg" alt="selo de registro do curso"></td> --%>
				</tr>
			</table>
			
			<!-- <div align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/WfX1OKVEuLU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>
			 -->
			<div align="center">
				<h2 style="color:rgb(29,23,82)">Finalidade</h2>
			</div>
			<div class="jumbotron paddingPadrao" style="background-color: #fff;">
				<table>
					<tr>
						<td width="50%">
							<div align="center">
								<img alt="" src="${imagem}/caminho-curso-2024.PNG">
								<h6>A imagem do caminho foi retirada de: https://pixabay.com/pt/images/search/estrada+caminho/</h6>
							</div>
						</td>
						<td width="50%">
							<div style="width: 100%" class="cardViewTextNoBackground">
								<p>Oito módulos mensais, presenciais, aos domingos, teórico-práticos de seis horas de duração, sem interrupções, das 9 às 15 horas começando em abril e concluindo em novembro.</p>
								<p>Certificado de 100 horas de formação ou proporcional a participação efetiva.</p>
								<p>Ao final do ano, aqueles que tiverem participado também das Reuniões de Constelação, farão jus a um certificado complementar de carga horária, proporcional à efetiva participação.
									<br/>Participação garantida no Grupo de Supervisão Clínica, com aproximadamente duas reuniões mensais para estudo de dúvidas e discussão de casos clínicos, situações profissionais ou familiares.
									<br/>Um ponto importante é que este é um curso em processo indexado, qualquer pessoa pode entrar a qualquer momento, seguindo o processo e acumulando a transmissão de conhecimento, o trabalho terapêutico pessoal e a experiência terapêutica comentada na sequência da prática.
									<br/>A Certificação acompanhará aquilo que for efetivamente frequentado no âmbito do curso e em seus complementos voluntários.
								</p> 
							</div>
						</td>
						
						<%-- <td>
							<div align="center">
								<img alt="" src="${imagem}/atrologia.jpg">
							</div>
						</td> --%>
					</tr>
				</table>
			</div>
			
			<%-- <div align="center" style="color: yellow; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: #000;">
			<div class="paddingPadrao" style="width:768px; height:512px; background-image: url('${imagem}/atrologia.jpg'); background-repeat: no-repeat;">
				<h2 style="color: yellow">
				Destina-se a todas as pessoas que desejem conhecer a si mesmas; 
				aperfeiçoar seus recursos íntimos e interpessoais; 
				compreender e aprender a vivenciar melhor os relacionamentos íntimos, 
				familiares, profissionais, econômicos, culturais e sociais; 
				participando de um processo terapêutico onde terão as condições para confrontar suas memórias, 
				dores e vivências desafiadoras de uma forma nova e dinâmica; 
				entendendo uma abordagem energética, integrativa e sistêmica da vida; 
				e tendo uma iniciação a prática das Constelações Familiares e Sistêmicas, 
				em conjunto com Metodologia Científica, Existencialismo, Fenomenologia, Teoria das Complexidades e Sistemas.
				</h2>
			</div>
			</div> --%>
			
			<!-- <h2 style="color:rgb(29,23,82)">Exigência de Ingresso</h2>
			<div class="paddingPadrao">
			<p>Terceiro Grau em qualquer área, completo ou em desenvolvimento.</p>
			</div> -->
			
			<div align="center">
			<h2 style="color:rgb(29,23,82)">Estrutura do Curso</h2> 
			<div class="paddingPadrao">
			<p>Uma Bússola para a Caminhada da Alma nesta Vida:</p>
			<img alt="" src="${imagem}/roda-adjetivos.PNG">
			<h6>A imagem do Jung foi retirada de: https://cria3.com.br/blog/arquetipos-de-jung/</h6>
			</div>
			</div>
			
			<div class="jumbotron">
				<div align="center">
					<div class="  cardViewTextNoBackground " style="width: 80%">
					<p>Nosso Curso de Formação e Terapia de Grupo teve seu início oficial de
abril à novembro de 2019 com um modelo diferente. Então nós
certificamos 200 horas de curso certificado, que envolvia 10 horas por
dia, presencial, no Centro do Rio, um final de semana por mês, sábado
e domingo.</p>
<p>Este modelo se mostrou extremamente capaz de produzir mudanças
profundas de direção, comportamento e compreensão em vários dos
partícipes, além de melhorias clínicas significativas em todos/as os/as
envolvidos/as presentes. Mas, também se realizou como muito
cansativo, exaustivo mesmo para a maioria.
Compreendemos desde então uma Formação em Progresso e
Processo.</p>
<p>A emersão da Pandemia de Covid interrompeu por dois anos todos os
encontros públicos e grupos.</p>
<p>Em 2022 retornamos com uma nova proposta:
<br/>Mesmo número de meses, mesmo modelo de encontros, mas um só dia
do mesmo no final de semana em jogo na Formação, com 10 horas de
encontro (incluídos lanches e principalmente almoço).
<br/>Assim mantivemos em 2022 e 2023 com bastante sucesso clínico e
refundação das bases de sustentação do processo, grupos no
whatsapp, acompanhamento clínico, discussões procedentes. No
entanto, a duração, dentro do domingo, ainda se mostrava bastante
cansativa para as pessoas envolvidas com seus cotidianos semanais
ocupados e eventualmente exaustivos.
<br/>Porém, tivemos muito sucesso
na instituição do Campo de Trabalho e Conteúdos, dinâmico, em
Processo e Progresso, Cumulativo e Flexível.</p>
<p>Agora, já tendo feito duas reuniões da Terapia de Grupo que constitui a
base do Curso de Formação, chegamos até uma nova proposta e
equilíbrio com 6 horas de esforço focado e direto, com breves intervalos
4 de café se necessários, levando todos os esforços outros dos partícipes
em consideração no total do ano.</p>
<p>E aqui estamos.</p>
<p>A formação implica no mínimo em 500 horas de participação certificada,
o que torna a pessoa apta a receber um Certificado de Formação
Básica em Terapeuta Sistêmico, Transpessoal e Transdisciplinar com
Constelações.</p>
<p>Agradecemos sobremodo a participação e a confiança de todos/as, e
especialmente sua coragem em se dispor às dinâmicas de informação,
reflexão, análise e construção de uma práxis terapêutica de tanta
eficácia e dimensão.</p>
					
					</div>
				</div>
			</div>			
		</div>
	</div>
</div> <!-- end jumbotrom -->

<div class="jumbotron paddingPadrao">
					<h2 style="color:rgb(29,23,82); padding-bottom: 5px">Calendário do curso</h2>
					<div>
						<p>O curso se compõe de oito aulas práticas, participativas e dinâmicas, uma a cada mês, de abril a novembro de 2024. 
						<p>Uma aula por domingo.</p>
						<p>Das 9:00 horas da manhã às 15:00 horas.</p>
						<p>Com intervalos para café.</p>
					</div>
					<div>
						<h2 style="color:rgb(29,23,82)">Temas mensais.</h2>
						<div class="paddingPadrao">
						<ul style="list-style: none; font-size: medium;">
						<li><b>Abril (21)</b>: O Mapa Junguiano do Espaço da Mente.</li>
						<li><b>Maio (26)</b>: O Confronto com a Persona e com a Sombra.</li>
						<li><b>Junho (30)</b>: A Perspectiva dos Arquétipos e do Inconsciente Coletivo.</li>
						<li><b>Julho (28)</b>: Anima e Animus e a Totalidade do Titan Original.</li>
						<li><b>Agosto (25)</b>: Tipos Psicológicos. A Sincronicidade. A individuação. O Self.</li>
						<li><b>Setembro (29)</b>: A Criança, O Rebelde, O Amante, O Amigo.</li>
						<li><b>Outubro (27)</b>: O Sábio, O Mago, O Palhaço, O Líder.</li>
						<li><b>Novembro (24)</b>: O Aventureiro, O Herói, O Zé-Ninguém, O Criador.</li>
						</ul>
						</div>
					</div>
</div>

<div class="jumbotron" style="background-color: rgb(202,242,194);">			
<div align="center">
<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">Investimento</h2>
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">CURSO COMPLETO - 8 MÓDULOS</h2>

<h3 align="center">R$ 2400,00 parcelados em até 12 vezes.</h3>

<h3 align="center">Com desconto:<br/>R$ 1920,00 à vista ou no cartão de crédito, R$ 240,00 por módulo.<span style="background-color: red; color: white; padding: 3px">20% 0ff</span></b>.</h3>

<h3 align="center">No caso daqueles que já participaram nos anos anteriores:<br/>R$ 1.760,00 à vista ou no cartão de crédito, R$ 220,00 por módulo. <span style="background-color: red; color: white; padding: 3px">27% 0ff</span></h3>

<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">MÓDULO MENSAL - UNIDADE</h2>
<h3 align="center"><b>R$ 300</b>.</h3>

<h3 align="center">As inscrições são realizadas no local nos dias do curso.</h3>

<h3 align="center" hidden="true">Valor do curso e datas das aulas disponível no link a seguir <a target="blank" href="https://www.ameconstelacoesecursos.com/cursos" class="btn btn-success">Entre em contato e solicite</a></h3>

</div>
</div>
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
<br/>
</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
