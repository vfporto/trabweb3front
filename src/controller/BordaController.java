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
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<BordaModel>) rest.getList(url+"/listar", "GET", BordaModel.class, null, queryParams);
	}

	public void salvarBorda(BordaModel borda) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url+"/bordaIngrediente/salvar", "POST", null, borda, queryParams);
	}
	
	public void incluirIngrediente(BordaIngredienteModel ingrediente) {
		String url = Configuracao.apiUrl + "/bordaIngrediente/salvar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, ingrediente, queryParams);
	}
	

	public void alterarBorda(BordaModel borda) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url+"/alterar", "PUT", null, borda, queryParams);
	}

	public BordaModel buscarBordaPorId(long id) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (BordaModel) rest.getObject(url+"/buscar", "GET", BordaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url+"/deletar", "DELETE", null, null, queryParams);
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
			borda.setListaIngredientes(new ArrayList<>());
			borda.getListaIngredientes().clear();
			alterarBorda(borda);
			
			
			System.out.println("---------------------");
			String[] listaIngred = request.getParameterValues("ingred");
			if(listaIngred != null) {
				for (String ingred : listaIngred) {
					String[] item = ingred.split(";");
					long idIng = Long.parseLong(item[0]);
					double qtd = Double.parseDouble(item[1]);
					
					IngredienteModel ing = new IngredienteModel(idIng);
					BordaModel bd = new BordaModel(Long.parseLong(id));
					
					BordaIngredienteModel aux = new BordaIngredienteModel();
					aux.setBorda(bd);
					aux.setIngrediente(ing);
					aux.setQuantidade(qtd);
					
					this.incluirIngrediente(aux);
					
				}
			}
			System.out.println("---------------------");
			

		}

		return paginaRedirecao;
	}

}
