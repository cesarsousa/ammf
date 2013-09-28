package br.com.ammf.service.imp;

import org.apache.tomcat.util.digester.SetRootRule;

import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Livro;
import br.com.ammf.model.Mensagem;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Resenha;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.stella.validation.ValidadorDeDV;
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
		/*texto.setAutor(texto.getAutor().trim());
		texto.setTitulo(texto.getTitulo().trim());
		texto.setConteudo(texto.getConteudo().trim());*/		
		
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
		}
		if(!validado){
			result.include("textoBlog", texto);
		}
		
		return validado;
	}
	
	public boolean pessoa(Pessoa pessoa, Result result) {
		/*pessoa.setNome(pessoa.getNome().trim());
		pessoa.setEmail(pessoa.getEmail().trim());*/
		
		boolean validada = true;
		if(pessoa.getNome() == null || pessoa.getNome().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado");
			validada = false;
		}
		if(pessoa.getEmail() == null || pessoa.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado");
			validada = false;
		}else if (!ehEmailValido(pessoa.getEmail())){
			result.include("emailEmBranco", "O email est&aacute; com formato inv&aacute;lido");
			validada = false;
		}else{
			boolean emailCadastrado = pessoaRepository.jaEstaCadastrada(pessoa.getEmail());
			if(emailCadastrado){
				result.include("emailEmBranco", "O email " + pessoa.getEmail() + " j&aacute; est&aacute; cadastrado neste site");
				result.include("emailJaCadastrado", true);
				System.out.println("aqui");
				//result.include("opcaoCadastro", true); // ??
				validada = false;
			}
		}		
		
		if(!validada){
			result.include("pessoaCadastro", pessoa);
		}
		return validada;
	}

	@Override
	public boolean usuario(Usuario usuario, Result result) {
		boolean resultado = true;
		if(usuario.getUuid() == null || usuario.getUuid().isEmpty()){
			result.include("usuarioUuidBranco", "N&atilde;o foi poss&iacute;vel definir o uuid do usu&aacute;rio");
			resultado = false;
		}
		
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
		}else if (!ehGmail(usuario.getEmail())){
			result.include("usuarioErroEmail", "O email deve deve ser do Gmail (seu_email@gmail.com)");
			resultado = false;
		}
		
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
			}else if(!livro.getLinkVenda().startsWith("http://www.")){
				result.include("linkEmBranco", "O link de venda do produto deve come&ccedil;ar com '<b>http://www.</b>'<br/>");
				result.include("comErroLink", "Erro");
				validado = false;
			}
		}
			
		if(imagemLivro != null){
			if(!imagemLivro.getContentType().startsWith("image")){
				result.include("fotoInvalida", "O arquivo para a capa do livro deve ser um arquivo de foto.");
				validado = false;
			}
		}
		return validado;
	}
	
	@Override
	public boolean novaResenha(Resenha resenha, Result result) {
		boolean validado = resenha(resenha, result);			
		
		if(!validado){
			result.include("resenhaErroCadastro", true);
			result.include("resenha", resenha);
		}
		return validado;
	}
	
	@Override
	public boolean atualizarResenha(Resenha resenha, Result result) {
		boolean validado = resenha(resenha, result);
		
		if(!validado){
			result.include("resenhaErroAtualiza", true);
			result.include("resenha", resenha);
		}
		return validado;
	}
	
	private boolean resenha(Resenha resenha, Result result){
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
		
		return validado;		
	}

	@Override
	public void verificarCamposPreenchidos(Texto texto) {		
		if(texto.getAutor() == null || texto.getAutor().isEmpty()){
			texto.setAutor("autor");
		}		
		if(texto.getConteudo() == null || texto.getConteudo().isEmpty()){
			texto.setConteudo("conteudo");
		}		
	}
	
	private boolean ehGmail(String email) {
		return email.endsWith("@gmail.com");
	}

	private boolean ehEmailValido(String email) {
		return email.matches("[a-zA-Z0-9._%-]+@[a-zA-Z0-9._-]+\\.[a-z]{2,4}");
	}	

	private boolean setMsgErroAno(Result result, String mensagem) {		
		result.include("anoEmBranco", mensagem);
		return false;
	}	
}
