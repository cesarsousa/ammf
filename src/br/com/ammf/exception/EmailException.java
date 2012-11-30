package br.com.ammf.exception;

public class EmailException extends Exception {
	
	private static final long serialVersionUID = 4223393071613624400L;
	
	private String mensagem;
	
	public EmailException(String mensagem) {
		this.mensagem = mensagem;
	}

	public String getMensagem() {
		return mensagem;
	}

}
