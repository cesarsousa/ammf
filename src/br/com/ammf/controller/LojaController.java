package br.com.ammf.controller;

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

@Resource
public class LojaController {
	
	private Result result;
	
	public LojaController(Result result){
		this.result = result;
	}
	
	@Get("/cliente/loja")
	public void lojaCliente(){
		Datas datas = Datas.novasDatas()
			.comDocumento(1, 8, 2013)
			.comProcessamento(1, 8, 2013)
			.comVencimento(1, 8, 2013);
		
		Emissor emissor = Emissor.novoEmissor()
			.comCedente("Site Quiron Cobranças")
			.comAgencia(127).comDigitoAgencia('0')
			.comContaCorrente(1018021)
			.comDigitoContaCorrente('5')
			.comNossoNumero(900025001);
		
		Sacado sacado = Sacado.novoSacado()
			.comNome("César de Sousa Júnior")
			.comCpf("026.765.639.47")
			.comEndereco("Rua Padre Anchieta 142, centro")
			.comCep("24210050")
			.comCidade("Niterói")
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
		
		result.include("mensagem", "boleto gerado com sucesso");
	}

}
