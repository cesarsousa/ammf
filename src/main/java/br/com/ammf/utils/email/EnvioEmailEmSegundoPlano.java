package br.com.ammf.utils.email;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.annotation.PreDestroy;
import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;

import org.apache.log4j.Logger;

import br.com.ammf.service.LogAplicacaoService;

/**
 * Executa envios de e-mail em massa fora da thread do request, para que a requisicao AJAX
 * responda na hora em vez de estourar o timeout do Apache/mod_jk enquanto centenas de e-mails
 * sao enviados um a um.
 *
 * Usa uma unica thread: disparos simultaneos entram em fila e sao enviados em sequencia,
 * evitando rajadas paralelas no servidor SMTP.
 *
 * ATENCAO: a tarefa roda fora do escopo de request do CDI, portanto nao pode usar a Session
 * do Hibernate do request nem beans @RequestScoped. Carregue tudo o que for preciso
 * (entidades, listas) antes de chamar executar().
 */
@ApplicationScoped
public class EnvioEmailEmSegundoPlano {

	private static final Logger logger = Logger.getLogger(EnvioEmailEmSegundoPlano.class);

	private final ExecutorService executor = Executors.newSingleThreadExecutor();

	private LogAplicacaoService logAplicacaoService;

	protected EnvioEmailEmSegundoPlano() {
	}

	@Inject
	public EnvioEmailEmSegundoPlano(LogAplicacaoService logAplicacaoService) {
		this.logAplicacaoService = logAplicacaoService;
	}

	public void executar(final String descricao, final Runnable tarefa) {
		executor.submit(new Runnable() {
			@Override
			public void run() {
				try {
					tarefa.run();
				} catch (Throwable t) {
					String mensagem = "Falha inesperada no envio de e-mail em segundo plano (" + descricao + "): " + t;
					logger.error(mensagem, t);
					System.out.println("--- " + mensagem);
					// O log4j nao tem appender configurado em producao; grava tambem em LogAplicacao
					// para aparecer em /menu/erroAplicacao.
					try {
						logAplicacaoService.erro(mensagem);
					} catch (Throwable erroAoRegistrar) {
						logger.error("Nao foi possivel registrar a falha em LogAplicacao", erroAoRegistrar);
					}
				}
			}
		});
	}

	@PreDestroy
	public void encerrar() {
		executor.shutdown();
	}

}
