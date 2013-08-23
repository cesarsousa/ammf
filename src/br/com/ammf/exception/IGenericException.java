package br.com.ammf.exception;

public interface IGenericException {
	
	public String getMensagemUsuario();

	public String getTipoRetorno();
	
	public String getMensagemErro();
	
	public Object[] getParametrosMensagemUsuario();

}
