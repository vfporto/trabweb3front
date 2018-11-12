<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<%@ page import="controller.FuncionarioController" %>
<%@ page import="model.FuncionarioModel" %>

<%
String id = request.getParameter("id");
FuncionarioController funcionarioCont = new FuncionarioController();
FuncionarioModel funcionario = funcionarioCont.buscarFuncionarioPorId( Long.parseLong(id) );
%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Edição de Funcionario</h1>
			<p>Entre com os dados</p>
						
			<form method="POST" enctype="multipart/form-data" action="<%=request.getContextPath() %>/crud">
			  <input type="hidden" name="acao" value="editarFuncionario" >
			  <input type="hidden" name="id" value="<%= funcionario.getId() %>" >
			  <% if(funcionario.getFoto() != null){ %>
			  	<input type="hidden" name="nomeArquivoAnterior" value="<%= funcionario.getFoto() %>" >
			  	<img src="http://localhost:8080/FuncionarioBack/uploads/<%= funcionario.getFoto() %>" class="card-img-top">
			  <% } %>
			  Nome:<br>
			  <input type="text" name="nome" class="form-control" value="<%= funcionario.getNome() %>" alt="<%= funcionario.getNome() %>" >
			  
			  CPF:<br>
			  <input type="text" name="cpf" class="form-control" value="<%= funcionario.getCpf() %>">
			  
			  Login:<br>
			  <input type="text" name="login" class="form-control" value="<%= funcionario.getLogin() %>">
			  
			  Senha:<br>
			  <input type="password" name="senha" class="form-control" value="<%= funcionario.getSenha() %>">
			  
			  Foto:<br>
			  <input type="file" name="foto" class="form-control">			  
			  <br><br>
		
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>



<%@ include file="/estrutura/footer.jsp"%>


