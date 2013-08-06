package br.com.ammf.service.imp;

import br.com.ammf.exception.DBException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.service.PessoaService;
import br.com.ammf.utils.DataUtils;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PessoaServiceImp implements PessoaService{
	
	private PessoaRepository pessoaRepository;	
	
	public PessoaServiceImp(PessoaRepository pessoaRepository){
		this.pessoaRepository = pessoaRepository;
	}

	@Override
	public void cadastrarComoCliente(Pessoa pessoa) throws DBException {
		pessoa.setStatus(Status.PENDENTE);
		pessoa.setSituacao(Situacao.INATIVO);
		pessoa.setDataCadastro(DataUtils.getDateNow());
		pessoaRepository.cadastrar(pessoa);
	}

	@Override
	public void cadastrarComoAdm(Pessoa pessoa) {
		pessoa.setStatus(Status.CONFIRMADO);
		pessoa.setSituacao(Situacao.INATIVO);
		pessoa.setDataCadastro(DataUtils.getDateNow());
		pessoaRepository.cadastrar(pessoa);		
	}

	@Override
	public boolean ehCodigo(String paramConsulta) {
		try {
			Integer.parseInt(paramConsulta);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}
