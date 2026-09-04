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
			<h2 align="center" style="color:rgb(29,23,82) ">Apresentação</h2>
			<p>Desde 2019 que inauguramos a nossa Formação em
Terapia Sistêmica Transpessoal, Transdisciplinar com
Constelações. Atravessamos o período pandêmico entre
2020/1, e retomamos a nossa atividade em 2022.</p>
			<p>Desde então, já com três anos de curso, avançamos para uma
perspectiva de Formação Continuada, sem interrupções,
composta da seguinte forma:</p>

			<ul>
				<li>Um período de curso teórico-prático, presencial, a razão
de uma aula por mês, sempre aos domingos, com seis horas
de duração (das 9 às 15h), entre abril e novembro de cada
ano. Este período é o centro organizador da formação. As demais
atividades são agregadas ou prático-formativas.</li>
				<li>Um período de terapia-de-formação, presencial, a razão
de uma aula por mês, sempre aos domingos, com seis horas
de duração (das 9 às 15h), entre dezembro e março de cada
ano.</li>
				<li>Uma frequência, considerada como carga horária para
formação, às Constelações Sistêmicas, que correspondem a
uma atividade mensal do nosso grupo, também sempre aos
domingos.</li>
				<li>Um grupo de acompanhamento no WhatsApp.</li>
				<li>Duas reuniões mensais de Discussão Teórica e
Supervisão Clínica, com duas horas de duração, destinada a
responder a dúvidas teóricas, e fazer o acompanhamento de
quem assim o deseje, de Casos Clínicos ou Situações de
Relações Humanas e Profissionais desafiadoras.</li>
			</ul> 
			<p>O modelo de formação continuada diz que, qualquer pessoa
pode ingressar a qualquer momento com reconhecimento e
aproveitamento do fluxo contínuo, sabendo que ele é
essencialmente presencial, com ênfase na vivência dos
conteúdos, na consistência profissional, na reflexão e na
formação crítica respeitosa e construtiva.</p>
			<p>Anualmente, ao final do período de curso teórico-prático, são
distribuídos certificados de curso livre, passíveis de serem
utilizados como base à reivindicação de participação em
entidades de Registro de Terapeutas, tais como a ABRATH e
outras.</p>
			<p>Consideramos que a formação mínima, exigível para tanto,
seja de 500 horas.</p>
			<p>As oito aulas-reuniões mensais deste ano buscam integrar o
manejo clínico, pessoal e social, dos conceitos junguianos já
trabalhados anteriormente. Lembrando para quem queira
ingressar, que não é necessário conhecê-los previamente, uma
vez que sua integração implica em sua reapresentação passo
a passo.</p>
			<p>Os assuntos serão assim distribuídos por aula-mês:</p>
			
		</div>
	</div>
</div> <!-- end jumbotrom -->

<div class="alert alert-warning" role="alert">
  <h1>Curso de Formação em Terapia Sistêmica, Transpessoal e Transdisciplinar com Constelações</h1>
</div>

<div class="jumbotron" style="background-color: #ffffff">
	<div align="center">
		<div class="  cardViewTextNoBackground ">
			<h1 align="center" style="color:rgb(29,23,82)">Curso 2025</h1>
			
			<table style="width: 100%">
				<tr>
					<td width="80%" class="paddingPadrao">
					<h2 style="color:rgb(29,23,82)">A Prática Terapêutica Transpessoal e das Constelações
Sistêmicas sob a Perspectiva Junguiana..</h2></td>
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
								<p>Certificado de 120 horas de formação ou proporcional a participação efetiva.</p>
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
			
			<!--
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
</div> --><!-- end jumbotrom -->

<div class="jumbotron paddingPadrao">
					<h2 style="color:rgb(29,23,82); padding-bottom: 5px; text-align: center">Calendário do curso</h2>
					<div>
						<p>O curso se compõe de oito aulas práticas, participativas e dinâmicas, uma a cada mês, de abril a novembro de 2025. 
						<p>Uma aula por domingo.</p>
						<p>Das 9:00 horas da manhã às 15:00 horas.</p>
						<p>Com intervalos para café.</p>
					</div>
					<div>
						<h2 style="color:rgb(29,23,82); text-align: center">Temas mensais</h2>
						<div class="paddingPadrao">
						<ul style="list-style: none; font-size: medium;">
						<li><b>27 de Abril</b>
						<br/>A Fantasia Ativa como campo de prospecção e trabalho com
as imagens geracionais e criativas originárias nos complexos
ocultos no inconsciente.<br/>Este é o módulo inaugural, centrado no trabalho prático que se
constitui com a Técnica das Visualizações. Temos então sua
apresentação, justificativa transpessoal e transdisciplinar, bem
como um aprendizado de manejo e uso específico.<br/><br/></li>
						<li><b>25 de Maio</b>
						<br/>A apresentação e a exploração da terapia regressiva em seus
diferentes aspectos: resolução de problemas atuais, confronto
com imagens emergentes na consciência, conscientização,
reordenação, reescritura e compreensão das fixações libidinais
inconscientes.<br/>Módulo destinado às técnicas de visualização regressivas,
incluindo o que é conhecido como ‘de vidas passadas’, com a
compreensão de que atuamos, essencialmente mas não tão
somente, em uma abordagem fenomenológica junguiana.<br/><br/></li>
						<li><b>29 de Junho</b>
						<br/>As Constelações de lugar marcado, por exemplo, com papéis,
com bonecos, e a construção de genogramas vivos, únicos,
referenciais ou dinâmicos e combinados com radiestesia, as
Constelações a partir de visualizações, de sonhos e de
fantasias.<br/>Módulo focado na leitura junguiana e no manejo Clínico das
Constelações na exploração ampliada das ancestralidades.<br/><br/></li>
						<li><b>27 de Julho</b>
						<br/>Trabalhando a Persona com os instrumentos das visualizações
exploração regressiva, genograma e constelações dirigidas
para um fim.<br/>
Módulo essencialmente terapêutico voltado para o confronto,
conscientização e integração da Persona.<br/><br/></li>
						<li><b>24 de Agosto</b>
						<br/>Trabalhando a Sombra com os instrumentos das visualizações,
exploração regressiva, genograma e constelações dirigidas
para um fim.<br/>
Módulo essencialmente terapêutico destinado ao confronto,
conscientização e integração da Sombra.<br/><br/></li>
						<li><b>21 de Setembro</b>
						<br/>Trabalhando a Ânima e o Animus, com os instrumentos das
visualizações, exploração regressiva, genograma e
constelações dirigidas à um fim.<br/>
Módulo essencialmente terapêutico destinado ao confronto,
conscientização e integração do Animus e da Ânima.<br/><br/></li>
						<li><b>19 de Outubro</b>
						<br/>Trabalhando a atenção, a meditação, a reflexão e a
contemplação, enquanto técnicas de esforço integrativo, com o
inconsciente e o superconsciente, explorando e
compreendendo os conceitos.<br/>
Módulo voltado para integrar a atenção e seus manejos:
reflexão, meditação e contemplação, enquanto técnicas de uso
pessoal e terapêutico.<br/><br/></li>
						<li><b>23 de Novembro</b>
						<br/>A percepção do Arquétipo do Self como um instrumento de
autoconhecimento e direção existencial, bem como referencial
clínico.<br/>
Módulo final, integrativo dos trabalhos do ano enquanto ganho
global de Auto-investigação (Vichara) e direcionamento de
esforço construtivo e verdadeiro.<br/><br/></li>
						</ul>
						</div>
					</div>
</div>

<div class="jumbotron" style="background-color: rgb(202,242,194);">			
<div align="center">
<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">Investimento</h2>
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">CURSO COMPLETO - 8 MÓDULOS</h2>

<h3 align="center">R$ 2.640,00 (R$ 320,00 por Módulo)</h3>

<h3 align="center">Com desconto: <span style="background-color: red; color: white; padding: 3px">15% 0ff</span><br/>R$ 2.200,00 (R$ 275,00 por Módulo, para pagamento em
cartão de crédito em até 12 vezes, e também, disponível para
quem já fez, em qualquer momento, o curso anteriormente).</h3>

<h3 align="center">À Vista: <span style="background-color: red; color: white; padding: 3px">25% 0ff</span><br/>R$ 2.000,00 (R$ 250,00 por módulo para pagamento à vista
em dinheiro ou PIX)</h3>

<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">MÓDULO MENSAL - UNIDADE</h2>
<h3 align="center"><b>R$ 320</b> ou 
					<br/><b>R$ 275</b> para quem já fez, em qualquer momento, o curso anteriormente.</h3>

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
