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
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Funcionários</h2>
						
			<form style="text-align: left; font-weight:700;" method="POST" enctype="multipart/form-data" action="<%=request.getContextPath() %>/crud">
			  <input type="hidden" name="acao" value="editarFuncionario" >
			  <input type="hidden" name="id" value="<%= funcionario.getId() %>" >
			  <% if(funcionario.getFoto() != null){ %>
			  	<input type="hidden" name="nomeArquivoAnterior" value="<%= funcionario.getFoto() %>" >
			  	<img src="http://localhost:8080/TrabalhoWeb3Back/uploads/<%= funcionario.getFoto() %>" class="card-img-top">
			  <% } %>
			  Nome:<br>
			  <input style="text-align:left;" type="text" name="nome" class="form-control" value="<%= funcionario.getNome() %>" alt="<%= funcionario.getNome() %>" ><br>
			  
			  CPF:<br>
			  <input type="text" name="cpf" class="form-control-sm" value="<%= funcionario.getCpf() %>"><br>
			  
			  Login:<br>
			  <input type="text" name="login" class="form-control-sm" value="<%= funcionario.getLogin() %>"><br>
			  
			  Senha:<br>
			  <input type="password" name="senha" class="form-control-sm" value="<%= funcionario.getSenha() %>"><br>
			  
			  Foto:<br>
			  <input type="file" name="foto" class="form-control-sm">			  
			  <br><br>
		
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>



<%@ include file="/estrutura/footer.jsp"%>


