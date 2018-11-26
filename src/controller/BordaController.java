package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BordaModel;
import util.Configuracao;
import wsclient.RESTConnectionV2;

public class BordaController implements BaseController {
	private String url = Configuracao.apiUrl + "/borda";

	public List<BordaModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (List<BordaModel>) rest.getList(url, "GET", BordaModel.class, null, queryParams);
	}

	public void salvarBorda(BordaModel borda) {
		this.url += "/salvar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "POST", null, borda, queryParams);
	}

	public void alterarBorda(BordaModel borda) {
		this.url += "/alterar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "PUT", null, borda, queryParams);
	}

	public BordaModel buscarBordaPorId(long id) {
		this.url += "/buscar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		return (BordaModel) rest.getObject(url, "GET", BordaModel.class, null, queryParams);
	}

	public void deletarPorId(long id) {
		this.url += "/deletar";
		Map<String, Object> queryParams = new HashMap<String, Object>();
		queryParams.put("id", id);
		RESTConnectionV2 rest = new RESTConnectionV2();
		rest.getObject(url, "DELETE", null, null, queryParams);
	}

	@Override
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String acao = request.getParameter("acao");
		String paginaRedirecao = "/borda/listarBordas.jsp";

		if (acao.equals("listar")) {
			// TODO: implementar o listar via servlet dispatcher
		} else if (acao.equals("excluir")) {
			String id = request.getParameter("id");
			deletarPorId(Long.parseLong(id));
		} else if (acao.equals("incluir")) {
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			BordaModel borda = new BordaModel();
			borda.setNome(nome);
			borda.setValorAdicional(Float.parseFloat(valorAdicional));
			salvarBorda(borda);

		} else if (acao.equals("editar")) {
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String valorAdicional = request.getParameter("valorAdicional");

			BordaModel borda = new BordaModel();
			borda.setId(Long.parseLong(id));
			borda.setNome(nome);
			borda.setValorAdicional(Float.parseFloat(valorAdicional));
			alterarBorda(borda);

		}

		return paginaRedirecao;
	}

}
