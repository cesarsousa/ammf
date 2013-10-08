package br.com.ammf.exception;

public class CadastroException extends Exception {
	
	private static final long serialVersionUID = 4223393071613624400L;
	
	private String mensagem;
	
	public CadastroException(String mensagem) {
		this.mensagem = mensagem;
	}

	public String getMensagem() {
		return mensagem;
	}
}