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
	<div class="col-md-6"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Ingrediente</h2>
			<p>Entre com os seguintes dados:</p>
						
			<form style="text-align:left; font-weight: 700;" method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="Ingrediente" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%=ingrediente.getId()%>" >
			  Ingrediente:<br>
			  <input type="text" name="nome" class="form-control" value="<%= ingrediente.getNome() %>" alt="<%= ingrediente.getNome() %>" style="width: 70%;"><br>
			  
			  Quantidade Máxima : <br>
			  <input type="text" name="qtMaxima" class="form-control-sm"  value="<%=ingrediente.getQtMaxima() %>"><br>
			  
			  Quantidade Mínima : <br>
			  <input type="text" name="qtMinima" class="form-control-sm" value="<%=ingrediente.getQtMinima() %>"><br>
			  
			  Quantidade em Estoque: <br>
			  <input type="text" name="qtEstoque" class="form-control-sm" value="<%=ingrediente.getQtEstoque() %>"><br>
			 
			  Unidade Medida : <br>
			  <input type="text" name="unidadeMedida" class="form-control-sm" value="<%=ingrediente.getUnidadeMedida() %>">
			  <br>
			  
 
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">

			
			</form> 

		</div>
	</div>
	<div class="col-md-12"></div>
</div>


