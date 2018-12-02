package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BordaIngredienteModel;
import model.BordaModel;
import model.IngredienteModel;
import util.Configuracao;
import wsclient.RESTConnectionV3;

public class BordaController implements ControllerBase {
	private String url = Configuracao.apiUrl + "/borda";

	public List<BordaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<BordaModel>) rest.getList(url, "GET", BordaModel.class, null, queryParams);
	}

	public void salvarBorda(BordaModel borda) {
		this.url += "/salvar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, borda, queryParams);
	}

	public void alterarBorda(BordaModel borda) {
		this.url += "/alterar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "PUT", null, borda, queryParams);
	}

	public BordaModel buscarBordaPorId(long id) {
		this.url += "/buscar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (BordaModel) rest.getObject(url, "GET", BordaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

	@Override
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/borda/listarBordas.jsp";

		if (acao.equals("listar")) {
			// TODO: implementar o listar via servlet dispatcher
		} 
		
		else if (acao.equals("excluir")) {
			String id = request.getParameter("id");
			deletarPorId(Long.parseLong(id));
		} 
		
		else if (acao.equals("incluir")) {
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			BordaModel borda = new BordaModel();
			borda.setNome(nome);
			borda.setValorAdicional(Float.parseFloat(valorAdicional));
			salvarBorda(borda);

		} 
		
		else if (acao.equals("editar")) {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			BordaModel borda = new BordaModel();
			borda.setId(Long.parseLong(id));
			borda.setNome(nome);
			borda.setValorAdicional(Float.parseFloat(valorAdicional));
			
			
			/*
			System.out.println("---------------------");
			String[] listaIngred = request.getParameterValues("ingred");
			borda.setListaIngredientes(new ArrayList<>());
			for (String ingred : listaIngred) {
				String[] item = ingred.split(";");
				Long idIng = Long.parseLong(item[0]);
				IngredienteModel ing = new IngredienteModel();
				ing.setId(idIng);
				//IngredienteModel aux = new IngredienteController().buscarIngredientePorId(idIng);
				//System.out.println("Item "+aux.getNome()+" : "+item[1]+" gramas");
				BordaIngredienteModel aux = new BordaIngredienteModel();
				aux.setBorda(borda);
				aux.setIngrediente(ing);
				borda.getListaIngredientes().add(aux);
			}
			System.out.println("---------------------");
			*/
			alterarBorda(borda);

		}

		return paginaRedirecao;
	}

}
