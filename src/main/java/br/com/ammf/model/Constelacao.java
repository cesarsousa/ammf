package br.com.ammf.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
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
	
	@Enumerated(EnumType.STRING)
	private LocalEvento localEvento;
	
	@Column(length = 3000)
	private String textoInicial;
	
	@Column(length = 3000)
	private String formaPagamento;
	
	@Column(length = 3000)
	private String textoFinal;
	
	@Column(length = 3000)
	private String data;
	
	@Column(length = 3000)
	private String localizacao;
	
	@Column(length = 3000)
	private String informacao;
	
	@Column(length = 3000)
	private String dadosPessoais;
	
	@Column(length = 3000)
	private String linkMapa;
	
	@Column(length = 3000)
	private String localMapa;
	
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
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	
	public String getLinkMapa() {
		return linkMapa;
	}
	
	public void setLinkMapa(String linkMapa) {
		this.linkMapa = linkMapa;
	}
	
	public LocalEvento getLocalEvento() {
		return localEvento;
	}
	
	public void setLocalEvento(LocalEvento localEvento) {
		this.localEvento = localEvento;
	}
	
	public String getLocalMapa() {
		return localMapa;
	}
	
	public void setLocalMapa(String localMapa) {
		this.localMapa = localMapa;
	}
	
	public String getDataFormatada() {
		return data.replace("<h2>", "").replace("</h2>", "");
	}
	
	public String getFormaPagamentoSimples() {
		return formaPagamento.replace("<h3>", "").replace("</h3>", "");
	}
	
	public String getLocalizacaoSimples() {
		return localizacao.replace("<h3>", "").replace("</h3>", "");
	}
	
}
