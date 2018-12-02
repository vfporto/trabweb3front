package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.FuncionarioModel;
import util.Configuracao;
import wsclient.RESTConnectionV3;

public class FuncionarioController implements ControllerBase {
	private String url = Configuracao.apiUrl + "/funcionario";

	public List<FuncionarioModel> listar(int pagina, int limitePorPagina) {
		this.url += "/listar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("pagina", pagina);
		queryParams.put("limitePorPagina", limitePorPagina);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (List<FuncionarioModel>) rest.getList(url, "GET", FuncionarioModel.class, null, queryParams);
	}

	public void salvarFuncionario(FuncionarioModel funcionario) {
		this.url += "/salvar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "POST", null, funcionario, queryParams);
	}

	public void alterarFuncionario(FuncionarioModel funcionario, String nomeArquivoAnterior) {
		this.url += "/alterar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("nomeArquivoAnterior", nomeArquivoAnterior);
		RESTConnectionV3 rest = new RESTConnectionV3();
		rest.getObject(url, "PUT", null, funcionario, queryParams);
	}

	public FuncionarioModel buscarFuncionarioPorId(long id) {
		this.url += "/buscar";
		Map<String,Object> queryParams = new HashMap<String,Object>();
		queryParams.put("id", id);
		RESTConnectionV3 rest = new RESTConnectionV3();
		return (FuncionarioModel) rest.getObject(url, "GET", FuncionarioModel.class, null, queryParams);
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
		String proximaPagina = "/funcionario/listarFuncionarios.jsp";

		if (acao.equals("incluirFuncionario")) {
			//Coletando valores do formul�rio
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			Part filePart = request.getPart("foto");
			String nomeArquivo = null;
			if(filePart.getSize() > 0) {
				UploadController uploadCont = new UploadController();
				nomeArquivo = uploadCont.salvar(filePart);
			}

			//Criando um novo objeto de Funcionario e alimentando com os valores do form
			FuncionarioModel funcionario = new FuncionarioModel();
			funcionario.setNome(nome);
			funcionario.setCpf(cpf);
			funcionario.setLogin(login);
			funcionario.setSenha(senha);
			funcionario.setFoto(nomeArquivo);
			FuncionarioController funcionarioCont = new FuncionarioController();
			funcionarioCont.salvarFuncionario(funcionario);
		} 
		
		else if (acao.equals("editarFuncionario")) {
			//Coletando valores do formul�rio
			String id = request.getParameter("id");
			String nome = request.getParameter("nome");
			String cpf = request.getParameter("cpf");
			String login = request.getParameter("login");
			String senha = request.getParameter("senha");

			Part filePart = request.getPart("foto");
			String nomeArquivoAnterior = request.getParameter("nomeArquivoAnterior");
			String nomeArquivo = null;
			if(filePart.getSize() > 0) {
				UploadController uploadCont = new UploadController();
				nomeArquivo = uploadCont.salvar(filePart);	
			}else {
				nomeArquivo = nomeArquivoAnterior;
				nomeArquivoAnterior = null;
				if(nomeArquivo != null)
					if(nomeArquivo.equals("") || nomeArquivo.equals("null"))
						nomeArquivo = null;
			}

			//Criando um novo objeto de Funcionario e alimentando com os valores do form
			FuncionarioModel funcionario = new FuncionarioModel();
			funcionario.setId(Long.parseLong(id));
			funcionario.setNome(nome);
			funcionario.setCpf(cpf);
			funcionario.setLogin(login);
			funcionario.setSenha(senha);
			funcionario.setFoto(nomeArquivo);
			
			this.alterarFuncionario(funcionario,nomeArquivoAnterior);
		} 
		
		else if (acao.equals("excluirFuncionario")) {
			String id = request.getParameter("id");		
			
			this.deletarPorId(Long.parseLong(id));
		}
		
		return proximaPagina;
	}

}
