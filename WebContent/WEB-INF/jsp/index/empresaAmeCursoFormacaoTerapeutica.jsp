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
  <h1>Devido ao atual cenário sanitário e obedecendo as regras de distânciamento social para evitar aglomerações em locais fechado as novas datas para realização
  desse curso estão em análise. </h1>
</div>

<div class="jumbotron" style="background-color: #ffffff">
<div align="center">
<div class="  cardViewTextNoBackground ">
<h1 align="center" style="color:rgb(29,23,82)">Curso</h1>

<table style="width: 100%">
<tr>
<td width="80%" class="paddingPadrao"><h2 style="color:rgb(29,23,82)">Curso Livre de Formação Básica em Constelações Sistêmicas
e Terapia Transpessoal (Manejo Pessoal e Interpessoal da Consciência nos Campos Terapêuticos)</h2></td>
<td width="20%" class="paddingPadrao"><img class="ml-3" src="${imagem}/seloCurso.jpg" alt="selo de registro do curso"></td>
</tr>
</table>

<div align="center"><iframe width="560" height="315" src="https://www.youtube.com/embed/WfX1OKVEuLU" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe></div>

<h2 style="color:rgb(29,23,82)">Finalidade</h2>
<div class="paddingPadrao">
<p>Este curso busca possibilitar a construção de uma base necessária para a compreensão, 
educação continuada, e o exercício profissional de uma Terapia que se baseia na Prática 
das Constelações Sistêmicas com um enfoque Transpessoal, apoiada em uma abordagem que componha regência, 
vivência, terapia, aprendizagem e formação profissional.</p> 
</div>

<h2 style="color:rgb(29,23,82)">A quem se destina</h2>
<div class="paddingPadrao">
<p>Todas as pessoas que desejem conhecer a si mesmas; 
aperfeiçoar seus recursos íntimos e interpessoais; 
compreender e aprender a vivenciar melhor os relacionamentos íntimos, 
familiares, profissionais, econômicos, culturais e sociais; 
participando de um processo terapêutico onde terão as condições para confrontar suas memórias, 
dores e vivências desafiadoras de uma forma nova e dinâmica; 
entendendo uma abordagem energética, integrativa e sistêmica da vida; 
e tendo uma iniciação a prática das Constelações Familiares e Sistêmicas, 
em conjunto com Metodologia Científica, Existencialismo, Fenomenologia, Teoria das Complexidades e Sistemas.

</p>
</div>

<h2 style="color:rgb(29,23,82)">Exigência de Ingresso</h2>
<div class="paddingPadrao">
<p>Terceiro Grau em qualquer área, completo ou em desenvolvimento.</p>
</div>

<h2 style="color:rgb(29,23,82)">Estrutura do Curso</h2> 
<div class="paddingPadrao">
<p>Implica em Vivência, Teoria e Prática em um processo terapêutico 
fechado de nove sábados no âmbito transpessoal das Constelações Sistêmicas. 
Uma transmissão teórica das perspectivas das abordagens conhecidas como Constelações 
Sistêmicas e Transpessoal. 
Um exercício prático de formação dos conteúdos essenciais destas abordagens. Uma proposta de Formação Continuada.</p>
</div>

<h2 style="color:rgb(29,23,82)">Conteúdos Estruturantes envolvidos na formação.</h2>
<div class="paddingPadrao">
<ul>
<li>Introdução às Constelações Familiares, Sistêmicas, Estruturantes, Mediais.</li>
<li>Compreensão de Percurso, Propósito, Significado e Verdade na Perspectiva da Realidade Humana.</li>
<li>Reflexão Sobre Vida, Morte, Existência, Atos, Escolhas, Consequências, Destinos, Percursos.</li>
<li>Entendimento Sobre Acumulações, Saltos, Crises Longas, Agudas, Expressivas, Manifestas, Tensionais.</li>
<li>Percepção dos Contextos, Biológicos, Linguísticos, Discursivos, Narrativos, Estruturais, Sistêmicos, Econômicos, Sociais, Culturais, Políticos.</li>
<li>Discussão sobre Emoção, Afeto, Amor, Vínculo, Pensamento, Percepção, Relacionamento Consigo, com o Próximo e com os Liames Sociais.</li>
<li>Referenciação do que venham a ser, Dor, Sofrimento, Morte, Significado, Narrativa, Discurso, Terapia.</li>
<li>Qual o Lugar, o Papel, a Ação Possível do Terapeuta no âmbito dos limites impostos pelo Narcisismo e seus Referentes, a Equanimidade, a Arrogância, a Humildade e o Medo.</li>
</ul>
</div>

<div hidden="true">
	<h2 style="color:rgb(29,23,82)">Constituição e calendário do curso</h2>
	<div class="paddingPadrao">
	<p>9 módulos mensais a serem ministrados de março a novembro de 2020.</p>
	<p>Um módulo por sábado.</p>
	<p>Das 9:00 horas da manhã às 18:00 horas.</p>
	<p>Almoço das 13:00 às 14:00 horas (não incluso).</p>
	<p>Material didático (incluso).</p>

	<table class="table table-bordered">
	  <tbody>
	    <tr>
	      <th scope="row">Módulo 1</th>
	      <td>21 de Março</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 2</th>
	      <td>18 de Abril</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 3</th>
	      <td>16 de Maio</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 4</th>
	      <td>20 de Junho</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 5</th>
	      <td>25 de Julho</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 6</th>
	      <td>22 de Agosto</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 7</th>
	      <td>19 de Setembro</td>
	    </tr>
	    <tr>
	      <th scope="row">Módulo 8</th>
	      <td>17 de Outubro</td>
	    </tr> 
	    <tr>
	      <th scope="row">Módulo 9</th>
	      <td>14 de Novembro</td>
	    </tr>    
	  </tbody>
	</table>
</div>

</div>
</div>
</div>
</div> <!-- end jumbotrom -->

<div class="jumbotron">
<div align="center">
<h2 align="center" style="color:#151515; ">Módulos</h2>

<div class="paddingPadrao">
<table class="tableModulos">
  <tbody>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 1</p>
      <p style="font-size: medium; font-weight: bold;">A Prática e o Referencial das Constelações e do Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">21 de Março de 2020</p>      
      <p style="font-size: small; text-align: justify;">Apresentação da Proposta de uma Terapia de Constelações e Transpessoal (com Práticas de Percepção da Consciência enquanto uma Dinâmica). A perspectiva da Ciência, Metodologia e Epistemologia. Os enfoques teóricos da Mente e suas definições. A Consciência como questão. Os Mapas da Mente. Vivências práticas sobre os níveis da mente. A perspectiva da Terapia de Constelações e Transpessoal. Modelos Energéticos Tradicionais e Exploratórios com Base na Perspectiva da Ciência. Noção de Modelos de Reflexão em contraponto a Modelos Cognitivos. Níveis de Expressão, Manifestação e Compreensão da Consciência. Debates.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 2</p>
      <p style="font-size: medium; font-weight: bold;">A Prospecção e o Diagnóstico em Processo nas Constelações e no Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">18 de Abril de 2020</p>
      <p style="font-size: small; text-align: justify;">A questão da verificação, validação e construção de uma hipótese diagnóstica em processo, da realização de uma imagem diagnóstica dinâmica, enquanto um objeto realizado a cada momento por uma relação dialógica de confiança, acolhimento e cuidado com uma perspectiva de prática em Constelação e Transpessoal. Uma primeira abordagem ao Real, a Realidade, a Imagem interveniente enquanto uma construção social da Realidade. Uma análise do Ato, do Fato, da Natureza, do Humano, do Correto e do Justo.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 3</p>
      <p style="font-size: medium; font-weight: bold;">A Diferença entre Transe Mediúnico, Hipnótico e o Trabalho de Constelações e Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">16 de Maio de 2020</p>
      <p style="font-size: small; text-align: justify;">As questões inerentes a influência, a produção e ao mercado na prática das Constelações e do Transpessoal. A questão da Objetificação. Os mapas de acesso ao Inconsciente e os gatilhos de dor e resgate. As manobras de troca imagética. A questão da fantasia e da verdade: Não confio mais na minha neurótica. As palavras e as coisas: o mapa não é o território. O equilíbrio do ser e as crises longas. Os cuidados com posições de manejo arrogantes.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 4</p>
      <p style="font-size: medium; font-weight: bold;">O Manejo da Morte nas Constelações e no Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">20 de Junho de 2020</p>      
      <p style="font-size: small; text-align: justify;">Realização do entendimento da Morte como um dado essencial a compreensão de um sentido para a vida. As etapas da morte e do morrer. Manejo das Perspectivas da Morte e do Morrer (com os estágios da Morte e do Morrer e o manejo clínico da Velhice, Sofrimento, Dor e Morte). Os acessos necessários ao Campos dos Mortos e as restaurações e encaminhamentos essenciais a saúde. Morte natural, acidental, em sofrimento, a perspectiva de abordagem do suicídio. A questão do Luto necessário e patológico. O manejo do Luto. As imagens do confronto com o desconhecido. A questão dos modelos espirituais e a questão da Fé.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 5</p>
      <p style="font-size: medium; font-weight: bold;">As Constelações Familiares, Sistêmicas e Mediais no âmbito Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">25 de Julho de 2020</p>
      <p style="font-size: small; text-align: justify;">A origem dos processos de Constelação. Constelações Sistêmicas compreendidas no âmbito do Ser Como Fluxo em um Flash (com práticas demonstrativas e exposição de manejo). As leis da Conservação da Energia, da Ordem e do Pertencimento. A questão das abordagens fenomenológica, estruturalista, sistêmica e das situações desconhecidas. O método de Constelação apropriado, e reordenado, como sendo uma prática terapêutica útil no âmbito da construção de uma clínica voltada a necessidade dos clientes. A questão das tribos e das famílias. O método da segmentação e desconstrução das estases imagéticas enraizadas na realização da Identidade e do Narcisismo. As Constelações Familiares, Sistêmicas, Mediais. A apropriação do trabalho de Constelações em múltiplos níveis de demanda social, cultural, econômica, política e biológica.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 6</p>
      <p style="font-size: medium; font-weight: bold;">Integração de Sonhos e Fantasias através das Constelações Sistêmicas</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">22 de Agosto de 2020</p>
      <p style="font-size: small; text-align: justify;">As diferentes abordagens e mapas sobre as fantasias, o sonhar e os sonhos. Integração Narrativa de Sonhos e Fantasias. A questão dos modelos da mente e o lugar da Consciência de Si, da Consciência como oscilação de percepção. A totalidade do Ser e a questão da dinâmica comunicacional Consciente, pré-Consciente e inconsciente. A questão linguística, da percepção e da memória. A questão do Espaço e do Pensamento e do Tempo e do Afeto. O manejo clínico das fantasias. Angústia, Ansiedade, Dor, Sofrimento, Doença e Morte. Os diferentes níveis da Consciência e a noção intrigante do Ser-Aí.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 7</p>
      <p style="font-size: medium; font-weight: bold;">A Terapia de Vidas Passadas como foco de Constelações Sistêmicas</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">19 de Setembro de 2020</p>      
      <p style="font-size: small; text-align: justify;">As noções tradicionais de Reencarnação, Renascimento e Transmigração. Um aprofundamento das questões sobre o desconhecido, a morte, o sentido da vida. Terapia de Vidas Passadas (com as considerações sobre bloqueios atuais e os caminhos criativos da energia pela via da fantasia e do diálogo terapêutico, reflexão sobre Morte, Renascimento, Reencarnação e Transmigração como visões de cura) dentro do manejo das Constelações em uma abordagem Transpessoal. A diferença entre vida, existência, significado e verdade. A noção de trauma. A perspectiva imagética de abordagem do trauma de uma forma aceitável pela consciência. As técnicas e o tempo de cada um.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 8</p>
      <p style="font-size: medium; font-weight: bold;">Constelações e Transpessoal no Manejo da Mudança de Comportamento</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">17 de Outubro de 2020</p>
      <p style="font-size: small; text-align: justify;">A noção de comportamento, de reflexos condicionados e operantes, de mapas cognitivos e atenção dirigida. A importância das agendas de curto, médio e longo prazo. O manejo operacional dos focos e a noção de produtividade íntima. A instituição de planos e da organização do tempo e do movimento na realização dos desejos. A satisfação do bom como contraponto ao ótimo. As médias sociais e a Compreensão operacional da Persona. A noção de Estratégia, de Objetivo e de Método. Uma análise da autoimagem suficientemente boa em contraponto ao narcisismo como eixo existencial. Uma crítica ao Narcisismo das pequenas diferenças como contraponto a dinâmica da individuação. Apresentação dos desenvolvimentos de cada grupo para os trabalhos de final de curso, questões, escrita e reflexão em processo. A Metodologia da Construção dos Trabalhos científicos, da Forma e do contexto prático da Escritura de um Trabalho Monográfico.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 9</p>
      <p style="font-size: medium; font-weight: bold;">A Construção e a Formação do terapeuta de Constelações e Transpessoal</p>
      <p style="font-size: small; color: rgb(0,109,162); font-weight: bold;" align="right">14 de Novembro de 2020</p>
      <p style="font-size: small; text-align: justify;">Uma resistência a redução de um instrumento clínico a um território de mercado. A questão da formação continuada. O que é um Terapeuta? Como se constitui? Qual a ideia e a imagem que temos de um Terapeuta? Com quais valores trabalha um Terapeuta? A Importância do Respeito ao Outro. A integração do Estranho. A compreensão dos processos de Estigmatização. Integração, Inclusão, Respeito, Compreensão, Diferenças. A apresentação dinâmica de cada trabalho de final de curso. O que é uma avaliação? A Avaliação em Processo. Os índices sociais e os índices pessoais. Apresentação das propostas dos cursos complementares.</p>
      </div>
      </td>
    </tr>     
  </tbody>
</table>
</div>

</div>
</div> <!-- end jumbotrom -->

<div class="tamanhoEdicaoIndex" align="left">
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
</div>

<div class="jumbotron" style="background-color: #A9E2F3;" hidden="true">	

<h2 align="center" style="color:#2E9AFE; font-weight: bold; ">Local</h2>

<h3 align="center">Ballet Thaísa Jatobá</h3>
<p>Av. Sete de Setembro, 317 sala 708, Santa Rosa – Niterói - RJ</p>
<p>Próximo ao colégio Salesiano.</p>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d550.5748301000926!2d-43.0992446563184!3d-22.903139548724464!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9983f7a0192bb1%3A0x72f5a4ac2e4e131f!2sAv.+Sete+de+Setembro%2C+317+-+708+-+Icara%C3%AD%2C+Niter%C3%B3i+-+RJ%2C+24230-253!5e1!3m2!1spt-BR!2sbr!4v1535426993730" width="100%" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>

<div class="jumbotron" style="background-color: rgb(202,242,194);">			
<div align="center">
<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">Investimento</h2>
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">CURSO COMPLETO - 9 MÓDULOS</h2>
<h3 align="center">12x R$ 217, + R$100 (Inscrição) ou à vista <b>R$ 2.700</b>.</h3>

<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">MÓDULO MENSAL - UNIDADE</h2>
<h3 align="center">5x R$ 40, + R$100 (Inscrição) ou à vista <b>R$ 300</b>.</h3>

<h2 align="center">Para adquirir um de nossos planos <a target="blank" href="https://www.ameterapiaecursos.com" class="btn btn-success">Entre em contato e solicite</a></h2>

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

</div> 
	
<div class="paddingPadrao" align="center" hidden="true">
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


<p class="paddingPadrao" style="font-size: x-large;">
<a href="<c:url value="/"></c:url>">Visite o Website.</a>
</p>




</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
