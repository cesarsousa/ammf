package br.com.ammf.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;

@Resource
public class BlogController {
	
	@Get("/blog/editar")
	public void editarBlog(){}

}
