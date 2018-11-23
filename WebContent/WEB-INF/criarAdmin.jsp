<%@page import="controller.FuncionarioController"%>
<%@page import="model.FuncionarioModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	FuncionarioModel admin = new FuncionarioModel();

	admin.setLogin("admin");
	admin.setSenha("admin");
	admin.setNome("Administrador");
	
	FuncionarioController controller = new FuncionarioController();
	controller.salvarFuncionario(admin);

%>


</body>
</html>