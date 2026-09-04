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
@Table(name="curso")
public class Curso implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private long id;
	
	@Enumerated(EnumType.STRING)
	private LocalEvento localEvento;
	
	@Column(length = 3000)
	private String nome;
	
	@Column(length = 3000)
	private String descricao;
	
	@Column(length = 3000)
	private String formaPagamento;
	
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

	public LocalEvento getLocalEvento() {
		return localEvento;
	}

	public void setLocalEvento(LocalEvento localEvento) {
		this.localEvento = localEvento;
	}

	public String getFormaPagamento() {
		return formaPagamento;
	}

	public void setFormaPagamento(String formaPagamento) {
		this.formaPagamento = formaPagamento;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
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

	public String getLinkMapa() {
		return linkMapa;
	}

	public void setLinkMapa(String linkMapa) {
		this.linkMapa = linkMapa;
	}

	public String getLocalMapa() {
		return localMapa;
	}

	public void setLocalMapa(String localMapa) {
		this.localMapa = localMapa;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public String getDataFormatada() {
		
		if(this.data == null) {
			return "";
		}
		
		return data.replace("<h2>", "").replace("</h2>", "");
	}
	
	public String getFormaPagamentoSimples() {
		
		if(this.formaPagamento == null) {
			return "";
		}
		
		return formaPagamento.replace("<h3>", "").replace("</h3>", "");
	}
	
	public String getLocalizacaoSimples() {
		
		if(this.localizacao == null) {
			return "";
		}
		
		return localizacao.replace("<h3>", "").replace("</h3>", "");
	}

}
