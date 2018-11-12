<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<%@ page import="controller.IngredienteController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.IngredienteModel"%>

<%
	ClienteController app = new ClienteController();
	List<ClienteModel> lista = app.listarClientes();
%>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<h1>Clientes</h1>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/cliente/incluirCliente.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-striped">
				<thead>
					<th>Nome</th>
					<th>CPF</th>
					<th>Login</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
    					for(ClienteModel cliente : lista) {
    				%>
					<tr>
						<td>
							<% out.print(cliente.getNome()); 
    						out.print("<br/>");
    						if(cliente.getDocumentos() != null)
	    						for(int i=0; i<cliente.getDocumentos().size(); i++){
	    							out.print("código é: "+ cliente.getDocumentos().get(i).getCodigo()+"<br/>");
	    						}
    							%>
							</td>
							<td>
								<% out.print(cliente.getCpf()); %>
							</td>
							<td>
								<% out.print(cliente.getLogin()); %>
							</td>
							<td class="mw-200">
								<a href="<%=request.getContextPath()%>/cliente/editarCliente.jsp?id=<%=cliente.getId() %>"	class="btn btn-primary">Editar</a>
								<a href="<%=request.getContextPath()%>/cliente/crud.jsp?id=<%=cliente.getId() %>&acao=excluirCliente" onclick="return confirmacaoDelecao()" class="btn btn-danger">Excluir</a>
							</td>
						</tr>
						<% } %>
					</tbody>
				
				</table>
		</div>
	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>