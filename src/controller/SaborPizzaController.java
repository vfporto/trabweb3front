package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IngredienteModel;
import model.SaborPizzaIngredienteModel;
import model.SaborPizzaModel;
import model.TipoPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class SaborPizzaController implements BaseController {
	
	private String url = Configuracao.apiUrl + "/saborPizza";

	public List<SaborPizzaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<SaborPizzaModel>) rest.getList(url, "GET", SaborPizzaModel.class, null, queryParams);
	}

	public void salvarSaborPizza(SaborPizzaModel saborPizza) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, saborPizza, queryParams);
	}

	public void alterarSaborPizza(SaborPizzaModel saborPizza) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, saborPizza, queryParams);
	}

	public SaborPizzaModel buscarSaborPizzaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (SaborPizzaModel) rest.getObject(url, "GET", SaborPizzaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}
	
	@Override
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*	private TipoPizzaModel tipoPizza;
		private String nome;
		private double valorAdicional;
		private String foto;
		private List<SaborPizzaIngredienteModel> listaIngredientes;*/
		
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/saborPizza/listarSaboresPizza.jsp";

		if (acao.equals("listar")) {
			// TODO: implementar o listar via servlet dispatcher
		} 
		else if (acao.equals("excluir")) {
			String id = request.getParameter("id");
			deletarPorId(Long.parseLong(id));
			
		} 
		else if (acao.equals("incluir")) {
			Long idTipoPizza = Long.parseLong(request.getParameter("idTipoPizza"));
			String nome = request.getParameter("nome");
			String descricao = request.getParameter("descricao");
			double valorAdicional = Double.parseDouble(request.getParameter("valorAdicional"));

			SaborPizzaModel sabor = new SaborPizzaModel(); 
			
			sabor.setNome(nome);
			sabor.setDescricao(descricao);
			sabor.setValorAdicional(valorAdicional);

			TipoPizzaModel tipoPizza = new TipoPizzaModel();
			tipoPizza.setId(idTipoPizza);
			sabor.setTipoPizza(tipoPizza);
			
			this.salvarSaborPizza(sabor);

		} 
		else if (acao.equals("editar")) {
			//TODO: Generalizar codigo... está muito repetido
			long id = Long.parseLong(request.getParameter("id"));
			Long idTipoPizza = Long.parseLong(request.getParameter("idTipoPizza"));
			String nome = request.getParameter("nome");
			String descricao = request.getParameter("descricao");
			double valorAdicional = Double.parseDouble(request.getParameter("valorAdicional"));
			
			
			SaborPizzaModel sabor = new SaborPizzaModel(); 
			
			sabor.setId(id);
			sabor.setNome(nome);
			sabor.setDescricao(descricao);
			sabor.setValorAdicional(valorAdicional);

			TipoPizzaModel tipoPizza = new TipoPizzaModel();
			tipoPizza.setId(idTipoPizza);
			sabor.setTipoPizza(tipoPizza);
			
			alterarSaborPizza(sabor);

		}

		return paginaRedirecao;
	}


}
