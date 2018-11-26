package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.IngredienteModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class IngredienteController implements BaseController {
	
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
	
	@Override
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/ingrediente/listarIngredientes.jsp";

		if (acao.equals("listar")) {
			// TODO: implementar o listar via servlet dispatcher
		} else if (acao.equals("excluir")) {
			String id = request.getParameter("id");
			deletarPorId(Long.parseLong(id));
		} else if (acao.equals("incluir")) {
			String nome = request.getParameter("nome");
			double qtEstoque = Double.parseDouble(request.getParameter("qtEstoque"));
			double qtMinima = Double.parseDouble(request.getParameter("qtMinima"));
			double qtMaxima = Double.parseDouble(request.getParameter("qtMaxima"));;
			String unidadeMedida = request.getParameter("unidadeMedida");

			IngredienteModel ing = new IngredienteModel();
			ing.setNome(nome);
			ing.setQtEstoque(qtEstoque);
			ing.setQtMaxima(qtMaxima);
			ing.setQtMinima(qtMinima);
			ing.setUnidadeMedida(unidadeMedida);
			salvarIngrediente(ing);

		} else if (acao.equals("editar")) {
			//TODO: Generalizar codigo... est� muito repetido
			long id = Long.parseLong(request.getParameter("id"));
			String nome = request.getParameter("nome");
			double qtEstoque = Double.parseDouble(request.getParameter("qtEstoque"));
			double qtMinima = Double.parseDouble(request.getParameter("qtMinima"));
			double qtMaxima = Double.parseDouble(request.getParameter("qtMaxima"));;
			String unidadeMedida = request.getParameter("unidadeMedida");

			IngredienteModel ing = new IngredienteModel();
			ing.setId(id);
			ing.setNome(nome);
			ing.setQtEstoque(qtEstoque);
			ing.setQtMaxima(qtMaxima);
			ing.setQtMinima(qtMinima);
			ing.setUnidadeMedida(unidadeMedida);
			alterarIngrediente(ing);

		}

		return paginaRedirecao;
	}

}
