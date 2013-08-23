package br.com.ammf.exception;

public enum GeraLog {
	
	TRUE(true),
	FALSE(false);
	
	private GeraLog(boolean geraLog) {
		this.ativo = geraLog;
	}
	
	private boolean ativo;
	
	public boolean ativo(){
		return ativo;
	}

}
