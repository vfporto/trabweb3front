<%@page import="controller.FuncionarioController"%>
<%@page import="model.FuncionarioModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pizzaria</title>
</head>
<body>

<%
	FuncionarioModel admin = new FuncionarioModel();

	admin.setLogin("admin");
	admin.setSenha("admin");
	admin.setNome("Administrador");
	admin.setCpf("123456");
	
	FuncionarioController controller = new FuncionarioController();
	controller.salvarFuncionario(admin);

%>


</body>
</html>