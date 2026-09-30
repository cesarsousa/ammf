package br.com.ammf.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import br.com.ammf.dto.RelatorioEmailDto;
import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Comentario;
import br.com.ammf.model.Constelacao;
import br.com.ammf.model.Curso;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Evento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.EmailService;
import br.com.ammf.service.LogAplicacaoService;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.ammf.utils.email.EnvioEmailEmSegundoPlano;

import javax.inject.Inject;

public class EmailServiceImp implements EmailService {

	private UsuarioRepository usuarioRepository;
	private PessoaRepository pessoaRepository;
	private Usuario administrador;
	private Email email;
	private HtmlMensagem htmlMensagem;
	private LogAplicacaoService logAplicacaoService;
	private EnvioEmailEmSegundoPlano envioEmailEmSegundoPlano;

	private Logger logger = Logger.getLogger(EmailServiceImp.class);

	@Inject
	public EmailServiceImp(
			UsuarioRepository usuarioRepository, 
			PessoaRepository pessoaRepository, 
			LogAplicacaoService logAplicacaoService,
			EnvioEmailEmSegundoPlano envioEmailEmSegundoPlano){
		this.usuarioRepository = usuarioRepository;
		this.pessoaRepository = pessoaRepository;
		this.logAplicacaoService = logAplicacaoService;
		this.envioEmailEmSegundoPlano = envioEmailEmSegundoPlano;
		this.administrador = this.usuarioRepository.obterAdministrador();
		this.email = new Email(administrador.isEmailAtivado(), administrador.isAdministrativo(), logAplicacaoService);
		this.htmlMensagem = new HtmlMensagem(administrador.isDominioPadrao());
		
	}

	@Override
	public void notificarNovoCadastroFeitoPeloCliente(Pessoa pessoa) throws EmailException {					
		// Notificar o cliente do recebimento e cadastramento.
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(), 
				htmlMensagem.getAssuntoNotificarClienteRecebimentoCadastro(), 
				htmlMensagem.getMensagemNotificarClienteRecebimentoCadastro(pessoa, administrador.getLinkedin()));
		
		// Notificar o administrador do novo cadatro
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				administrador.getEmailNotificacao(), 
				htmlMensagem.getAssuntoNotificarAdmRecebimentoCadastro(pessoa.getNome()), 
				htmlMensagem.getMensagemNotificarAdmRecebimentoCadastro(pessoa));
	}

	@Override
	public void notificarNovoCadastroFeitoPeloAdm(Pessoa pessoa) throws EmailException {		
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoCadastroPessoaPeloAdm(),
				htmlMensagem.getMensagemCadastroPessoaPeloAdm(pessoa, administrador.getLinkedin()));
	}

	@Override
	public void enviarSolicitacaoParaConfirmacaoCadastro(Pessoa pessoa) throws EmailException {		
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoSolicitacaoParaConfirmacaoCadastro(),
				htmlMensagem.getMensagemSolicitacaoParaConfirmacaoCadastro(pessoa, administrador.getLinkedin()));
	}

	@Override
	public List<Pessoa> notificarTextoParaPessoas(Notificacao notificacao, Texto texto) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();
		
		int totalDePessoas = pessoas.size();
		
		System.out.println("--- Inicio da rotina : notificarTextoParaPessoas ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);
		
		int count = 1;
		for(Pessoa pessoa : pessoas){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());
			
			try {
				enviarEmailNotificacaoTexto(notificacao, texto, pessoa);
			}catch (EmailException e) {
				pessoasNaoNotificadas.add(pessoa);
			}
						
			count++;
		}
		
		logger.info("--- Fim da rotina de Notificação de email ---");
		return pessoasNaoNotificadas;
	}

	private void enviarEmailNotificacaoTexto(Notificacao notificacao, Texto texto, Pessoa pessoa) throws EmailException{
		String mensagem;
		if(Notificacao.TEXTO_ATUALIZADO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeTextoAtualizado(texto, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.TEXTO_NOVO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeTextoAdicionado(texto, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de texto nao permitida: " + notificacao.toString());
		}
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, texto),
				mensagem);
	}

	@Override
	public void enviarEsclarecimentoSobreCadastro(Pessoa pessoa) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoEsclarecimentoCadastro(),
				htmlMensagem.getMensagemEsclarecimentoCadastro(pessoa, administrador.getLinkedin()));
		
	}

	@Override
	public void notificarNovoContatoFeitoCliente(Mensagem mensagem) throws EmailException {		
		
		// notificar o administrador no novo contato enviado
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				administrador.getEmailNotificacao(), 
				htmlMensagem.getAssuntoNotificarAdmNovoContato(mensagem.getNome()), 
				htmlMensagem.getMensagemNotificarAdmNovoContato(mensagem));
		
		// notificar o cliente do contato enviado
		email.enviarEmail(
				administrador.getEmail(), 
				administrador.getSenha(), 
				mensagem.getEmail(), 
				htmlMensagem.getAssuntoNotificarClienteNovoContato(), 
				htmlMensagem.getMensagemNotificarClienteNovoContato(mensagem, administrador.getLinkedin()));		
	}

	@Override
	public List<Pessoa> notificarResenhaParaPessoas(Notificacao notificacao, Resenha resenha) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();
		
		int totalDePessoas = pessoas.size();
		
		System.out.println("--- Inicio da rotina : notificarResenhaParaPessoas ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);
		
		int count = 1;
		for(Pessoa pessoa : pessoas){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());
			
			try {
				enviarEmailNotificacaoResenha(notificacao, resenha, pessoa);
			}catch (EmailException e) {
				pessoasNaoNotificadas.add(pessoa);
			}
						
			count++;
		}
		
		logger.info("--- Fim da rotina de Notificação de email ---");
		return pessoasNaoNotificadas;
	}

	private void enviarEmailNotificacaoResenha(Notificacao notificacao,	Resenha resenha, Pessoa pessoa) throws EmailException {
		String mensagem;
		if(Notificacao.RESENHA_NOVA == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeResenhaAdicionada(resenha, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.RESENHA_ATUALIZADA == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeResenhaAtualizada(resenha, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de resenha nao permitida: " + notificacao.toString());
		}	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, resenha),
				mensagem);		
	}

	@Override
	public List<Pessoa> notificarLivroParaPessoas(Notificacao notificacao, Livro livro) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();
		
		int totalDePessoas = pessoas.size();
		
		System.out.println("--- Inicio da rotina : enviarEmailNotificacaoLivro ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);
		
		int count = 1;
		for(Pessoa pessoa : pessoas){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());
			
			try {
				enviarEmailNotificacaoLivro(notificacao, livro, pessoa);
			}catch (EmailException e) {
				pessoasNaoNotificadas.add(pessoa);
			}
						
			count++;
			
		}
		logger.info("--- Fim da rotina de Notificação de email ---");
		return pessoasNaoNotificadas;
	}

	private void enviarEmailNotificacaoLivro(Notificacao notificacao, Livro livro, Pessoa pessoa) throws EmailException {
		String mensagem;
		if(Notificacao.LIVRO_NOVO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeLivroAdicionado(livro, administrador.getLinkedin(), pessoa);
		}else if(Notificacao.LIVRO_ATUALIZADO == notificacao){
			mensagem = htmlMensagem.getMensagemNotificacaoDeLivroAtualizado(livro, administrador.getLinkedin(), pessoa);
		}else{
			throw new EmailException("Tipo de notificacao de livro nao permitida: " + notificacao.toString());
		}	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssunto(notificacao, livro),
				mensagem);		
	}

	@Override
	public List<Pessoa> notificarLinkParaPessoas(Link link) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();
		
		int totalDePessoas = pessoas.size();
		
		System.out.println("--- Inicio da rotina : notificarLinkParaPessoas ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);
		
		int count = 1;
		for(Pessoa pessoa : pessoas){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());
			
			try {
				enviarEmailNotificacaoLink(link, pessoa);
			}catch (EmailException e) {
				pessoasNaoNotificadas.add(pessoa);
			}
						
			count++;
			
		}	
		
		logger.info("--- Fim da rotina de Notificação de email ---");
		return pessoasNaoNotificadas;
	}

	private void enviarEmailNotificacaoLink(Link link, Pessoa pessoa) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDeLink(link, administrador.getLinkedin(), pessoa);	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoLink(),
				mensagem);		
	}

	@Override
	public void notificarNovaFaqParaAdmin(Faq faq) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNovoFaqParaAdmin(faq.getNome()),
				htmlMensagem.getMensagemNotificacaoDeFaqParaAdmin(faq, administrador.getLinkedin()));		
	}

	@Override
	public void notificarRespostaFaqParaCliente(Faq faq) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				faq.getEmail(),
				htmlMensagem.getAssuntoRespostaFaqParaCliente(),
				htmlMensagem.getMensagemRespostaFaqParaCliente(faq, administrador.getLinkedin()));		
	}

	@Override
	public void notificarNovoComentarioParaAdmin(Texto texto, Comentario comentario) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarComentarioAdmin(texto.getTitulo(), Local.BLOG),
				htmlMensagem.getMensagemNotificarComentarioAdmin(texto.getTitulo(), comentario, Local.BLOG));	
	}

	@Override
	public void notificarNovoDepoimentoParaAdmin(Depoimento depoimento) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarDepoimentoAdmin(),
				htmlMensagem.getMensagemNotificarDepoimentoAdmin(depoimento));	
		
	}

	@Override
	public void notificarNovoComentarioParaAdmin(Resenha resenha, Comentario comentario) throws EmailException {
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoNotificarComentarioAdmin(resenha.getTitulo(), Local.RESENHA),
				htmlMensagem.getMensagemNotificarComentarioAdmin(resenha.getTitulo(), comentario, Local.RESENHA));		
	}

	@Override
	public int notificarConstelacaoParaPessoasEmSegundoPlano(final Constelacao constelacao) {
		// A lista e carregada aqui, ainda dentro do request (Session do Hibernate aberta);
		// o envio em si roda em outra thread e so usa objetos ja carregados.
		final List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);

		envioEmailEmSegundoPlano.executar("notificarConstelacaoParaPessoas", new Runnable() {
			@Override
			public void run() {
				RelatorioEmailDto relatorio = notificarConstelacaoParaPessoas(constelacao, pessoas);
				enviarRelatorioNotificacaoParaAdmin(
						"Constelação - " + constelacao.getLocalEvento().toString(),
						relatorio);
			}
		});

		return pessoas.size();
	}

	private RelatorioEmailDto notificarConstelacaoParaPessoas(final Constelacao constelacao, List<Pessoa> pessoas) {
		return notificarPessoas("notificarConstelacaoParaPessoas", pessoas, new EnvioParaPessoa() {
			@Override
			public void enviar(Pessoa pessoa) throws EmailException {
				enviarEmailNotificacaoConstelacao(constelacao, pessoa);
			}
		});
	}

	/** Envio de uma notificacao para uma pessoa da lista (constelacao, curso, ...). */
	private interface EnvioParaPessoa {
		void enviar(Pessoa pessoa) throws EmailException;
	}

	/**
	 * Apos esse numero de falhas seguidas o envio e interrompido: indica problema no servidor SMTP
	 * (fora do ar, credencial invalida, bloqueio) e nao nos destinatarios, e continuar so faria cada
	 * pessoa restante esperar o timeout de conexao antes de falhar.
	 */
	private static final int MAXIMO_FALHAS_SEGUIDAS = 10;

	private RelatorioEmailDto notificarPessoas(String rotina, List<Pessoa> pessoas, EnvioParaPessoa envio) {
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();

		int totalDePessoas = pessoas.size();

		System.out.println("--- Inicio da rotina : " + rotina + " ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);

		int contador = 1;
		int contadorEnviados = 0;
		int contadorErro = 0;
		int falhasSeguidas = 0;
		String ultimoErro = null;
		String motivoInterrupcao = null;

		for(Pessoa pessoa : pessoas){

			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + contador + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());

			try {
				envio.enviar(pessoa);
				contadorEnviados++;
				falhasSeguidas = 0;
			}catch (EmailException e) {
				ultimoErro = e.getMensagem();
				System.out.println("--- Falha no envio para " + pessoa.getEmail() + ": " + ultimoErro);
				pessoasNaoNotificadas.add(pessoa);
				contadorErro++;
				falhasSeguidas++;
			}catch (Exception e) {
				// Erro inesperado (ex.: e-mail nulo no cadastro) conta como falha desta pessoa,
				// sem interromper o envio para o restante da lista.
				ultimoErro = e.toString();
				System.out.println("--- Erro inesperado no envio para " + pessoa.getEmail() + ": " + ultimoErro);
				pessoasNaoNotificadas.add(pessoa);
				contadorErro++;
				falhasSeguidas++;
			}

			if(falhasSeguidas >= MAXIMO_FALHAS_SEGUIDAS){
				motivoInterrupcao = MAXIMO_FALHAS_SEGUIDAS + " falhas seguidas. Último erro: " + ultimoErro;
				System.out.println("--- Envio interrompido: " + motivoInterrupcao);
				break;
			}

			contador++;
		}

		logger.info("--- Fim da rotina de Notificação de email ---");

		RelatorioEmailDto relatorio = new RelatorioEmailDto(totalDePessoas, contadorEnviados, contadorErro, pessoasNaoNotificadas);
		relatorio.setMotivoInterrupcao(motivoInterrupcao);
		return relatorio;
	}

	private void enviarRelatorioNotificacaoParaAdmin(String descricao, RelatorioEmailDto relatorio) {
		StringBuilder conteudo = new StringBuilder();
		conteudo.append("Relatório do envio de notificação: <b>" + descricao + "</b><br/><br/>");
		conteudo.append("Total de pessoas cadastradas: " + relatorio.getTotalGeral() + "<br/>");
		conteudo.append("Enviados com sucesso: " + relatorio.getTotalInformado() + "<br/>");
		conteudo.append("Falhas no envio: " + relatorio.getTotalErros() + "<br/>");

		if(relatorio.getMotivoInterrupcao() != null){
			int naoProcessados = relatorio.getTotalGeral() - relatorio.getTotalInformado() - relatorio.getTotalErros();
			conteudo.append("<br/><b>ENVIO INTERROMPIDO</b> após " + relatorio.getMotivoInterrupcao() + "<br/>");
			conteudo.append("Pessoas não processadas (envio não tentado): " + naoProcessados + "<br/>");
			conteudo.append("Verifique a configuração/servidor de e-mail e dispare a notificação novamente.<br/>");

			logAplicacaoService.erro("Notificação " + descricao + " interrompida após " + relatorio.getMotivoInterrupcao()
					+ " | Não processadas: " + naoProcessados + " de " + relatorio.getTotalGeral());
		}

		if(relatorio.getTotalErros() > 0){
			StringBuilder emails = new StringBuilder();
			conteudo.append("<br/>E-mails não notificados:<ul>");
			for(Pessoa pessoa : relatorio.getEmailsNaoInformados()){
				conteudo.append("<li>" + pessoa.getEmail() + "</li>");
				emails.append(pessoa.getEmail()).append(" ");
			}
			conteudo.append("</ul>");

			logAplicacaoService.erro("Notificação " + descricao + ": falha no envio para "
					+ relatorio.getTotalErros() + " de " + relatorio.getTotalGeral() + " e-mail(s): " + emails.toString().trim());
		}

		try {
			enviarEmailSimples(
					administrador.getEmailNotificacao(),
					"Site AlcindoMiguel.com - Relatório de envio - " + descricao,
					conteudo.toString());
		} catch (EmailException e) {
			logAplicacaoService.erro("Não foi possível enviar o relatório da notificação " + descricao + " para o administrador: " + e.getMensagem());
		}
	}

	private void enviarEmailNotificacaoConstelacao(Constelacao constelacao, Pessoa pessoa) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDe(constelacao, administrador.getLinkedin(), pessoa);	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoConstelacao(constelacao),
				mensagem);	
		
	}

	@Override
	public void notificarConstelacaoParaEmail(Constelacao constelacao, String destinatario) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDe(constelacao, administrador.getLinkedin());	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				destinatario,
				htmlMensagem.getAssuntoConstelacao(constelacao),
				mensagem);
		
	}

	@Override
	public void notificarResenhaPredefinidaParaAdmin(Resenha resenha) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDe(resenha);
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoResenhaPredefinida(resenha),
				mensagem);
		
		
	}

	@Override
	public void enviarRelatorioConstelacao(Evento evento) throws EmailException {
		String mensagem = htmlMensagem.getMensagemRelatorioDe(evento);
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				administrador.getEmailNotificacao(),
				htmlMensagem.getAssuntoRelatorioConstelacao(evento),
				mensagem);
		
	}
	
	@Override
	public List<Pessoa> enviarEmailParaClientes(Mensagem mensagem, boolean todosOsContatos) throws EmailException {
		
		List<Pessoa> pessoasNaoNotificadas = new ArrayList<Pessoa>();
		
		if(todosOsContatos){
			List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);
			
			int totalDePessoas = pessoas.size();
			
			System.out.println("--- Inicio da rotina : enviarEmailParaClientes ---");
			System.out.println("--- Total de pessoas: " + totalDePessoas);
			
			int count = 1;
			for(Pessoa pessoa : pessoas){
				
				System.out.println("--- ------------------------------------------------------------------- ---");
				System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
				System.out.println("--- ------------------------------------------------------------------- ---");
				System.out.println("--- Cliente Email " + pessoa.getEmail());
				
				try {
					enviarEmailSimples(pessoa.getEmail(), mensagem.getTitulo(), mensagem.getConteudo());
				}catch (EmailException e) {
					pessoasNaoNotificadas.add(pessoa);
				}
							
				count++;
				
				
				
			}
		}
		if(mensagem.getEmail() != null && !mensagem.getEmail().isEmpty()){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação de email simples pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + mensagem.getEmail());
			
			try {
				enviarEmailSimples(mensagem.getEmail(), mensagem.getTitulo(), mensagem.getConteudo());
			}catch (EmailException e) {
				Pessoa pessoa = new Pessoa();
				pessoa.setEmail(mensagem.getEmail());
				pessoasNaoNotificadas.add(pessoa);
			}
			
		}
		
		logger.info("--- Fim da rotina de Notificação de email ---");
		return pessoasNaoNotificadas;
	}	

	private void enviarEmailSimples(String destinatario, String titulo, String conteudo) throws EmailException {
       String mensagem = htmlMensagem.getMensagemDeEmailSimples(conteudo);
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				destinatario,
				titulo,
				mensagem);
		
	}

	@Override
	public void enviarEmailSugestaoCurso(String nome, String email) throws EmailException {
		String mensagem = htmlMensagem.getMensagemSugestaoCurso(nome, email);
				
		this.email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				email,
				htmlMensagem.getAssuntoSugestaoCurso(),
				mensagem);
		
	}
	
	@Override
	public void notificarVideoParaPessoas(String titulo, String conteudo) throws EmailException {
		List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);

		String mensagemFinal = "Olá! Gostaria de compartilhar meu novo vído, postado no canal.<br/><br/>" + conteudo;
		
		int totalDePessoas = pessoas.size();
		
		System.out.println("--- Inicio da rotina : notificarVideoParaPessoas ---");
		System.out.println("--- Total de pessoas: " + totalDePessoas);
		
		int count = 1;
		for(Pessoa pessoa : pessoas){
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Notificação " + count + " de " + totalDePessoas + " pesssoa(s).");
			System.out.println("--- ------------------------------------------------------------------- ---");
			System.out.println("--- Cliente Email " + pessoa.getEmail());
			
			try {
				enviarEmailSimples(pessoa.getEmail(), titulo, mensagemFinal);
			}catch (EmailException e) {
				throw new EmailException("");
			}
			count++;
		}	
		
		logger.info("--- Fim da rotina de Notificação de email ---");
		
	}

	@Override
	public void notificarCursoParaEmail(Curso curso, String destinatario) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDeCurso(curso, administrador.getLinkedin());	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				destinatario,
				htmlMensagem.getAssuntoCurso(curso),
				mensagem);
	}

	@Override
	public int notificarCursoParaPessoasEmSegundoPlano(final Curso curso) {
		// A lista e carregada aqui, ainda dentro do request (Session do Hibernate aberta);
		// o envio em si roda em outra thread e so usa objetos ja carregados.
		final List<Pessoa> pessoas = pessoaRepository.listarPorStatus(Status.CONFIRMADO, Situacao.ATIVO);

		envioEmailEmSegundoPlano.executar("notificarCursoParaPessoas", new Runnable() {
			@Override
			public void run() {
				RelatorioEmailDto relatorio = notificarCursoParaPessoas(curso, pessoas);
				enviarRelatorioNotificacaoParaAdmin(
						"Curso - " + curso.getLocalEvento(),
						relatorio);
			}
		});

		return pessoas.size();
	}

	private RelatorioEmailDto notificarCursoParaPessoas(final Curso curso, List<Pessoa> pessoas) {
		return notificarPessoas("notificarCursoParaPessoas", pessoas, new EnvioParaPessoa() {
			@Override
			public void enviar(Pessoa pessoa) throws EmailException {
				enviarEmailNotificacaoCurso(curso, pessoa);
			}
		});
	}

	private void enviarEmailNotificacaoCurso(Curso curso, Pessoa pessoa) throws EmailException {
		String mensagem = htmlMensagem.getMensagemNotificacaoDeCurso(curso, administrador.getLinkedin(), pessoa);	
		
		email.enviarEmail(
				administrador.getEmail(),
				administrador.getSenha(), 
				pessoa.getEmail(),
				htmlMensagem.getAssuntoCurso(curso),
				mensagem);	
		
	}

}
