<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>

<%@ page import="controller.BordaController" %>
<%@ page import="model.BordaModel" %>

<%
String id = request.getParameter("id");
BordaController bordaCont = new BordaController();
BordaModel borda = bordaCont.buscarBordaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Editar Borda</h1>
			<p>Entre com os dados</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/borda/crud.jsp">
			  <input type="hidden" name="acao" value="editarBorda" >
			  <input type="hidden" name="id" value="<%= borda.getId() %>" >
			  Tipo de Borda:<br>
			  <input type="text" name="nome" class="form-control" value="<%= borda.getNome() %>" alt="<%= borda.getNome() %>" >
			  
			  Valor Adicional:
			  <input type="text" name="valorAdicional" class="form-control" value="<%= borda.getValorAdicional() %>" >
			 
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>


