package br.com.ammf.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="constelacao")
public class Constelacao implements Serializable{

	private static final long serialVersionUID = -8353115425403099440L;
		
	@Id
	@GeneratedValue
	private long id;
	
	private String textoInicial;
	private String formaPagamento;
	private String textoFinal;
	private String localizacao;
	private String informacao;
	private String dadosPessoais;
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTextoInicial() {
		return textoInicial;
	}
	public void setTextoInicial(String textoInicial) {
		this.textoInicial = textoInicial;
	}
	public String getFormaPagamento() {
		return formaPagamento;
	}
	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}
	public String getTextoFinal() {
		return textoFinal;
	}
	public void setTextoFinal(String textoFinal) {
		this.textoFinal = textoFinal;
	}
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public String getInformacao() {
		return informacao;
	}
	public void setInformacao(String informacao) {
		this.informacao = informacao;
	}
	public String getDadosPessoais() {
		return dadosPessoais;
	}
	public void setDadosPessoais(String dadosPessoais) {
		this.dadosPessoais = dadosPessoais;
	}	
}
