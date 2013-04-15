package br.com.ammf.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="opcao")
public class Opcao {
	
	@Id
	@GeneratedValue
	private long id;
	
	private TipoOpcao tipoOpcao; 
	
	private String descricao;	

}
