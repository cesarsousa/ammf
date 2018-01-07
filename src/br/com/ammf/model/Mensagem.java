package br.com.ammf.model;

public class Mensagem {
	
	private String nome;
	private String email;
	private String titulo;
	private String conteudo;
	
	public Mensagem(String nome, String email, String conteudo) {
		this.nome = nome;
		this.email = email;
		this.conteudo = conteudo;
	}
	
	public Mensagem(String nome, String email, String conteudo, String titulo) {
		this.nome = nome;
		this.email = email;
		this.conteudo = conteudo;
		this.titulo = titulo;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getConteudo() {
		return conteudo;
	}
	
	public void setConteudo(String conteudo) {
		this.conteudo = conteudo;
	}
	
	public String getTitulo() {
		return titulo;
	}
	
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

}
