package br.com.ammf.exception;

import javax.persistence.Entity;

@Entity
public class Excecao {
	
	private final GeraLog geraLog;
	private final String mensagemErro;
	private String mensagemUsuario;
	private Object[] parametrosMensagemUsuario;
	private Throwable throwable;
	private String tipoRetorno = "error";
	
	public Excecao(GeraLog geraLog, String mensagemErro) {
		this.geraLog = geraLog;
		this.mensagemErro = mensagemErro;
	}
	
	public Excecao(GeraLog geraLog, String mensagemErro, String mensagemUsuario, Object... parametrosMensagemUsuario) {
		this.geraLog = geraLog;
		this.mensagemErro = mensagemErro;
		this.mensagemUsuario = mensagemUsuario;
		this.parametrosMensagemUsuario = parametrosMensagemUsuario;
	}
	
	public Excecao(GeraLog geraLog, String tipoRetorno, String mensagemErro, String mensagemUsuario, Object... parametrosMensagemUsuario) {
		this.geraLog = geraLog;
		this.mensagemErro = mensagemErro;
		this.mensagemUsuario = mensagemUsuario;
		this.parametrosMensagemUsuario = parametrosMensagemUsuario;
		this.tipoRetorno = tipoRetorno;
	}
	
	public Excecao(GeraLog geraLog, String mensagemErro, Throwable thrw, String mensagemUsuario, Object... parametrosMensagemUsuario) {
		this.geraLog = geraLog;
		this.mensagemErro = mensagemErro;
		this.mensagemUsuario = mensagemUsuario;
		this.parametrosMensagemUsuario = parametrosMensagemUsuario;
		this.throwable = thrw;
	}
	
	public Excecao(String mensagemErro) {
		this.geraLog = GeraLog.TRUE;
		this.mensagemErro = mensagemErro;
	}

	public Excecao(String mensagemErro, Throwable thrw) {
		this.geraLog = GeraLog.TRUE;
		this.mensagemErro = mensagemErro + " " + thrw.getMessage();
		this.throwable = thrw;
	}
	
	public String getMensagemUsuario() {
		return mensagemUsuario;
	}

	public String getMensagemErro() {
		return mensagemErro;
	}
	
	public Object[] getParametrosMensagemUsuario() {
		return parametrosMensagemUsuario;
	}

	public Throwable getThrowable() {
		return throwable;
	}

	public GeraLog getGeraLog() {
		return geraLog;
	}

	public String getTipoRetorno() {
		return tipoRetorno;
	}

	public void setTipoRetorno(String tipoRetorno) {
		this.tipoRetorno = tipoRetorno;
	}

}
