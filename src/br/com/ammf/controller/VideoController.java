package br.com.ammf.controller;

import br.com.ammf.interceptor.Restrito;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;

@Resource
public class VideoController {
	
	@Restrito
	@Get("/menu/video")
	public void videoAdmin(){
		
		
	}

}
