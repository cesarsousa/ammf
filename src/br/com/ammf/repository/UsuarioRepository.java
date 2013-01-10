package br.com.ammf.repository;

import br.com.ammf.model.Usuario;

public interface UsuarioRepository {
	
	public void salvar(Usuario usuario);

	public Usuario autenticar(String login, String senha);

	public void atualizar(Usuario usuario);

	public long getId(String uuid);

}
