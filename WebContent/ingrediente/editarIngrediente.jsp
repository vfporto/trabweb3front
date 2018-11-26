<%@page import="model.IngredienteModel"%>
<%@page import="controller.IngredienteController"%>

<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>



<%
String id = request.getParameter("id");
IngredienteController ctl = new IngredienteController();
IngredienteModel ingrediente = ctl.buscarIngredientePorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Editar Ingrediente</h1>
			<p>Entre com os dados</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="Ingrediente" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%=ingrediente.getId()%>" >
			  Ingrediente:<br>
			  <input type="text" name="nome" class="form-control" value="<%= ingrediente.getNome() %>" alt="<%= ingrediente.getNome() %>" >
			  
			  Quantidade Máxima : <br>
			  <input type="text" name="qtMaxima" class="form-control"  value="<%=ingrediente.getQtMaxima() %>">
			  
			  Quantidade Mínima : <br>
			  <input type="text" name="qtMinima" class="form-control" value="<%=ingrediente.getQtMinima() %>">
			  
			  Quantidade em Estoque: <br>
			  <input type="text" name="qtEstoque" class="form-control" value="<%=ingrediente.getQtEstoque() %>">
			 
			  Unidade Medida : <br>
			  <input type="text" name="unidadeMedida" class="form-control" value="<%=ingrediente.getUnidadeMedida() %>">
			  
 
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">

			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>


