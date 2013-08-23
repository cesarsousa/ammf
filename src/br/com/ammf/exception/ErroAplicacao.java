package br.com.ammf.exception;

import br.com.ammf.repository.ErroRepository;

public class ErroAplicacao extends ErroRepository implements IGenericException {
	
	private static final long serialVersionUID = 1L;
	private String mensagemUsuario;
	private Object[] parametrosMensagemUsuario;
	private String tipoRetorno;

	public ErroAplicacao(Excecao excecao){
		super(excecao);
		this.mensagemUsuario = excecao.getMensagemUsuario();
		this.parametrosMensagemUsuario = excecao.getParametrosMensagemUsuario();
		this.tipoRetorno = excecao.getTipoRetorno();
	}
	
	public String getMensagemUsuario() {
		if(mensagemUsuario == null){
			return "operacao nao realizada";
		}
		return mensagemUsuario;
	}

	public String getMensagemErro() {
		return mensagemErro;
	}
	
	public Object[] getParametrosMensagemUsuario() {
		return parametrosMensagemUsuario;
	}

	@Override
	public String getTipoRetorno() {
		return tipoRetorno;
	}

}
