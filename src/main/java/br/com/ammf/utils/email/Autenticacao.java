package br.com.ammf.utils.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Autenticacao extends Authenticator {
	
	private final String email;
	private final String password;
	
	public Autenticacao(String email, String senha) {
		this.email = email;
		this.password = senha;
	}

	protected PasswordAuthentication getPasswordAuthentication() {		
		return new PasswordAuthentication(email, password);
	}

}
