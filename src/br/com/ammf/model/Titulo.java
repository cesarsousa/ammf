package br.com.ammf.model;

import java.util.Calendar;
import java.util.Date;

import br.com.ammf.utils.DataUtils;

/**
 * Classe de passagem para exibir dados selecionados dos textos. Exibe apenas
 * o título e data de postagem de um desterminado texto.
 * 
 * @author cesar
 *
 */
public class Titulo {
	
	private String descricao;
	private Date data;
	private String uuid;
	public Titulo(String descricao, Date data, String uuid) {
		this.descricao = descricao;
		this.data = data;
		this.uuid = uuid;
	}
	
	public String getDescricao() {
		return descricao;
	}
	
	public String getData(){
		return DataUtils.getFullString(data);
	}
	
	public String getUuid() {
		return uuid;
	}

}
