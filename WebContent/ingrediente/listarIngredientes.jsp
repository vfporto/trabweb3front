<%@page import="model.IngredienteModel"%>
<%@page import="controller.IngredienteController"%>
<%@page import="java.util.List"%>

<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>
<%@ include file="/login/controleAcesso.jsp"%>

<%
	int limitePorPagina = 3;
	int paginaAtual;
	if (request.getParameter("pag") != null)
		paginaAtual = Integer.parseInt(request.getParameter("pag"));
	else
		paginaAtual = 1;
%>

<%
	IngredienteController controller = new IngredienteController();
	List<IngredienteModel> lista = controller.listar(paginaAtual, limitePorPagina);
	
%>

<div class="container">
	<div class="row">

		<div class="col-md-10">
			<h2 class="efeito2">Ingredientes</h2>
		</div>
		<div class="col-md-10 text-right">
			<a href="<%=request.getContextPath()%>/ingrediente/incluirIngrediente.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-10">
			<table class="table table-hover table-striped">
				<thead>
					<th>Ingrediente</th>
					<th>Qt. Estoque</th>
					<th>Qt. Mín.</th>
					<th>Qt. Máx.</th>
					<th>Un. Medida</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(IngredienteModel ingrediente : lista) {
					%>
					<tr>
						<td>
							<% out.print(ingrediente.getNome()); %>
						</td>
						<td>
							<% out.print(ingrediente.getQtEstoque()); %>
						</td>
						<td>
							<% out.print(ingrediente.getQtMinima()); %>
						</td>
						<td>
							<% out.print(ingrediente.getQtMaxima()); %>
						</td>
						<td>
							<% out.print(ingrediente.getUnidadeMedida()); %>
						</td>
						<td class="mw-200" >
							<a href="<%=request.getContextPath()%>/ingrediente/editarIngrediente.jsp?id=<%=ingrediente.getId() %>" id="btn-editar" class="btn btn-outline-primary btn-sm">Editar</a> 
							<a href="<%=request.getContextPath()%>/dispatcher?classe=Ingrediente&id=<%=ingrediente.getId() %>&acao=excluir"
							onclick="return confirmacaoDelecao()" id="btn-excluir" class="btn btn-outline-danger btn-sm">Excluir</a>
						</td>
					</tr>
					<% } %>
				</tbody>

			</table>
		</div>


		<div class="col-md-12 text-center">

			<button onclick="paginaAnterior()" type="button"
				<%if (paginaAtual == 1)
				         out.print("disabled"); %>
				class="btn btn-secondary btn-sm">Página Anterior</button>
			<button onclick="proximaPagina()" type="button"
				<%if (lista == null)
				         out.print("disabled");
			          else if (lista.size() < limitePorPagina)
				               out.print("disabled");%>
				class="btn btn-secondary btn-sm">Próxima Página</button>

		</div>


	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>