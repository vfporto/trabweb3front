package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TipoPizzaModel;
import util.Configuracao;
import wsclient.RESTConnectionV3;

public class TipoPizzaController implements ControllerBase {
	
	private String url = Configuracao.apiUrl + "/tipoPizza";

	public List<TipoPizzaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<TipoPizzaModel>) rest.getList(url, "GET", TipoPizzaModel.class, null, queryParams);
	}
	
	public List<TipoPizzaModel> listarTudo() {
		this.url += "/listarTudo";
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<TipoPizzaModel>) rest.getList(url, "GET", TipoPizzaModel.class, null, null);
	}

	public void salvarTipoPizza(TipoPizzaModel tipo) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, tipo, queryParams);
	}

	public void alterarTipoPizza(TipoPizzaModel tipo) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "PUT", null, tipo, queryParams);
	}

	public TipoPizzaModel buscarTipoPizzaPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (TipoPizzaModel) rest.getObject(url, "GET", TipoPizzaModel.class, null, queryParams);
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
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/tipoPizza/listarTipoPizzas.jsp";

		if (acao.equals("listar")) {
			// TODO: implementar o listar via servlet dispatcher
		} else if (acao.equals("excluir")) {
			String id = request.getParameter("id");
			deletarPorId(Long.parseLong(id));
		} else if (acao.equals("incluir")) {
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			TipoPizzaModel tipoPizza = new TipoPizzaModel();
			tipoPizza.setNome(nome);
			tipoPizza.setValorAdicional(Float.parseFloat(valorAdicional));
			salvarTipoPizza(tipoPizza);

		} else if (acao.equals("editar")) {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			TipoPizzaModel tipoPizza = new TipoPizzaModel();
			tipoPizza.setId(Long.parseLong(id));
			tipoPizza.setNome(nome);
			tipoPizza.setValorAdicional(Float.parseFloat(valorAdicional));
			alterarTipoPizza(tipoPizza);

		}

		return paginaRedirecao;
	}


}
