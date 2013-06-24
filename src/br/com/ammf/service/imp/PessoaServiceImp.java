package br.com.ammf.service.imp;

import br.com.ammf.exception.DBException;
import br.com.ammf.exception.EmailException;
import br.com.ammf.model.Local;
import br.com.ammf.model.Notificacao;
import br.com.ammf.model.Pessoa;
import br.com.ammf.model.SessaoUsuario;
import br.com.ammf.model.Situacao;
import br.com.ammf.model.Status;
import br.com.ammf.model.Texto;
import br.com.ammf.model.Usuario;
import br.com.ammf.repository.PessoaRepository;
import br.com.ammf.repository.TextoRepository;
import br.com.ammf.repository.UsuarioRepository;
import br.com.ammf.service.PessoaService;
import br.com.ammf.utils.DataUtils;
import br.com.ammf.utils.HtmlMensagem;
import br.com.ammf.utils.email.Email;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class PessoaServiceImp implements PessoaService{
	
	private PessoaRepository pessoaRepository;
	private UsuarioRepository usuarioRepository;
	private TextoRepository textoRepository;
	
	public PessoaServiceImp(
			PessoaRepository pessoaRepository,
			UsuarioRepository usuarioRepository,
			TextoRepository textoRepository){
		this.pessoaRepository = pessoaRepository;
		this.usuarioRepository = usuarioRepository;
		this.textoRepository = textoRepository;
	}

	@Override
	public void cadastrarComoCliente(Pessoa pessoa) throws DBException {
		pessoa.setStatus(Status.PENDENTE);
		pessoa.setSituacao(Situacao.ATIVO);
		pessoa.setDataCadastro(DataUtils.getNow());
		pessoaRepository.cadastrar(pessoa);
	}

	@Override
	public void cadastrarComoAdm(Pessoa pessoa) {
		pessoa.setStatus(Status.CONFIRMADO);
		pessoa.setSituacao(Situacao.ATIVO);
		pessoa.setDataCadastro(DataUtils.getNow());
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
