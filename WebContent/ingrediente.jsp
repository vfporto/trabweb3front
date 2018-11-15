<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<%@ page import="controller.IngredienteController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.IngredienteModel"%>

<%
	IngredienteController app = new IngredienteController();
	List<IngredienteModel> lista = app.listarIngredientes();
%>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h1>Ingredientes</h1>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/ingrediente/incluirIngrediente.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-striped">
				<thead>
					<th>Nome</th>
					<th>Quantidade Máxima</th>
					<th>Quantidade Mínima</th>
					<th>Unidade Medida</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
    					for(IngredienteModel ingrediente : lista) {
    				%>
					<tr>
						
							<td>
								<% out.print(ingrediente.getNome()); %>
							</td>
							<td>
								<% out.print(ingrediente.getQtMaxima()); %>
							</td>
							<td>
							    <% out.print(ingrediente.getQtMinima()); %>
							</td>
							<td>
							    <% out.print(ingrediente.getUnidadeMedida()); %>  
							</td>      
							<td class="mw-200">
								<a href="<%=request.getContextPath()%>/ingrediente/editarIngrediente.jsp?id=<%=ingrediente.getId() %>"	class="btn btn-primary">Editar</a>
								<a href="<%=request.getContextPath()%>/ingrediente/crud.jsp?id=<%=ingrediente.getId() %>&acao=excluirIngrediente" onclick="return confirmacaoDelecao()" class="btn btn-danger">Excluir</a>
							</td>
						</tr>
						<% } %>
					</tbody>
				
				</table>
		</div>
	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>