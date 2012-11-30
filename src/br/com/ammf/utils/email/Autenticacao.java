package br.com.ammf.utils.email;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Autenticacao extends Authenticator {
	
	private final String gmail;
	private final String password;
	

	public Autenticacao(String cetrans, String senha) {
		this.gmail = cetrans;
		this.password = senha;
	}

	protected PasswordAuthentication getPasswordAuthentication() {		
		return new PasswordAuthentication(gmail, password);
	}

}
