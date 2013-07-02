package br.com.ammf.model;

/**
 * Classe utilitaria para adicionar conteudo na pagina de contato.
 */
public class Contato {
	
	private String endereco;
	private String telefone;
	private boolean mostrarMapa;
	private String localizacao;
	private String email;
	private String linkedin;
		
	public Contato(String email, String linkedin, String telefone, String endereco, boolean mostrarMapa, String localizacao) {
		this.email = email;
		this.linkedin = linkedin;
		this.telefone = telefone;
		this.endereco = endereco;
		this.mostrarMapa = mostrarMapa;
		this.localizacao = localizacao;
	}
	public String getEndereco() {
		return endereco;
	}
	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}
	
	public boolean isMostrarMapa() {
		return mostrarMapa;
	}
	public void setMostrarMapa(boolean mostrarMapa) {
		this.mostrarMapa = mostrarMapa;
	}
	
	public String getTelefone() {
		return telefone;
	}
	
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
		
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getLinkedin() {
		return linkedin;
	}
	
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
}
