package br.com.ammf.service.imp;

import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Result;
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
		}else if(!emailValido(depoimento.getEmail())){
			result.include("emailEmBranco", "O email está com formato inválido<br/>");
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
			result.include("tituloErro", "<b>Verifique erros de preenchimento no final da página</b><br/>");
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
		}else if (!emailValido(pessoa.getEmail())){
			result.include("emailEmBranco", "O email está com formato inválido");
			validada = false;
		}else{
			boolean emailCadastrado = pessoaRepository.jaEstaCadastrada(pessoa.getEmail());
			if(emailCadastrado){
				result.include("emailEmBranco", "O email " + pessoa.getEmail() + " já está cadastrado neste site");
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
		if(usuario.getNome() == null || usuario.getNome().isEmpty()){
			result.include("usuarioNomeBranco", "O nome deve ser informado");
			resultado = false;
		}
		
		if(usuario.getLogin() == null || usuario.getLogin().isEmpty()){
			result.include("usuarioLoginBranco", "O login deve ser informado");
			resultado = false;
		}		
		
		if(usuario.getEmail() == null || usuario.getEmail().isEmpty()){
			result.include("usuarioErroEmail", "O email deve ser informado");
			resultado = false;
		}else if (!emailValido(usuario.getEmail())){
			result.include("usuarioErroEmail", "O email deve possuir um formato válido");
			resultado = false;
		}else if (!ehGmail(usuario.getEmail())){
			result.include("usuarioErroEmail", "O email deve deve ser do Gmail (seu_email@gmail.com)");
			resultado = false;
		}
		
		if(usuario.getSenha() == null || usuario.getSenha().isEmpty()){
			result.include("usuarioSenhaBranco", "A senha deve ser informada");
			resultado = false;
		}
		
		if(usuario.getUuid() == null || usuario.getUuid().isEmpty()){
			result.include("usuarioUuidBranco", "Não foi possível definir o uuid do usuário");
			resultado = false;
		}
		
		if(usuario.getLinkedin() == null || usuario.getLinkedin().isEmpty()){
			usuario.setLinkedin("");
		}
		
		return resultado;
	}

	private boolean ehGmail(String email) {
		return email.endsWith("@gmail.com");
	}

	private boolean emailValido(String email) {
		return email.matches("[a-zA-Z0-9._%-]+@[a-zA-Z0-9._-]+\\.[a-z]{2,4}");
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
}
