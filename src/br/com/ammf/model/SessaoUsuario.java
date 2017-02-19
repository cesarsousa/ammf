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
	private Terapeuta terapeuta;
	private Constelacao constelacao;
	private Constelacao constelacaoBarra;
	
	private Texto textoIndex;
	private Texto textoPsicologia;
	private Texto textoEducacao;
	private Texto textoCultura;
	private Texto textoArtesOrientais;
	private Texto textoQuiron;
	
		
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
	
	public Terapeuta getTerapeuta() {
		return terapeuta;
	}
	
	public void setTerapeuta(Terapeuta terapeuta) {
		this.terapeuta = terapeuta;
	}
	
	public Constelacao getConstelacao() {
		return constelacao;
	}
	
	public void setConstelacao(Constelacao constelacao) {
		this.constelacao = constelacao;
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
	
	public Texto getTextoQuiron() {
		return textoQuiron;
	}
	
	public void setTextoQuiron(Texto textoQuiron) {
		this.textoQuiron = textoQuiron;
	}
	
	public List<String> getNotificacoes() {
		return notificacoes;
	}
	
	public void setNotificacoes(List<String> notificacoes) {
		this.notificacoes = notificacoes;
	}
	
	public Constelacao getConstelacaoBarra() {
		return constelacaoBarra;
	}
	
	public void setConstelacaoBarra(Constelacao constelacaoBarra) {
		this.constelacaoBarra = constelacaoBarra;
	}

}
