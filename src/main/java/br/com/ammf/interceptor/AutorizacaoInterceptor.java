package br.com.ammf.interceptor;

import javax.inject.Inject;

import br.com.ammf.controller.LoginController;
import br.com.ammf.model.SessaoUsuario;
import br.com.caelum.vraptor.AroundCall;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.AcceptsWithAnnotations;
import br.com.caelum.vraptor.interceptor.SimpleInterceptorStack;

@Intercepts
@AcceptsWithAnnotations(Restrito.class)
public class AutorizacaoInterceptor{

	private final Result result;
	private final SessaoUsuario sessaoUsuario;

	protected AutorizacaoInterceptor() {
		this.result = null;
		this.sessaoUsuario = null;
	}

	@Inject
	public AutorizacaoInterceptor(
			Result result,
			SessaoUsuario sessaoUsuario){
		this.result = result;
		this.sessaoUsuario = sessaoUsuario;
	}

	@AroundCall
	public void intercept(SimpleInterceptorStack stack){
		if(usuarioEstaLogado()){
			stack.next();
		}else{
			result.redirectTo(LoginController.class).login();
		}
	}

	private boolean usuarioEstaLogado() {
		if(sessaoUsuario == null){
			return false;
		}
		return sessaoUsuario.isLogado();
	}

}
