package br.com.ammf.service.imp;

import java.util.Date;

import br.com.ammf.model.Comentario;
import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Faq;
import br.com.ammf.model.Link;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Local;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ValidacaoServiceImp implements ValidacaoService {
	
	private PessoaRepository pessoaRepository;
	
	public ValidacaoServiceImp(PessoaRepository pessoaRepository){
		this.pessoaRepository = pessoaRepository;
	}
	
	@Override
	public boolean depoimento(Depoimento depoimento, Result result) {
			
		boolean validado = true;
		if(depoimento.getAutor() == null || depoimento.getAutor().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado<br/>");
			validado = false;
		}
		
		if(depoimento.getEmail() == null || depoimento.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado<br/>");
			validado = false;
		}else if(!ehEmailValido(depoimento.getEmail())){
			result.include("emailEmBranco", "O email est&aacute; com formato inv&aacute;lido<br/>");
			validado = false;
		}		
		
		if(depoimento.getConteudo() == null || depoimento.getConteudo().isEmpty()){
			result.include("textoEmBranco", "O depoimento deve ser informado<br/>");
			validado = false;
		}else if (depoimento.getConteudo().length() > 500){
			result.include("textoEmBranco", "O depoimento deve ter at&eacute; 500 caracteres<br/>");
			validado = false;
		}
		
		if(!validado){
			result.include("novoComentario", depoimento);
			
			/*
			 * flag para a pagina depoimentoCliente.jsp fechar a listagem dos depoimentos cadastrados 
			 * e mostrar o form de novo depoimento. 
			 */
			result.include("flagErroDepoimento", true);
			result.include("tituloErro", "<b>Verifique erros de preenchimento no final da p&aacute;gina</b><br/>");
		}
		
		return validado;
	}
	
	@Override
	public boolean mensagem(Mensagem mensagem, Result result) {
		boolean validado = true;
		if(mensagem.getNome() == null || mensagem.getNome().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado<br/>");
			validado = false;
		}
		
		if(mensagem.getEmail() == null || mensagem.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado<br/>");
			validado = false;
		}else if(!ehEmailValido(mensagem.getEmail())){
			result.include("emailEmBranco", "O email est&aacute; com formato inv&aacute;lido<br/>");
			validado = false;
		}
		
		if(mensagem.getConteudo() == null || mensagem.getConteudo().isEmpty()){
			result.include("conteudoEmBranco", "A mensagem deve ser informada<br/>");
			validado = false;
		}else if (mensagem.getConteudo().length() > 500){
			result.include("conteudoEmBranco", "O mensagem deve ter at&eacute; 500 caracteres<br/>");
			validado = false;
		}
		
		if(!validado){
			result.include("novaMensagem", mensagem);
			result.include("msgErroContatoCliente", true);
			result.include("tituloErro", "<b>Verifique erros de preenchimento no final da p&aacute;gina</b><br/>");
		}
		
		return validado;
	}
	
	public boolean blog(Texto texto, Result result) {
		boolean validado = true;
		if(texto.getTitulo() == null || texto.getTitulo().isEmpty()){
			result.include("tituloEmBranco", "O t&iacute;tulo deve ser informado<br/>");
			validado = false;
		}
		if(texto.getAutor() == null || texto.getAutor().isEmpty()){
			result.include("autorEmBranco", "O nome do autor deve ser informado<br/>");
			validado = false;
		}
		if(texto.getConteudo() == null || texto.getConteudo().isEmpty()){
			result.include("conteudoEmBranco", "O conte&uacute;do do texto deve ser informado");
			validado = false;
		}else if(texto.getConteudo().length() > 10000){
			result.include("conteudoEmBranco", "O conte&uacute;do do texto deve possuir no m&aacute;ximo 10000 caracteres");
			validado = false;
		}
		if(!validado){
			result.include("textoBlog", texto);
		}
		
		return validado;
	}
	
	public boolean pessoa(boolean aceiteCadastro, Pessoa pessoa, Result result) {
		/*pessoa.setNome(pessoa.getNome().trim());
		pessoa.setEmail(pessoa.getEmail().trim());*/
		
		boolean validada = true;
		boolean emailCadastrado = false;
		if(pessoa.getNome() == null || pessoa.getNome().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado<br/>");
			validada = false;
		}
		if(pessoa.getEmail() == null || pessoa.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado<br/>");
			validada = false;
		}else if (!ehEmailValido(pessoa.getEmail())){
			result.include("emailEmBranco", "O email est&aacute; com formato inv&aacute;lido<br/>");
			validada = false;
		}else{
			emailCadastrado = pessoaRepository.jaEstaCadastrada(pessoa.getEmail());
			if(emailCadastrado){
				result.include("emailEmBranco", "O email " + pessoa.getEmail() + " j&aacute; est&aacute; cadastrado neste site<br/>");
				result.include("emailJaCadastrado", true);
				System.out.println("aqui");
				//result.include("opcaoCadastro", true); // ??
				validada = false;
			}
		}
		
		if (!aceiteCadastro && !emailCadastrado) {
			result.include("aceiteEmBranco", "O termo de aceite de cadastro deve ser confirmado<br/>");
			validada = false;
		}
		
		if(!validada){
			result.include("pessoaCadastro", pessoa);
		}
		return validada;
	}

	@Override
	public boolean usuario(Usuario usuario, Result result) {
		boolean resultado = true;
		/*if(usuario.getUuid() == null || usuario.getUuid().isEmpty()){
			result.include("usuarioUuidBranco", "N&atilde;o foi poss&iacute;vel definir o uuid do usu&aacute;rio");
			resultado = false;
		}*/
		
		if(usuario.getNome() == null || usuario.getNome().isEmpty()){
			result.include("usuarioNomeBranco", "O nome deve ser informado");
			resultado = false;
		}
		
		if(usuario.getTelefone() == null || usuario.getTelefone().isEmpty()){
			usuario.setTelefone("nao disponivel");
		}
		
		if(usuario.getLogin() == null || usuario.getLogin().isEmpty()){
			result.include("usuarioLoginBranco", "O login deve ser informado");
			resultado = false;
		}		
		
		if(usuario.getEmail() == null || usuario.getEmail().isEmpty()){
			result.include("usuarioErroEmail", "O email deve ser informado");
			resultado = false;
		}else if (!ehEmailValido(usuario.getEmail())){
			result.include("usuarioErroEmail", "O email deve possuir um formato v&aacute;lido");
			resultado = false;
		}
		/*else if (!ehGmail(usuario.getEmail())){
			result.include("usuarioErroEmail", "O email deve deve ser do Gmail (seu_email@gmail.com)");
			resultado = false;
		}*/
		
		if(usuario.getSenha() == null || usuario.getSenha().isEmpty()){
			result.include("usuarioSenhaBranco", "A senha deve ser informada");
			resultado = false;
		}		
		
		if(usuario.getLinkedin() == null || usuario.getLinkedin().isEmpty()){
			usuario.setLinkedin("");
		}
		
		if(usuario.getEndereco() == null || usuario.getEndereco().isEmpty()){
			usuario.setEndereco("nao disponivel");
		}
		
		return resultado;
	}
	
	@Override
	public boolean cadastrarLivro(UploadedFile imagemLivro, Livro livro, Result result) {
		boolean validado = verificarCamposPreenchidos(imagemLivro, livro, result);		
		if(!validado){
			result.include("livroCadastro", livro);
			result.include("msgErroLojaCadastroLivro", true);
			result.include("flagCadastroLivroVazio", true);			
		}		
		return validado;
	}
	
	@Override
	public boolean atualizarLivro(UploadedFile imagemLivro, Livro livro, Result result) {		
		boolean validado = verificarCamposPreenchidos(imagemLivro, livro, result);
		
		if(!validado){
			result.include("livro", livro);
			result.include("msgErroLojaCadastroLivro", true);
			result.include("editarLivro", true);			
		}	
		
		return validado;
	}

	private boolean verificarCamposPreenchidos(UploadedFile imagemLivro, Livro livro, Result result) {
		boolean validado = true;
		if(livro.getAutor() == null || livro.getAutor().isEmpty()){
			result.include("autorEmBranco", "O nome do autor deve ser informado<br/>");
			validado = false;
		}
		
		if(livro.getTitulo() == null || livro.getTitulo().isEmpty()){
			result.include("tituloEmBranco", "O t&iacute;tulo deve ser informado<br/>");
			validado = false;
		}
		
		if(livro.getSubtitulo() == null || livro.getSubtitulo().isEmpty()){
			result.include("subtituloEmBranco", "O subt&iacute;tulo deve ser informado<br/>");
			validado = false;
		}
		
		if(livro.getPaginas() == 0){
			result.include("paginaEmBranco", "O n&uacute;mero de p&aacute;ginas deve ser informado<br/>");
			validado = false;
		}
		
		if(livro.getEdicao() == 0){
			result.include("edicaoEmBranco", "O n&uacute;mero da edi&ccedil;&atilde;o deve ser informado<br/>");
			validado = false;
		}		
		
		if(livro.getAno() == 0){
			validado = setMsgErroAno(result, "O ano de lan&ccedil;amento deve ser informado<br/>");
		}else{
			if(livro.getAno() < 1500){
				validado = setMsgErroAno(result, "O ano de lan&ccedil;amento deve ser superior a ano 1499<br/>");
			}
			
			if(livro.getAno() > DataUtils.getAnoCorrente()){
				validado = setMsgErroAno(result, "O ano de lan&ccedil;amento n&atilde;o pode ser posterior ao ano corrente<br/>");
			}
		}
		
		if(livro.getPreco() == null){
			result.include("precoEmBranco", "O pre&ccedil;o deve ser informado<br/>");
			validado = false;
		}
		
		if(livro.getLinkVenda() == null || livro.getLinkVenda().isEmpty()){
			result.include("linkEmBranco", "O link de venda do produto deve ser informado<br/>");
			validado = false;

		}else{
			if(livro.getLinkVenda().startsWith("www.")){
				String novoLink = "http://" + livro.getLinkVenda();
				livro.setLinkVenda(novoLink);
			}else if(!livro.getLinkVenda().startsWith("http") && !livro.getLinkVenda().startsWith("https")){
				result.include("linkEmBranco", "O link de venda do produto deve come&ccedil;ar com '<b>http://www.</b>'<br/>");
				result.include("comErroLink", "Erro");
				validado = false;
			}
		}
			
		if(imagemLivro != null){
			if(!imagemLivro.getContentType().startsWith("image")){
				result.include("fotoInvalida", "O arquivo para a capa do livro deve ser um arquivo de foto no formato .gif, .jpg ou .png.");
				validado = false;
			}
		}
		return validado;
	}
	
	@Override
	public boolean novaResenha(UploadedFile imagemResenha, Resenha resenha, Result result) {
		boolean validado = resenha(imagemResenha, resenha, result);			
		
		if(!validado){
			result.include("resenhaErroCadastro", true);
			result.include("resenha", resenha);
		}
		return validado;
	}
	
	@Override
	public boolean atualizarResenha(UploadedFile novaImagemResenha, Resenha resenha, Result result) {
		boolean validado = resenha(novaImagemResenha, resenha, result);
		
		if(!validado){
			result.include("resenhaErroAtualiza", true);
			result.include("resenha", resenha);
		}
		return validado;
	}
	
	private boolean resenha(UploadedFile imagemResenha, Resenha resenha, Result result){
		boolean validado = true;
		if(resenha.getAutor() == null || resenha.getAutor().isEmpty()){
			result.include("autorEmBranco", "O nome do autor deve ser informado<br/>");
			validado = false;
		}
		
		if(resenha.getTitulo() == null || resenha.getTitulo().isEmpty()){
			result.include("tituloEmBranco", "O t&iacute;tulo deve ser informado<br/>");
			validado = false;
		}
		
		if(resenha.getDescricao() == null || resenha.getDescricao().isEmpty()){
			result.include("descricaoEmBranco", "O coment&aacute;rio deve ser informado<br/>");
			validado = false;
		}else if(resenha.getDescricao().length() > 2250){
			result.include("descricaoEmBranco", "O coment&aacute;rio possui " + resenha.getDescricao().length() + " caracteres. Deve ter no m&aacute;ximo 2250 caracteres<br/>");
			validado = false;
		}
		
		if(imagemResenha != null){
			if(!imagemResenha.getContentType().startsWith("image")){
				result.include("fotoInvalida", "O arquivo para a apresenta&ccedil;&atilde;o da resenha deve ser um arquivo de foto no formato .gif, .jpg ou .png.");
				validado = false;
			}
		}
		
		return validado;		
	}
	
	@Override
	public boolean cadastrarLink(Link link, Result result) {
		boolean validado = true;
		
		link.setPostagem(new Date());
		
		if(link.getTitulo() == null || link.getTitulo().isEmpty()){
			result.include("linkEmBranco", "O t&iacute;tulo para o link deve ser informado<br/>");
			validado = false;
		}
		
		if(link.getUrl() == null || link.getUrl().isEmpty()){
			result.include("urlEmBranco", "A URL do link deve ser informada<br/>");
			validado = false;
		}else{
			if(link.getUrl().startsWith("www.")){
				String novoLink = "http://" + link.getUrl();
				link.setUrl(novoLink);
			}else if(!link.getUrl().startsWith("http://www.")){
				String novoLink = "http://www." + link.getUrl();
				link.setUrl(novoLink);
			}
			if(link.getUrl().length() > 500){
				result.include("urlEmBranco", "A URL do link excedeu o tamanho limite de 500 caracteres.<br/>");
				validado = false;
			}
		}
				
		if(link.getDescricao() == null || link.getDescricao().isEmpty()){
			result.include("descricaoEmBranco", "A descri&ccedil;&atilde;o do link deve ser informada<br/>");
			validado = false;
		}else if(link.getDescricao().length() > 500){
			result.include("descricaoEmBranco", "A descri&ccedil;&atilde;o do link excedeu o tamanho limite de 500 caracteres.<br/>");
			validado = false;
		}
				
		if(!validado){
			result.include("flagLinkErroCadastro", true);
			result.include("link", link);
		}		
		
		return validado;
	}
	
	@Override
	public boolean cadastrarFaq(Faq faq, Result result) {
		boolean validado = true;
		
		faq.setPostagem(new Date());
		
		
		if(faq.getNome() == null || faq.getNome().isEmpty()){
			result.include("nomeEmBranco", "O seu nome deve ser informado<br/>");
			validado = false;
		}
		
		if(faq.getEmail() == null || faq.getEmail().isEmpty()){
			result.include("emailEmBranco", "O seu email deve ser informado<br/>");
			validado = false;
		}else if(!ehEmailValido(faq.getEmail())){
			result.include("emailEmBranco", "O seu email est&aacute; com formato inv&aacute;lido<br/>");
			validado = false;
		}
		
		if(faq.getPergunta() == null || faq.getPergunta().isEmpty()){
			result.include("perguntaEmBranco", "A sua pergunta deve ser informada<br/>");
			validado = false;
		}
		
		if(!validado){
			result.include("flagFaqErroCadastro", true);
			result.include("faq", faq);
		}		
		
		return validado;
	}
	
	@Override
	public boolean cadastrarComentario(Comentario comentario, Result result) {
		boolean validado = true;
		
		comentario.setPostagem(DataUtils.getDateNow());
		comentario.setStatus(Status.PENDENTE);
		
		if(comentario.getNome() == null || comentario.getNome().isEmpty()){
			result.include("nomeEmBranco", "O seu nome deve ser informado<br/>");
			validado = false;
		}
		
		if(comentario.getEmail() == null || comentario.getEmail().isEmpty()){
			result.include("emailEmBranco", "O seu email deve ser informado<br/>");
			validado = false;
		}else if(!ehEmailValido(comentario.getEmail())){
			result.include("emailEmBranco", "O seu email est&aacute; com formato inv&aacute;lido<br/>");
			validado = false;
		}
		
		if(comentario.getConteudo() == null || comentario.getConteudo().isEmpty()){
			result.include("conteudoEmBranco", "O coment&aacute;rio deve ser informado<br/>");
			validado = false;
		}
			
		return validado;
	}
	
	@Override
	public String cadastrarComentario(
			String uuidTextoBlog,
			String comentarioNome, 
			String comentarioEmail,
			String comentarioConteudo) {
		
		StringBuilder sb = new StringBuilder();
		boolean validado =  true;
		
		if(uuidTextoBlog == null || uuidTextoBlog.isEmpty()){
			sb.append("N&atilde;o foi poss&iacute;vel cadastrar o seu coment&aacute;rio. Identifica&ccedil;&atilde;o do texto n&atilde;o encontrada.");
			return sb.toString();
		}
		
		if(comentarioNome == null || comentarioNome.isEmpty()){
			sb.append("O seu nome deve ser informado<br/>");
			validado = false;
		}
		
		if(comentarioEmail == null || comentarioEmail.isEmpty()){
			sb.append("O seu email deve ser informado<br/>");
			validado = false;
		}else if(!ehEmailValido(comentarioEmail)){
			sb.append("O seu email est&aacute; com formato inv&aacute;lido<br/>");
			validado = false;
		}
		
		if(comentarioConteudo == null || comentarioConteudo.isEmpty()){
			sb.append("O coment&aacute;rio deve ser informado<br/>");
			validado = false;
		}
		
		if(validado) return "OK";
		return sb.toString();
	}	

	@Override
	public void verificarCamposPreenchidos(Texto texto, Local local, Result result) {		
		if(texto.getAutor() == null || texto.getAutor().isEmpty()){
			texto.setAutor("autor");
		}		
		if(texto.getConteudo() == null || texto.getConteudo().isEmpty()){
			texto.setConteudo("conteudo");
		}else{			
			switch (local.ordinal()) {
			case 0:
				if(texto.getConteudo().length() > 600){
					result.include("mensagemAviso", "O texto da p&aacute;gina '?1' continha ?2 caracteres e foi recortado em 600 caracteres para ser atualizado".replace("?1", local.toString()).replace("?2", String.valueOf(texto.getConteudo().length())));
					texto.setConteudo(texto.getConteudo().substring(0, 599));
					}
				break;

			default:
				if(texto.getConteudo().length() > 2999){
					result.include("mensagemAviso", "O texto da p&aacute;gina '?1' continha ?2 caracteres e foi recortado em 3000 caracteres para ser atualizado".replace("?1", local.toString()).replace("?2", String.valueOf(texto.getConteudo().length())));
					texto.setConteudo(texto.getConteudo().substring(0, 2999));
					}
				break;
			}
		}
	}	
	
	/*private boolean ehGmail(String email) {
		return email.endsWith("@gmail.com");
	}*/

	private boolean ehEmailValido(String email) {
		return email.matches("[a-zA-Z0-9._%-]+@[a-zA-Z0-9._-]+\\.[a-z]{2,4}");
	}	

	private boolean setMsgErroAno(Result result, String mensagem) {		
		result.include("anoEmBranco", mensagem);
		return false;
	}

	

	
			
}
