package br.com.ammf.repository.imp;

import org.hibernate.Session;

import br.com.ammf.repository.CursoRepository;

public class CursoDao implements CursoRepository{
	
	private final Session session;
	
	public CursoDao(Session session){
		this.session = session;
	}
	

}
