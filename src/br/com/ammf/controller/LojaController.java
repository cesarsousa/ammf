package br.com.ammf.controller;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.List;

import br.com.ammf.interceptor.Restrito;
import br.com.ammf.model.Livro;
import br.com.ammf.repository.LivroRepository;
import br.com.caelum.stella.boleto.Banco;
import br.com.caelum.stella.boleto.Boleto;
import br.com.caelum.stella.boleto.Datas;
import br.com.caelum.stella.boleto.Emissor;
import br.com.caelum.stella.boleto.Sacado;
import br.com.caelum.stella.boleto.bancos.Bradesco;
import br.com.caelum.stella.boleto.transformer.GeradorDeBoleto;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.download.Download;
import br.com.caelum.vraptor.interceptor.download.InputStreamDownload;

@Resource
public class LojaController {
	
	private Result result;
	private LivroRepository livroRepository;
	
	public LojaController(
			Result result,
			LivroRepository livroRepository){
		this.result = result;
		this.livroRepository = livroRepository;
	}
	
	@Restrito
	@Get("/menu/loja")
	public void lojaAdmin(){}
		
	@Get("/cliente/loja")
	public void lojaCliente(){
		List<Livro> livrosPublicados = livroRepository.listar();
		result.include("livrosPublicados", livrosPublicados);		
	}
	
	@Get("/downloadboleto")
	public Download download(){
		Datas datas = Datas.novasDatas()
				.comDocumento(1, 8, 2013)
				.comProcessamento(1, 8, 2013)
				.comVencimento(1, 8, 2013);
			
			Emissor emissor = Emissor.novoEmissor()
				.comCedente("Site Quiron Cobran�as")
				.comAgencia(127).comDigitoAgencia('0')
				.comContaCorrente(1018021)
				.comDigitoContaCorrente('5')
				.comNossoNumero(900025001);
			
			Sacado sacado = Sacado.novoSacado()
				.comNome("C�sar de Sousa J�nior")
				.comCpf("026.765.639.47")
				.comEndereco("Rua Padre Anchieta 142, centro")
				.comCep("24210050")
				.comCidade("Niteroi")
				.comUf("RJ");
			
			Banco banco = new Bradesco();
			
			Boleto boleto = Boleto.novoBoleto()
				.comBanco(banco)
				.comDatas(datas)
				.comDescricoes("descricao 1", "descricao 2", "descricao 3")
				.comEmissor(emissor)
				.comSacado(sacado)
				.comValorBoleto("37.55")
				.comNumeroDoDocumento("9876")
				.comInstrucoes("instrucao 1", "instrucao 2", "instrucao 3")
				.comLocaisDePagamento("local 1", "local 2");
			
			GeradorDeBoleto gerador = new GeradorDeBoleto(boleto);
			
			gerador.geraPDF("boleto.pdf");
			gerador.geraPNG("boleto.png");		
			
			byte[] bytesBoleto = gerador.geraPDF();
			
			InputStream inputStream = new ByteArrayInputStream(bytesBoleto);
			Download download = new InputStreamDownload(inputStream, "application/pdf", "boleto.pdf", true, bytesBoleto.length);
			
			return download;		
	}
}
