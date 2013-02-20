package br.com.ammf.model;

import java.io.Serializable;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class SessaoUsuario implements Serializable{

	private static final long serialVersionUID = -1389291117203881533L;
	
	private Usuario usuario;
	
	private Texto textoIndex;
	private Texto textoPsicologia;
	private Texto textoEducacao;
	private Texto textoCultura;
	private Texto textoArtesOrientais;
		
	private List<String> notificacoes;
	
	public void login(Usuario usuario){
		this.usuario = usuario;
	}
	
	public String getNome(){
		return usuario.getLogin();
	}
	
	public boolean isLogado(){
		return usuario != null;
	}

	public void logout() {
		this.usuario = null;		
	}
	
	public Usuario getUsuario() {
		return usuario;
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
	
	public List<String> getNotificacoes() {
		return notificacoes;
	}
	
	public void setNotificacoes(List<String> notificacoes) {
		this.notificacoes = notificacoes;
	}

}
