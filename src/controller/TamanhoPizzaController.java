package controller;

import java.text.NumberFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TamanhoPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV3;

public class TamanhoPizzaController implements ControllerBase {
	
	private String url = Configuracao.apiUrl + "/tamanhoPizza";

	public List<TamanhoPizzaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<TamanhoPizzaModel>) rest.getList(url, "GET", TamanhoPizzaModel.class, null, queryParams);
	}
	
	public List<TamanhoPizzaModel> listarTudo() {
		this.url += "/listarTudo";
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<TamanhoPizzaModel>) rest.getList(url, "GET", TamanhoPizzaModel.class, null, null);
	}

	public void salvarTamanhoPizza(TamanhoPizzaModel tamanho) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, tamanho, queryParams);
	}

	public void alterarTamanhoPizza(TamanhoPizzaModel tamanho) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "PUT", null, tamanho, queryParams);
	}

	public TamanhoPizzaModel buscarTamanhoPizzaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (TamanhoPizzaModel) rest.getObject(url, "GET", TamanhoPizzaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}
	
	@Override
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/tamanho/listarTamanhos.jsp";
		TamanhoPizzaModel tamanho;
		NumberFormat nf = NumberFormat.getInstance(Locale.FRANCE);

		switch (acao) {
		case "incluir":
			String nome = request.getParameter("nome");
			String descricao = request.getParameter("descricao");
			int numMaximoSabores = Integer.parseInt(request.getParameter("numMaximoSabores"));
			double preco = nf.parse(request.getParameter("preco")).doubleValue();
			double fatorMultiplicacao = nf.parse(request.getParameter("fatorMultiplicacao")).doubleValue();		
			//double preco = Double.parseDouble(request.getParameter("preco"));
			//double fatorMultiplicacao = Double.parseDouble(request.getParameter("fatorMultiplicacao"));
			
			tamanho = new TamanhoPizzaModel();
			tamanho.setNome(nome);
			tamanho.setDescricao(descricao);
			tamanho.setNumMaximoSabores(numMaximoSabores);
			tamanho.setPreco(preco);
			tamanho.setFatorMultiplicacao(fatorMultiplicacao);
			
			this.salvarTamanhoPizza(tamanho);
			
			break;
			
		case "listar":
			// TODO: implementar o listar via servlet dispatcher
			break;

		case "editar":
			
			tamanho = new TamanhoPizzaModel();
			tamanho.setId(Integer.parseInt(request.getParameter("id")));
			tamanho.setNome(request.getParameter("nome"));
			tamanho.setDescricao(request.getParameter("descricao"));
			tamanho.setNumMaximoSabores(Integer.parseInt(request.getParameter("numMaximoSabores")));
			tamanho.setPreco(Double.parseDouble(request.getParameter("preco")));
			tamanho.setFatorMultiplicacao(Double.parseDouble(request.getParameter("fatorMultiplicacao")));
			
			this.alterarTamanhoPizza(tamanho);
			
			break;
			
		case "excluir":
			String id = request.getParameter("id");
			this.deletarPorId(Long.parseLong(id));
			break;
			
		default:
			break;
		}
		
		return paginaRedirecao;
	}


}
