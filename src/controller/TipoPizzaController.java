package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.TipoPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class TipoPizzaController {
	
	private String url = Configuracao.apiUrl + "/tipoPizza";

	public List<TipoPizzaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<TipoPizzaModel>) rest.getList(url, "GET", TipoPizzaModel.class, null, queryParams);
	}

	public void salvarTipoPizza(TipoPizzaModel tipo) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, tipo, queryParams);
	}

	public void alterarTipoPizza(TipoPizzaModel tipo) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, tipo, queryParams);
	}

	public TipoPizzaModel buscarTipoPizzaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (TipoPizzaModel) rest.getObject(url, "GET", TipoPizzaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

}
