package br.com.ammf.repository;

import java.util.List;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Faq;

public interface FaqRepository {

	void cadastrar(Faq faq) throws DBException;

	int totalPerguntasSemRespostas();

	List<Faq> listar();

	List<Faq> listarRespondidas();

	List<Faq> listarNaoRespondiddas();

	Faq obter(String uuid);

	void atualizar(Faq faq);

}
