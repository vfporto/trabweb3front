<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="controller.LoginController"%>
<%@ page import="model.PessoaModel"%>
<%
	//Obtenção dos valores dos campos do formulário que submeteu para este arquivo
	HttpSession sessao = request.getSession();
	String login = request.getParameter("login");
	String senha = request.getParameter("senha");

	//Instância de um objeto da classe LoginController pra conseguir invocar o método de validação do login
	LoginController loginController = new LoginController();
	//Invocação do método de validação de login (retorno null ou, se está correto, um objeto)
	Object usuario = loginController.validarLogin(login, senha);

	//Se usuario não for nulo, ou seja, o retorno foi um objeto... posso logar a pessoa...
	if (usuario != null) {
		sessao.setAttribute("usuario", usuario);
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else {
		//Se caiu nesse else, é porque o retorno veio nulo. Logo, houve erro na digitação dos dados de login
		response.sendRedirect(request.getContextPath() + "/login/telaLogin.jsp");
	}
%>