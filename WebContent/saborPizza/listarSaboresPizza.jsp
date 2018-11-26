<%@page import="model.SaborPizzaModel"%>
<%@page import="controller.SaborPizzaController"%>
<%@page import="model.BordaModel"%>
<%@page import="controller.BordaController"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<%@ page import="controller.FuncionarioController"%>
<%@ page import="java.util.List"%>
<%@ page import="model.FuncionarioModel"%>

<%
	int limitePorPagina = 3;
	int paginaAtual;
	if (request.getParameter("pag") != null)
		paginaAtual = Integer.parseInt(request.getParameter("pag"));
	else
		paginaAtual = 1;
%>

<%
	SaborPizzaController app = new SaborPizzaController();
	List<SaborPizzaModel> lista = app.listar(paginaAtual, limitePorPagina);
	
%>

<div class="container">
	<div class="row">

		<div class="col-md-6">
			<h1>Sabores de Pizza</h1>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/saborPizza/incluirSaborPizza.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-striped">
				<thead>
					<th>Tipo Pizza</th>
					<th>Sabor da Pizza</th>
					<th>Valor adicional</th>
					<th class="mw-200">A��o</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(SaborPizzaModel sabor : lista) {
					%>
					<tr>
						<td>
							<% out.print(sabor.getTipoPizza().getNome()); %>
						</td>
						<td title="<%=sabor.getDescricao()%>">
							<% out.print(sabor.getNome()); %>
						</td>
						<td>
							<% out.print(sabor.getValorAdicional()); %>
						</td>
						<td class="mw-200"><a
							href="<%=request.getContextPath()%>/saborPizza/editarSaborPizza.jsp?id=<%=sabor.getId() %>"
							class="btn btn-primary">Editar</a> <a
							href="<%=request.getContextPath()%>/dispatcher?classe=SaborPizza&id=<%=sabor.getId() %>&acao=excluir"
							onclick="return confirmacaoDelecao()" class="btn btn-danger">Excluir</a>
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
				class="btn btn-lg btn-primary">P�gina Anterior</button>
			<button onclick="proximaPagina()" type="button"
				<%if (lista == null)
				         out.print("disabled");
			          else if (lista.size() == 0)
				               out.print("disabled");%>
				class="btn btn-secondary btn-lg">Pr�xima P�gina</button>

		</div>


	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>