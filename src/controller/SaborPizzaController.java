package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.SaborPizzaIngredienteModel;
import model.BordaModel;
import model.IngredienteModel;
import model.SaborPizzaIngredienteModel;
import model.SaborPizzaModel;
import model.TipoPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV3;

public class SaborPizzaController implements ControllerBase {
	
	private String url = Configuracao.apiUrl + "/saborPizza";

	public List<SaborPizzaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<SaborPizzaModel>) rest.getList(url, "GET", SaborPizzaModel.class, null, queryParams);
	}

	public void salvarSaborPizza(SaborPizzaModel saborPizza) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, saborPizza, queryParams);
	}

	public void alterarSaborPizza(SaborPizzaModel saborPizza) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "PUT", null, saborPizza, queryParams);
	}

	public void incluirIngrediente(SaborPizzaIngredienteModel ingrediente) {
		String url = Configuracao.apiUrl + "/saborPizzaIngrediente/salvar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, ingrediente, queryParams);
	}
	
	
	public SaborPizzaModel buscarSaborPizzaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (SaborPizzaModel) rest.getObject(url, "GET", SaborPizzaModel.class, null, queryParams);
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
		/*	ATRIBUTOS do Model
		private TipoPizzaModel tipoPizza;
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
			sabor.setListaIngredientes(new ArrayList<>());
			sabor.getListaIngredientes().clear();
			
			alterarSaborPizza(sabor);
			
			System.out.println("---------------------");
			String[] listaIngred = request.getParameterValues("ingred");
			if(listaIngred != null) {
				for (String ingred : listaIngred) {
					String[] item = ingred.split(";");
					long idIng = Long.parseLong(item[0]);
					double qtd = Double.parseDouble(item[1]);
					
					IngredienteModel ing = new IngredienteModel(idIng);
					SaborPizzaModel sp = new SaborPizzaModel();
					sp.setId(id);
					
					SaborPizzaIngredienteModel aux = new SaborPizzaIngredienteModel();
					aux.setSaborPizza(sp);
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
