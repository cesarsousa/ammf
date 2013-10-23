package br.com.ammf.repository.imp;

import br.com.ammf.model.Terapeuta;
import br.com.ammf.repository.TerapeutaRepository;
import br.com.caelum.vraptor.ioc.Component;

@Component
public class TerapeutaDao implements TerapeutaRepository {

	@Override
	public Terapeuta get() {
		// TODO get terapeuta dao
		return new Terapeuta();
	}

	@Override
	public void atualizar(Terapeuta terapeuta) {
		// TODO atualizar terapeuta
		
	}

}
