package br.com.ammf.model;

import java.io.Serializable;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class SessaoUsuario implements Serializable{

	private static final long serialVersionUID = -1389291117203881533L;
	
	private Usuario logado;
	
	private Texto textoIndex;
	private Texto textoPsicologia;
	private Texto textoEducacao;
	private Texto textoCultura;
	private Texto textoArtesOrientais;
	
	public void login(Usuario usuario){
		this.logado = usuario;
	}
	
	public String getNome(){
		return logado.getLogin();
	}
	
	public boolean isLogado(){
		return logado != null;
	}

	public void logout() {
		this.logado = null;		
	}
	
	public Texto getTextoIndex() {
		return textoIndex;
	}
	
	public void setTextoIndex(Texto textoIndex) {
		this.textoIndex = textoIndex;
	}
	
	public Texto getTextoPsicologia() {
		return textoPsicologia;
	}

	public void setTextoPsicologia(Texto textoPsicologia) {
		this.textoPsicologia = textoPsicologia;		
	}
	
	public Texto getTextoEducacao() {
		return textoEducacao;
	}
	
	public void setTextoEducacao(Texto textoEducacao) {
		this.textoEducacao = textoEducacao;
	}
	
	public Texto getTextoCultura() {
		return textoCultura;
	}
	
	public void setTextoCultura(Texto textoCultura) {
		this.textoCultura = textoCultura;
	}
	
	public Texto getTextoArtesOrientais() {
		return textoArtesOrientais;
	}
	
	public void setTextoArtesOrientais(Texto textoArtesOrientais) {
		this.textoArtesOrientais = textoArtesOrientais;
	}

}
