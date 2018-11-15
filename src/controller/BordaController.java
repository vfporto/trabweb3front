package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.BordaModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class BordaController {
	private String url = Configuracao.apiUrl + "/borda";

	public List<BordaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<BordaModel>) rest.getList(url, "GET", BordaModel.class, null, queryParams);
	}

	public void salvarBorda(BordaModel borda) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, borda, queryParams);
	}

	public void alterarBorda(BordaModel borda) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, borda, queryParams);
	}

	public BordaModel buscarBordaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (BordaModel) rest.getObject(url, "GET", BordaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

}
