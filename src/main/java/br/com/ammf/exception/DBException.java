package br.com.ammf.exception;

public class DBException extends Exception {
	
	private static final long serialVersionUID = 2461614097907616902L;
	
	private String origem;
	private Exception exception;

	public DBException(String origem, Exception exception) {
		this.origem = origem;
		this.exception = exception;
	}
	
	public String getOrigem() {
		return origem;
	}	
	
	public String getMensagem() {
		return exception.getMessage();
	}
	
	

	

}
