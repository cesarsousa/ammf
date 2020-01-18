package br.com.ammf.dto;

import java.util.List;

import br.com.ammf.model.Pessoa;

public class RelatorioEmailDto {
	
	private int totalGeral;
	
	private int totalInformado;
	
	private int totalErros;
	
	private List<Pessoa> emailsNaoInformados;	

	public RelatorioEmailDto(int totalGeral, int totalInformado, int totalErros, List<Pessoa> emailsNaoInformados) {
		super();
		this.totalGeral = totalGeral;
		this.totalInformado = totalInformado;
		this.totalErros = totalErros;
		this.emailsNaoInformados = emailsNaoInformados;
	}
	
	public int getTotalGeral() {
		return totalGeral;
	}
	public void setTotalGeral(int totalGeral) {
		this.totalGeral = totalGeral;
	}

	public int getTotalInformado() {
		return totalInformado;
	}

	public void setTotalInformado(int totalInformado) {
		this.totalInformado = totalInformado;
	}

	public int getTotalErros() {
		return totalErros;
	}

	public void setTotalErros(int totalErros) {
		this.totalErros = totalErros;
	}
	
	public List<Pessoa> getEmailsNaoInformados() {
		return emailsNaoInformados;
	}
	
	public void setEmailsNaoInformados(List<Pessoa> emailsNaoInformados) {
		this.emailsNaoInformados = emailsNaoInformados;
	}

}
