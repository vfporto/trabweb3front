package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.SaborPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class SaborPizzaController {
	
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

}
