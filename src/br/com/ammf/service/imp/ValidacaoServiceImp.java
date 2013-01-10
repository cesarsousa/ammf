package br.com.ammf.service.imp;

import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Usuario;
import br.com.ammf.service.ValidacaoService;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class ValidacaoServiceImp implements ValidacaoService {
	
	
	
	public boolean pessoa(Pessoa pessoa, Result result) {
		boolean resultado = true;
		if(pessoa.getNome() == null || pessoa.getNome().isEmpty()){
			result.include("nomeEmBranco", "O nome deve ser informado");
			resultado = false;
		}
		if(pessoa.getEmail() == null || pessoa.getEmail().isEmpty()){
			result.include("emailEmBranco", "O email deve ser informado");
			resultado = false;
		}else if (!emailValido(pessoa.getEmail())){
			result.include("emailEmBranco", "O email esta com formato inválido");
			resultado = false;
		}
		if(!resultado){
			result.include("pessoaCadastro", pessoa);
		}
		return resultado;
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
		
		return resultado;
	}

	private boolean ehGmail(String email) {
		return email.endsWith("@gmail.com");
	}

	private boolean emailValido(String email) {
		return email.matches("[a-zA-Z0-9._%-]+@[a-zA-Z0-9._-]+\\.[a-z]{2,4}");
	}

}
