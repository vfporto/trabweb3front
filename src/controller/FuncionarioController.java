package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.FuncionarioModel;
import wsclient.RESTConnectionV2;

public class FuncionarioController {

	public List<FuncionarioModel> listar(int pagina, int limitePorPagina) {
		String url = "http://localhost:8080/FuncionarioBack/api/funcionario/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<FuncionarioModel>) rest.getList(url, "GET", FuncionarioModel.class, null, queryParams);
	}

	public void salvarFuncionario(FuncionarioModel funcionario) {
		String url = "http://localhost:8080/FuncionarioBack/api/funcionario/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, funcionario, queryParams);
	}

	public void alterarFuncionario(FuncionarioModel funcionario, String nomeArquivoAnterior) {
		String url = "http://localhost:8080/FuncionarioBack/api/funcionario/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, funcionario, queryParams);
	}

	public FuncionarioModel buscarFuncionarioPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/funcionario/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (FuncionarioModel) rest.getObject(url, "GET", FuncionarioModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		String url = "http://localhost:8080/FuncionarioBack/api/funcionario/deletar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

}
