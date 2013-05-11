package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.model.Depoimento;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;

public interface DepoimentoRepository {

	public List<Depoimento> listarTodos();
	
	public List<Depoimento> listarTodos(Status status);

	void cadastrar(Depoimento depoimento);
	
	public int getTotalDepoimentosCadastrados();

	public int getTotalDepoimentosConfirmados();

	public int getTotalDepoimentosPendentes();

	public void confirmar(String uuid);

	public void deletar(String uuid);

	public List<Depoimento> listarPorNomeEEmail(String paramConsulta);

}
