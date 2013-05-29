package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Local;
import br.com.ammf.model.Texto;

public interface TextoRepository {
	
	public void cadastrar(Texto texto);

	public List<Texto> listar(Local local, String orderBy);

	public List<Object[]> listarTitulos();

	public Texto obterPor(String uuid);

	public Texto getTextoIndex();
	
	public Texto getTextoPsicologia();
	
	public Texto getTextoEducacao();
	
	public Texto getTextoCultura();
	
	public Texto getTextoArtesOrientais();

	public void atualizarTextoIndex(Texto texto);
	
	public void atualizarTextoPsicologia(Texto texto);

	public void atualizarTextoEducacao(Texto texto);
	
	public void atualizarTextoCultura(Texto texto);
	
	public void atualizarTextoArtesOrientais(Texto texto);

	public List<Texto> listarTitulos(String titulo);	
	
	public void deletar(String uuid);	

	public long obterId(String uuid);

	public void atualizar(Texto texto);

	public String obterUuidUltimaPublicacao();	

}
