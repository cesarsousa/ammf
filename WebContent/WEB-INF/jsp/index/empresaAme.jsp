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

<div class="jumbotron" style="background-color: #ffffff">
<div align="center">
<div class="  cardViewTextNoBackground ">
<h1 align="center" style="color:rgb(29,23,82)">Curso</h1>

<table style="width: 100%">
<tr>
<td width="80%" class="paddingPadrao"><h2 style="color:rgb(29,23,82)">Curso  Livre de Formação Terapêutica em Terapia Transpessoal (Manejo pessoal e interpessoal da Consciência nos níveis, Inconsciente, Consciente e Super Consciente).</h2></td>
<td width="20%" class="paddingPadrao"><img class="ml-3" src="${imagem}/seloCurso.jpg" alt="selo de registro do curso"></td>
</tr>
</table>

<h2 style="color:rgb(29,23,82)">Finalidade</h2>
<div class="paddingPadrao">
<p>Este Curso tem por finalidade possibilitar a construção de um alicerce necessário a compreensão, educação continuada e exercício profissional de uma Terapia de Foco Transpessoal, com uma abordagem que seja capaz de compor vivência, terapia, aprendizagem e formação profissional.</p> 
</div>

<h2 style="color:rgb(29,23,82)">A quem se destina</h2>
<div class="paddingPadrao">
<p>Todas as pessoas que desejem conhecer a si mesmas; aperfeiçoar seus recursos íntimos e interpessoais; compreender e aprender a vivenciar melhor os relacionamentos íntimos, familiares, profissionais e sociais; participar de um processo terapêutico onde terão condições de confrontar suas memórias, dores e vivências desafiadoras de uma forma nova e dinâmica; entender uma abordagem energética, integrativa e sistêmica da vida; ter uma iniciação às filosofias estruturantes da Metodologia Científica, Existencialismo, Fenomenologia, Teoria das Complexidades e Sistemas.</p>
</div>

<h2 style="color:rgb(29,23,82)">Exigência de Ingresso</h2>
<div class="paddingPadrao">
<p>Terceiro Grau em qualquer área, completo ou em desenvolvimento.</p>
</div>

<h2 style="color:rgb(29,23,82)">Estrutura do Curso</h2> 
<div class="paddingPadrao">
<p>Implica em Vivência, Teoria e Prática.                                          </p>
<p>Um processo terapêutico fechado de nove fins de semana no âmbito transpessoal.  </p>
<p>Uma transmissão teórica da perspectiva da abordagem conhecida como Transpessoal.</p>
<p>Um exercício prático de formação em itens constitutivos desta abordagem.        </p>
<p>Uma proposta de Formação Continuada.                                            </p>
</div>

<h2 style="color:rgb(29,23,82)">Conteúdos Estruturantes envolvidos na formação.</h2>
<div class="paddingPadrao">
<p>Compreensão de Percurso, Propósito, Significado e Verdade na Perspectiva da Realidade Humana.                                                                            </p>
<p>Reflexão Sobre Vida, Morte, Existência, Atos, Escolhas, Consequências, Destinos, Percursos.                                                                              </p>
<p>Entendimento Sobre Acumulações, Saltos, Crises Longas, Agudas, Expressivas, Manifestas, Tensionais.                                                                      </p>
<p>Percepção dos Contextos, Biológicos, Linguísticos, Discursivos, Narrativos, Estruturais, Sistêmicos, Econômicos, Socias, Culturais, Políticos.                           </p>
<p>Discussão sobre Emoção, Afeto, Amor, Vínculo, Pensamento, Percepção, Relacionamento Consigo, com o Próximo e com os Liames Sociais.                                      </p>
<p>Referenciação do que venham a ser, Dor, Sofrimento, Morte, Significado, Narrativa, Discurso, Terapia.                                                                    </p>
<p>Qual o Lugar, o Papel, a Ação Possível do Terapeuta no âmbito dos limites impostos pelo Narcisismo e seus Referentes, a Equanimidade, a Arrogância, a Humildade e o Medo.</p>
</div>


<h2 style="color:rgb(29,23,82)">Constituição e calendário do curso</h2>
<div class="paddingPadrao">
<p>9 módulos mensais a serem ministrados de março a novembro de 2019.</p>
<p>Um módulo por final de semana, sábado e domingo.                                                                          </p>
<p>Das 9:00 horas da manhã às 18:00 horas.                                                                              </p>
<p>Almoço das 13:00 às 14:00 horas (não incluso).                                                                      </p>
<p>Dois <i>Coffee Breaks</i> por dia de curso (manhã e tarde, inclusos).                           </p>
<p>Material didático (incluso).</p>

<table class="table table-bordered">
  <tbody>
    <tr>
      <th scope="row">Módulo 1</th>
      <td>16 e 17 de Março</td>
    </tr>
    <tr>
      <th scope="row">Módulo 2</th>
      <td>13 e 14 de Abril</td>
    </tr>
    <tr>
      <th scope="row">Módulo 3</th>
      <td>18 e 19 de Maio</td>
    </tr>
    <tr>
      <th scope="row">Módulo 4</th>
      <td>15 e 16 de Junho</td>
    </tr>
    <tr>
      <th scope="row">Módulo 5</th>
      <td>13 e 14 de Julho</td>
    </tr>
    <tr>
      <th scope="row">Módulo 6</th>
      <td>17 e 18 de Agosto</td>
    </tr>
    <tr>
      <th scope="row">Módulo 7</th>
      <td>14 e 15 de Setembro</td>
    </tr>
    <tr>
      <th scope="row">Módulo 8</th>
      <td>05 e 06 de Outubro</td>
    </tr> 
    <tr>
      <th scope="row">Módulo 9</th>
      <td>09 e 10 de Novembro</td>
    </tr>    
  </tbody>
</table>

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
      <p style="font-size: medium; font-weight: bold;">O Referencial Transpessoal</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 16 e 17 de Março de 2019</p>      
      <p style="font-size: small; text-align: justify;">Apresentação da Proposta de uma Terapia Transpessoal (com Práticas de Percepção da Consciência enquanto uma Dinâmica). A perspectiva da Ciência, Metodologia e Epistemologia. Os enfoques teóricos da Mente e suas definições. A Consciência como questão. Os Mapas da Mente. Vivências práticas sobre os níveis da mente. A perspectiva da Terapia Transpessoal. Modelos Energéticos Tradicionais e Exploratórios com Base na Perspectiva da Ciência. Noção de Modelos de Reflexão em contraponto a Modelos Cognitivos. Níveis de Expressão, Manifestação e Compreensão da Consciência. Debates.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 2</p>
      <p style="font-size: medium; font-weight: bold;">A Perspectiva de Prospecção e Diagnóstico pela via do Inconsciente</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 13 e 14 de Abril de 2019</p>
      <p style="font-size: small; text-align: justify;">Radiestesia instrumental adaptada ao Modelo de Manejo Clínico (com Práticas de Diagnóstico de Fluxo e Ação Individual e Ambiental). A metodologia de Pesquisa, Observação e Trabalho com o Inconsciente Implicado. A questão da verificação, validação e construção de um diagnóstico em processo, da realização de uma imagem diagnóstica dinâmica, enquanto um objeto realizado a cada momento por uma relação dialógica de confiança, acolhimento e cuidado. Uma primeira abordagem ao Real, a Realidade, a Imagem interveniente enquanto uma construção social da Realidade. Uma análise do Ato, do Fato, da Natureza, do Humano, do Correto e do Justo.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 3</p>
      <p style="font-size: medium; font-weight: bold;">A Hipnose Clínica</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 18 e 19 de Maio de 2019</p>
      <p style="font-size: small; text-align: justify;">Compreensão da Hipnose enquanto instrumento clínico com uma história bastante antiga no imaginário ocidental. Hipnose Clínica entendida como um instrumento de Diálogo Terapêutico Criativo (com práticas de exploração e treino de efetivação). As referências da antiguidade, da idade média, renascimento e moderna. As diferentes abordagens hipnóticas: Mesmerismo, Médica, Ericksoniana, Rápida, Instrumental e de Palco. As questões inerentes a influência, a produção e ao mercado. A questão da Objetificação. Os mapas de acesso ao Inconsciente e os gatilhos de dor e resgate. As manobras de troca imagética. A questão da fantasia e da verdade: Não confio mais na minha neurótica. As palavras e as coisas: o mapa não é o território. O equilíbrio do ser e as crises longas. Os cuidados com posições de manejo arrogantes.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 4</p>
      <p style="font-size: medium; font-weight: bold;">O Manejo da Morte</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 15 e 16 de Junho de 2019</p>      
      <p style="font-size: small; text-align: justify;">Realização do entendimento da Morte como um dado essencial a compreensão de um sentido para a vida. As etapas da morte e do morrer. Manejo das Perspectivas da Morte e do Morrer (com os estágios da Morte e do Morrer e o manejo clínico da Velhice, Sofrimento, Dor e Morte). Os acessos necessários ao Campos dos Mortos e as restaurações e encaminhamentos essenciais a saúde. Morte natural, acidental, em sofrimento, a perspectiva de abordagem do suicídio. A questão do Luto necessário e patológico. O manejo do Luto. As imagens do confronto com o desconhecido. A perspectiva humana de que a morte não existe. A ideologia da Religião na Idade Média e a Ideologia da Ciência na Modernidade enquanto instrumentos sociais de confronto com o desconhecido. A questão dos modelos espirituais e a questão da Fé.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 5</p>
      <p style="font-size: medium; font-weight: bold;">As Constelações Sistêmicas</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 13 e 14 de Julho de 2019</p>
      <p style="font-size: small; text-align: justify;">A origem dos processos de Constelação. Constelações Sistêmicas compreendidas no âmbito do Ser Como Fluxo em um Flash (com práticas demonstrativas e exposição de manejo). As leis da Conservação da Energia, da Ordem e do Pertencimento. A questão das abordagens fenomenológica, estruturalista, sistêmica e das situações desconhecidas. O método de Constelação apropriado, e reordenado, como sendo uma prática terapêutica útil no âmbito da construção de uma clínica voltada a necessidade dos clientes. A questão das tribos e das famílias. O método da segmentação e desconstrução das estases imagéticas enraizadas na realização da Identidade e do Narcisismo. As Constelações Familiares, Sistêmicas, Mediais. A apropriação do trabalho de Constelações em múltiplos níveis de demanda social, cultural, econômica, política e biológica.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 6</p>
      <p style="font-size: medium; font-weight: bold;">A integração dos Sonhos e das Fantasias</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 17 e 18 de Agosto de 2019</p>
      <p style="font-size: small; text-align: justify;">As diferentes abordagens e mapas sobre as fantasias, o sonhar e os sonhos: Freudiana, Junguiana, Médica, Tradicional. Integração Narrativa de Sonhos e Fantasias (com práticas de grupo voltadas para didática de casos individualizados). A questão dos modelos da mente e o lugar da Consciência de Si, da Consciência como oscilação de percepção. A totalidade do Ser e a questão da dinâmica comunicacional Consciente, pré-Consciente e inconsciente. A questão linguística, da percepção e da memória. A questão do Espaço e do Pensamento e do Tempo e do Afeto. Os sonhos lúcidos. As fantasias dirigidas e sua relação com os processos hipnóticos. O manejo clínico das fantasias. Angústia, Ansiedade, Dor, Sofrimento, Doença e Morte. Os diferentes níveis da Consciência e a noção intrigante do Ser-Aí.</p>
      </div>
      </td>
    </tr>
    <tr>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 7</p>
      <p style="font-size: medium; font-weight: bold;">Terapia de Vidas Passadas</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 14 e 15 de Setembro de 2019</p>      
      <p style="font-size: small; text-align: justify;">As noções tradicionais de Reencarnação, Renascimento e Transmigração. Um aprofundamento das questões sobre o desconhecido, a morte, o sentido da vida. Terapia de Vidas Passadas (com as considerações sobre bloqueios atuais e os caminhos criativos da energia pela via da fantasia e do diálogo terapêutico, reflexão sobre Morte, Renascimento, Reencarnação e Transmigração como visões de cura). A diferença entre vida, existência, significado e verdade. A noção de trauma. A perspectiva imagética de abordagem do trauma de uma forma aceitável pela consciência. As técnicas e o tempo de cada um. O campo de ação da Terapia de Vidas passadas e o respeito a diversidade de perspectivas e realidades humanas. A questão das abordagens estatísticas, qualitativas e significativas. Constituição de Grupos de Trabalho para Final de Curso. Instituição de Temáticas e Reflexão e Desempenho.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 8</p>
      <p style="font-size: medium; font-weight: bold;">Manejo de Mudança de Comportamento</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 05 e 06 de Outubro de 2019</p>
      <p style="font-size: small; text-align: justify;">A noção de comportamento, de reflexos condicionados e operantes, de mapas cognitivos e atenção dirigida. A importância das agendas de curto, médio e longo prazo. O manejo operacional dos focos e a noção de produtividade íntima. A instituição de planos e da organização do tempo e do movimento na realização dos desejos. A satisfação do bom como contraponto ao ótimo. As médias sociais e a Compreensão operacional da Persona. A noção de Estratégia, de Objetivo e de Método. Uma análise da autoimagem suficientemente boa em contraponto ao narcisismo como eixo existencial. Uma crítica ao Narcisismo das pequenas diferenças como contraponto a dinâmica da individuação. Apresentação dos desenvolvimentos de cada grupo para os trabalhos de final de curso, questões, escrita e reflexão em processo. A Metodologia da Construção dos Trabalhos científicos, da Forma e do contexto prático da Escritura de um Trabalho Monográfico.</p>
      </div>
      </td>
      <td>
      <div class="tdModulo">
      <p style="font-size: x-large; font-weight: bold;">Módulo 9</p>
      <p style="font-size: medium; font-weight: bold;">A Construção e a Formação do Terapeuta</p>
      <p style="font-size: x-small; color: rgb(0,109,162); font-weight: bold;" align="right">Dias 09 e 10 de Novembro de 2019</p>
      <p style="font-size: small; text-align: justify;">O lugar da pesquisa e o lugar do manejo tecnológico de um instrumento clínico. Uma resistência a redução de um instrumento clínico a um território de mercado. A questão da formação continuada. O que é um Terapeuta? Como se constitui? Qual a ideia e a imagem que temos de um Terapeuta? Com que valores trabalha um Terapeuta? A Importância do Respeito ao Outro. A integração do Estranho. A compreensão dos processos de Estigmatização. Integração, Inclusão, Respeito, Compreensão, Diferenças. Trabalhos de Final de Curso em Grupo com Contribuições individuais (com ênfase em um entendimento no que é pessoal, e no que é do grupo ao qual pertencemos). A apresentação dinâmica de cada trabalho de final de curso. O que é uma avaliação? A Avaliação em Processo. Os índices sociais e os índices pessoais. Apresentação das propostas dos cursos complementares.</p>
      </div>
      </td>
    </tr>     
  </tbody>
</table>
</div>

</div>
</div> <!-- end jumbotrom -->

<div class=" tamanhoEdicaoIndex  ">
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

<div class="jumbotron" style="background-color: #A9E2F3;">	

<h2 align="center" style="color:#2E9AFE; font-weight: bold; ">Local</h2>

<h3 align="center">Hotel OK</h3>
<p>Rua Senador Dantas, 24. Cinelândia - Centro - Rio de Janeiro</p>
<p>Próximo ao Metrô da Cinelândia.</p>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3675.05608811575!2d-43.17887478503432!3d-22.91130198500953!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x997f6229fb16ab%3A0xcd5abff0cee84fbb!2sHotel+OK!5e0!3m2!1spt-BR!2sbr!4v1543280317567" width="100%" height="600" frameborder="0" style="border:0" allowfullscreen></iframe>

<div class="jumbotron" style="background-color: rgb(202,242,194);">			
<div align="center">
<div class=" tamanhoEdicaoIndex cardViewTextNoBackground ">
<h2 align="center" style="color:rgb(41,131,24); font-weight: bold; ">Investimento</h2>
<h3 align="center">De R$ 900,00 (novecentos reais) à R$ 9.000,00 (nove mil reais).</h3>

<div class="paddingPadrao">
<table class="tableModulos">
  <tbody>
    <tr>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 900</p>
      <p style="font-size: small;">Valor de cada módulo pago até uma semana antes do mesmo.</p>
      </div>
      </td>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 1.000</p>
      <p style="font-size: small;">Valor de Cada Módulo pago no dia do mesmo.</p>
      </div>
      </td>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 7.200</p>
      <p style="font-size: small;">Valor Total pago à vista em dinheiro (20% de desconto).</p>
      </div>
      </td>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 7.200</p>
      <p style="font-size: small;">Valor Total para Pacientes (20% de desconto).</p>
      </div>
      </td>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 7.650</p>
      <p style="font-size: small;">Valor Total em cartão de Débito ou Crédito (15% de desconto).</p>
      <!-- <a target="blank" href="https://www.ameterapiaecursos.com" class="btn btn-success direita">Comprar</a> -->
      </div>
      </td>
      <td>
      <div class="tdPrecoModulo">
      <p style="font-size: x-large; font-weight: bold;">R$ 9.000</p>
      <p style="font-size: small;">Valor Total do Curso (sem descontos).</p>
      </div>
      </td>
    </tr>     
  </tbody>
</table>
</div>

<p align="center">Valores quando pagos em cartão de crédito podem ser parcelados em até doze vezes.</p>

<h2 align="center">Para adquirir um de nossos planos <a target="blank" href="https://www.ameterapiaecursos.com" class="btn btn-success">Entre em contato e solicite</a></h2>




</div>
</div>
</div> <!-- end jumbotrom -->



			<div align="right" class="tamanhoDefault">	
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
			
			
</div> <!-- end jumbotrom -->	
	
<div class="paddingPadrao">
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

</div>

</div> <!-- main -->
</div> <!-- wrap -->

<div id="footer">
<%@ include file="/footer.jsp" %>
</div>
