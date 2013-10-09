package br.com.ammf.repository;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Faq;

public interface FaqRepository {

	void cadastrar(Faq faq) throws DBException;

	int totalPerguntasSemRespostas();

}
