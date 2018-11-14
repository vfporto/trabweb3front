package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.IngredienteModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class IngredienteController {
	
	private String url = Configuracao.apiUrl + "/ingrediente";

	public List<IngredienteModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<IngredienteModel>) rest.getList(url, "GET", IngredienteModel.class, null, queryParams);
	}

	public void salvarIngrediente(IngredienteModel ingrediente) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, ingrediente, queryParams);
	}

	public void alterarIngrediente(IngredienteModel ingrediente) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, ingrediente, queryParams);
	}

	public IngredienteModel buscarIngredientePorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (IngredienteModel) rest.getObject(url, "GET", IngredienteModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

}
