
<%
	HttpSession sessao = request.getSession();
	Object usuarioLogado = (Object) sessao.getAttribute("usuario");
	
	if(usuarioLogado == null) {
		response.sendRedirect(request.getContextPath()+"/login/telaLogin.jsp");
	}
%>