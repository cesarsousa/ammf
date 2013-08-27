package br.com.ammf.interceptor;

import javax.servlet.http.HttpServletRequest;

import br.com.ammf.controller.LoginController;
import br.com.ammf.model.SessaoUsuario;
import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class AutorizacaoInterceptor implements Interceptor{
	
	private final HttpServletRequest request;
	private final Result result;
	private final SessaoUsuario sessaoUsuario;
	
	public AutorizacaoInterceptor(
			Result result,
			SessaoUsuario sessaoUsuario,
			HttpServletRequest request){		
		this.result = result; 
		this.sessaoUsuario = sessaoUsuario;
		this.request = request;
	}

	@Override
	public boolean accepts(ResourceMethod method) {
		return !this.sessaoUsuario.isLogado() && method.containsAnnotation(Restrito.class);
	}

	@Override
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		if(usuarioEstaLogado()){
			stack.next(method, resourceInstance);
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
