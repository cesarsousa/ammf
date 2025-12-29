<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/headerLib.jsp"%>

<div class="pgEmpresaAme" align="center">

	<div class="jumbotron">
		<%@ include file="/headerSite.jsp"%>
		<%@ include file="/menuPrincipal.jsp"%>

		<div id="logoAme"></div>

		<c:if test="${not empty msgSucesso}">
			<div class="msgBorder msgSucesso ponteiro closeClick">
				${msgSucesso}</div>
		</c:if>
		<c:if test="${not empty msgErro}">
			<div id="boxMsgErro" class="msgBorder msgErro ponteiro closeClick">
				${msgErro}</div>
		</c:if>

		<div align="center">
			<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
				<h2 align="center" style="color: rgb(29, 23, 82)">Apresentação</h2>
				<p>Desde 2019 que inauguramos a nossa Formação em Terapia
					Sistêmica Transpessoal, Transdisciplinar com Constelações.
					Atravessamos o período pandêmico entre 2020/1, e retomamos a nossa
					atividade em 2022.</p>
				<p>Desde então, já com três anos de curso, avançamos para uma
					perspectiva de Formação Continuada, sem interrupções, composta da
					seguinte forma:</p>

				<ul>
					<li>Um período de curso teórico-prático, presencial, a razão
						de uma aula por mês, sempre aos domingos, com seis horas de
						duração (das 9 às 15h), entre abril e novembro de cada ano. Este
						período é o centro organizador da formação. As demais atividades
						são agregadas ou prático-formativas.</li>
					<li>Um período de terapia-de-formação, presencial, a razão de
						uma aula por mês, sempre aos domingos, com seis horas de duração
						(das 9 às 15h), entre dezembro e março de cada ano.</li>
					<li>Uma frequência, considerada como carga horária para
						formação, às Constelações Sistêmicas, que correspondem a uma
						atividade mensal do nosso grupo, também sempre aos domingos.</li>
					<li>Um grupo de acompanhamento no WhatsApp.</li>
					<li>Duas reuniões mensais de Discussão Teórica e Supervisão
						Clínica, com duas horas de duração, destinada a responder a
						dúvidas teóricas, e fazer o acompanhamento de quem assim o deseje,
						de Casos Clínicos ou Situações de Relações Humanas e Profissionais
						desafiadoras.</li>
				</ul>
				<p>O modelo de formação continuada diz que, qualquer pessoa pode
					ingressar a qualquer momento com reconhecimento e aproveitamento do
					fluxo contínuo, sabendo que ele é essencialmente presencial, com
					ênfase na vivência dos conteúdos, na consistência profissional, na
					reflexão e na formação crítica respeitosa e construtiva.</p>
				<p>Anualmente, ao final do período de curso teórico-prático, são
					distribuídos certificados de curso livre, passíveis de serem
					utilizados como base à reivindicação de participação em entidades
					de Registro de Terapeutas, tais como a ABRATH e outras.</p>
				<p>Consideramos que a formação mínima, exigível para tanto, seja
					de 500 horas.</p>
				<p>As oito aulas-reuniões mensais deste ano buscam integrar o
					manejo clínico, pessoal e social, dos conceitos junguianos já
					trabalhados anteriormente. Lembrando para quem queira ingressar,
					que não é necessário conhecê-los previamente, uma vez que sua
					integração implica em sua reapresentação passo a passo.</p>
				<p>Os assuntos serão assim distribuídos por aula-mês:</p>

			</div>
		</div>
	</div>
	<!-- end jumbotrom -->

	<div class="cardViewTextNoBackground">
		<h1>Curso de Formação em Terapia Sistêmica, Transpessoal e Transdisciplinar com Constelações</h1>
	</div>

	<div class="jumbotron" style="background-color: #ffffff">
		<div align="center">
			<div class="  cardViewTextNoBackground ">
				<h1 align="center" style="color: rgb(29, 23, 82)">Curso 2026</h1>

				<div class="jumbotron paddingPadrao">
					<div>
						<p>O calendário com o contéudo e as datas para 2026 será
							disponibilizado no primeiro trismestre de 2026</p>
						<P>Atenciosamente.</P>
					</div>
					<table>
						<tr>
							<td>
								<div align="center" class="paddingPadrao">
									<img src="${imagem}/owner2.jpg"
										alt="Alcindo Miguel Martins Filho"
										class="img-circle destaqueFoto" width="250px" height="250px">
								</div>
							</td>
							<td>
								<h4>Dr. Alcindo Miguel Martins Filho</h4>
								<h4>Doutor pela Universidade Federal Fluminense, possui
									Mestrado e Especializações em áreas afins. Graduado em
									Psicologia e em Ciências Sociais.</h4>
								<h4>Com extensa atuação e formação nas áreas diretamente
									vinculadas à prática terapêutica, Educação, Terapia
									Comportamental Cognitiva - TCC, Hipnose, Constelações
									Sistêmicas, Acupuntura e Psicanálise.</h4>
								<h4>Tem ampla vivência em diversos sistemas terapêuticos,
									relativos às áreas humanas além de um contínuo aperfeiçoamento
									nas práticas correlatas de meditação, atenção e conhecimento
									tradicional.</h4>
							</td>
						</tr>
					</table>
				</div>

			</div>
			<!-- main -->
		</div>
		<!-- wrap -->

		<br /> <br /> <br />

		<div id="footer">
			<%@ include file="/footer.jsp"%>
		</div>