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

<!-- Alerta Covid -->
<!-- <div class="alert alert-warning" role="alert">
  <h1>Devido ao atual cenário sanitário e obedecendo as regras de distânciamento social para evitar aglomerações em locais fechado as novas datas para realização
  desse curso estão em análise. </h1>
</div> -->

<div class="jumbotron" style="background-color: #ffffff">
	<div align="center">
		<div class="  cardViewTextNoBackground ">
			<h1 align="center" style="color:rgb(29,23,82)">Curso</h1>
			
			<table style="width: 100%">
				<tr>
					<td width="80%" class="paddingPadrao"><h2 style="color:rgb(29,23,82)">Curso livre de Formação em Terapia Transpessoal e disciplinar com Constelações Sistemicas</h2></td>
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
						<td>
							<div align="center">
								<img alt="" src="${imagem}/taro.jpg">
							</div>
						</td>
						<td>
							<div class="cardViewTextNoBackground">
								<p>Vamos discutir o sentido do caminho e o significado 
								<br/>da vida humana utilizando as tradições ocidentais 
								<br/>dos arcanos maiores do <b>Tarô & Astrologia</b>.</p> 
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
			
			<div align="center" style="color: yellow; -webkit-text-stroke-width: 1px; -webkit-text-stroke-color: #000;">
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
			</div>
			
			<!-- <h2 style="color:rgb(29,23,82)">Exigência de Ingresso</h2>
			<div class="paddingPadrao">
			<p>Terceiro Grau em qualquer área, completo ou em desenvolvimento.</p>
			</div> -->
			
			<!-- <h2 style="color:rgb(29,23,82)">Estrutura do Curso</h2> 
			<div class="paddingPadrao">
			<p>Implica em Vivência, Teoria e Prática em um processo terapêutico 
			fechado de nove sábados no âmbito transpessoal das Constelações Sistêmicas. 
			Uma transmissão teórica das perspectivas das abordagens conhecidas como Constelações 
			Sistêmicas e Transpessoal. 
			Um exercício prático de formação dos conteúdos essenciais destas abordagens. Uma proposta de Formação Continuada.</p>
			</div> -->
			
			<!-- <div hidden="true">
				<h2 style="color:rgb(29,23,82)">Este curso tem como conteúdos programáticos.</h2>
				<div class="paddingPadrao">
				<ul>
				<li>Modelos Energéticos Tradicionais e Exploratórios com Base na Perspectiva da Ciência.</li>
				<li>Noção de Modelos de Reflexão em contraponto a Modelos Cognitivos.</li>
				<li>Níveis de Expressão, Manifestação e Compreensão da Consciência.</li>
				<li>Compreensão de Percurso, Propósito, Significado e Verdade na Perspectiva da Realidade Humana.</li>
				<li>Reflexão Sobre Vida, Morte, Existência, Atos, Escolhas, Consequências, Destinos, Percursos.</li>
				<li>Entendimento sobre Acumulações, Saltos, Crises, Longas, Agudas, Expressivas, Manifestas, Tensionais.</li>
				<li>Percepção dos Contextos, Biológicos, Linguísticos, Discursivos, Narrativos, Estruturais, Sistêmicos, Econômicos, Sociais, Culturais, Políticos.</li>
				<li>Discussão sobre Emoção, Afeto, Amor, Vínculo, Pensamento, Percepção, Relacionamento Consigo, com o Próximo e com os Liames Sociais.</li>
				<li>Referenciação do que venha a ser, Dor, Sofrimento, Morte, Significado, Narrativa, Discurso, Terapia.</li>
				<li>Qual o Lugar, o Papel, a Ação Possível do Terapeuta no âmbito dos limites impostos pelo Narcisismo e seus Referentes, a Equanimidade, a Arrogância, a Humildade e o Medo.</li>
				<li>A regência e a dinâmica das Constelações Sistêmicas, seu âmbito e suas reais dimensões terapêuticas.</li>
				</ul>
				</div>
			</div> -->
			
			<div style="padding-top: 20px">
			
				<div class="jumbotron paddingPadrao" style="background-color: #F0FFFF;">
					<h2 style="color:rgb(29,23,82); padding-bottom: 5px">Calendário do curso</h2>
					<div>
						<p>O curso se compõe de oito aulas práticas, participativas e dinâmicas, uma a cada mês, de abril a novembro de 2022. 
						<p>Uma aula por domingo.</p>
						<p>Das 9:00 horas da manhã às 18:00 horas.</p>
						<p>Almoço das 13:00 às 14:00 horas (não incluso).</p>
					</div>
					
					<div class="paddingPadrao">	
						<table class="table table-bordered">
						  <tbody>
						    <tr>
						      <th scope="row">Módulo 1</th>
						      <td>16 de Abril</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 2</th>
						      <td>7 de Maio</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 3</th>
						      <td>20 de Junho</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 4</th>
						      <td>25 de Julho</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 5</th>
						      <td>22 de Agosto</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 6</th>
						      <td>19 de Setembro</td>
						    </tr>
						    <tr>
						      <th scope="row">Módulo 7</th>
						      <td>17 de Outubro</td>
						    </tr> 
						    <tr>
						      <th scope="row">Módulo 8</th>
						      <td>14 de Novembro</td>
						    </tr>    
						  </tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> <!-- end jumbotrom -->

<div align="center">
<h2 align="center" style="color:#151515; ">Módulos</h2>

<div class="paddingPadrao">
<table class="tableModulos">
  <tbody>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 1</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">16 de abril de 2023</p>      
      <p style="font-size: small; text-align: justify;">Cartas do Louco e do Mundo.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 2</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">7 de maio de 2023</p>
      <p style="font-size: small; text-align: justify;">Cartas do Mago, da Alta Sacerdotisa, do Sol e do Julgamento.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 3</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">29 de junho de 2030</p>
      <p style="font-size: small; text-align: justify;">Cartas da Imperatriz, do Imperador, da Estrela e da Lua.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 4</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">25 de junlho de 2023</p>      
      <p style="font-size: small; text-align: justify;">Carta do Hierofante, dos Amantes, do Demônio e da Torre.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 5</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">22 de agosto de 2023</p>
      <p style="font-size: small; text-align: justify;">Cartas da Carruagem e da Temperança.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 6</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">19 de setembro de 2023</p>
      <p style="font-size: small; text-align: justify;">Cartas da Força e da Morte.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 7</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">17 de outubro de 2023</p>      
      <p style="font-size: small; text-align: justify;">Cartas do Eremita e do Enforcado.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 8</p>
      <p style="font-size: medium; font-weight: bold;">Arcanos do Tarô</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">14 de novembro de 2023</p>
      <p style="font-size: small; text-align: justify;">Cartas da Roda da Fortuna e da Justiça.</p>
      </div>
      </td>
      <!-- <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 9</p>
      <p style="font-size: medium; font-weight: bold;">A Construção e a Formação do terapeuta de Constelações e Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">14 de Novembro de 2020</p>
      <p style="font-size: small; text-align: justify;">Uma resistência a redução de um instrumento clínico a um território de mercado. A questão da formação continuada. O que é um Terapeuta? Como se constitui? Qual a ideia e a imagem que temos de um Terapeuta? Com quais valores trabalha um Terapeuta? A Importância do Respeito ao Outro. A integração do Estranho. A compreensão dos processos de Estigmatização. Integração, Inclusão, Respeito, Compreensão, Diferenças. A apresentação dinâmica de cada trabalho de final de curso. O que é uma avaliação? A Avaliação em Processo. Os índices sociais e os índices pessoais. Apresentação das propostas dos cursos complementares.</p>
      </div>
      </td> -->
    </tr>     
  </tbody>
</table>
</div>
</div>

<!-- <div class="tamanhoEdicaoIndex" align="left">
<h2>Informações Gerais</h2>
<div style="text-align: justify;">
<p>Por ser um curso teórico, prático e constituído por uma vivência terapêutica em seu escopo, não há a possibilidade de uma participação que seja parcial em cada módulo, portanto, eventuais problemas, como atrasos significativos, saídas durante o módulo, ou consideravelmente antes do seu fechamento, além de ausências, implicam necessariamente serem repostas em outra versão do mesmo curso, com o custo daí então advindo.</p>
<p>Não há um compromisso fechado da nossa parte de que uma nova versão do curso, será disponível no ano seguinte àquele que está em processo. Há uma intenção de sequência e uma expectativa de possível reposição, não uma garantia.                                                                                                                                                                                                  </p>
<p>Cada módulo se constitui de 16 (dezesseis horas) de curso presencial e mais 4 (quatro horas) de atividades complementares, somando 20 (vinte horas por módulo).                                                                                                                                                                                                                                                                     </p>
<p>Serão oferecidas apostilas e material didático para cada Módulo.                                                                                                                                                                                                                                                                                                                                                                    </p>
<p>A conclusão dos mesmos em sua totalidade é obrigatória para obtenção do Certificado de Conclusão com a carga horária total de 200 (duzentas horas).                                                                                                                                                                                                                                                                                 </p>
<p>Cada módulo poderá ser feito em separado, e ao fechamento de cada um será oferecido um Certificado de Conclusão do Módulo em questão, com a carga horária de 20 (vinte horas).                                                                                                                                                                                                                                                      </p>
<p>Ao final de cada módulo será solicitada uma avaliação do mesmo pelo aluno como instrumento de feedback didático e pedagógico.                                                                                                                                                                                                                                                                                                       </p>
</div>
</div> -->

<div class="jumbotron" style="background-color: #A9E2F3;">	

<h2 align="center" style="color:#2E9AFE; font-weight: bold; ">Local</h2>

<!--  
<h3 align="center">Grupo integrado Fisioterapia</h3>
<p>Av. Sete de Setembro, 317 sala 708, Santa Rosa – Niterói - RJ</p>
<p>Próximo ao colégio Salesiano.</p>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3675.284993179031!2d-43.10146388398128!3d-22.902856785013796!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9983f798b2ce65%3A0x837a973c205e3223!2sAv.%20Sete%20de%20Setembro%2C%20317%20-%20Santa%20Rosa%2C%20Niter%C3%B3i%20-%20RJ%2C%2024230-251!5e0!3m2!1spt-BR!2sbr!4v1646761873622!5m2!1spt-BR!2sbr" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
-->

<h3 align="center">Grupo integrado Fisioterapia</h3>
<p>Ministro Otávio Kelly 465, Icaraí – Niterói - RJ</p>
<p>Em frente ao colégio Miraflores Niterói.</p>
<br/>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d867.2291893092904!2d-43.101372444114645!3d-22.906390180371016!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9983f97012fa2b%3A0x27feb9cba3bb9e25!2sR.%20Min.%20Ot%C3%A1vio%20Kelly%2C%20465%20-%20Icara%C3%AD%2C%20Niter%C3%B3i%20-%20RJ%2C%2024220-300!5e0!3m2!1spt-BR!2sbr!4v1659279890011!5m2!1spt-BR!2sbr" width="100%" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>

<div class="jumbotron" style="background-color: rgb(202,242,194);">			
<div align="center">
<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">Investimento</h2>
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">CURSO COMPLETO - 8 MÓDULOS</h2>
<h3 align="center">12x R$ 200, ou à vista <b>R$ 1.920 <span style="background-color: red; color: white; padding: 3px">20% 0ff</span></b>.</h3>

<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">MÓDULO MENSAL - UNIDADE</h2>
<h3 align="center"><b>R$ 300</b>.</h3>

<h3 align="center">As inscrições são realizadas no local nos dias do curso.</h3>

<h3 align="center" hidden="true">Valor do curso e datas das aulas disponível no link a seguir <a target="blank" href="https://www.ameconstelacoesecursos.com/cursos" class="btn btn-success">Entre em contato e solicite</a></h3>

</div>
</div>
</div>

<h3>Encaminhar este curso a um amigo!</h3>	
<form class="form-inline" action="<c:url value="/ame/sugerir/curso"/>" method="get">
  <div class="form-group mx-sm-3 mb-2">
    <input type="text" class="form-control" id="" name="nome" placeholder="Seu nome (opicional)">
  </div>
  <div class="form-group mx-sm-3 mb-2">
    <input type="email" class="form-control" id="" name="email" placeholder="E-mail (do amigo)" required="required">
  </div>
  <button type="submit" class="btn btn-success mb-2">Enviar</button>
</form>

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

<p class="paddingPadrao" style="font-size: x-large;">
<a href="<c:url value="/"></c:url>">Visite o Website.</a>
</p>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
