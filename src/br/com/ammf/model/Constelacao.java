package br.com.ammf.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="constelacao")
public class Constelacao implements Serializable{

	private static final long serialVersionUID = -8353115425403099440L;
		
	@Id
	@GeneratedValue
	private long id;
	
	@Column(length = 3000)
	private String textoInicial;
	
	@Column(length = 3000)
	private String formaPagamento;
	
	@Column(length = 3000)
	private String textoFinal;
	
	@Column(length = 3000)
	private String localizacao;
	
	@Column(length = 3000)
	private String informacao;
	
	@Column(length = 3000)
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
