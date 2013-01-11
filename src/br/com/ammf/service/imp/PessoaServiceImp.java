package br.com.ammf.service.imp;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Status;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.service.PessoaService;
import br.com.ammf.utils.DataUtils;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PessoaServiceImp implements PessoaService{
	
	private PessoaRepository pessoaRepository;
	
	public PessoaServiceImp(
			PessoaRepository pessoaRepository){
		this.pessoaRepository = pessoaRepository;
	}

	@Override
	public void cadastrar(Pessoa pessoa) throws DBException {
		pessoa.setStatus(Status.PENDENTE);
		pessoa.setDataCadastro(DataUtils.getNow());
		pessoaRepository.cadastrar(pessoa);	
		
	}

	@Override
	public void notificarCadastroPelocliente(Pessoa pessoa) {
		//TODO logica menuserviceimp public void enviarEmailNotificacaoCadastro(Pessoa pessoa) throws EmailException {
		
	}

}
