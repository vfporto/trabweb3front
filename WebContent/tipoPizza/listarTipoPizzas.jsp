<%@page import="controller.TipoPizzaController"%>
<%@page import="model.TipoPizzaModel"%>
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
	TipoPizzaController app = new TipoPizzaController();
	List<TipoPizzaModel> lista = app.listar(paginaAtual, limitePorPagina);
	
%>

<div class="container">
	<div class="row">

		<div class="col-md-6">
			<h1>Tipos de Pizza</h1>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/tipoPizza/incluirTipoPizza.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-12">
			<table class="table table-hover table-striped">
				<thead>
					<th>Borda</th>
					<th>Valor adicional</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(TipoPizzaModel tipo : lista) {
					%>
					<tr>
						<td>
							<% out.print(tipo.getNome()); %>
						</td>
						<td>
							<% out.print(tipo.getValorAdicional()); %>
						</td>
						<td class="mw-200"><a
							href="<%=request.getContextPath()%>/tipoPizza/editarTipoPizza.jsp?id=<%=tipo.getId() %>"
							class="btn btn-outline-warning btn-sm">Editar</a> <a
							href="<%=request.getContextPath()%>/dispatcher?classe=TipoPizza&id=<%=tipo.getId() %>&acao=excluir"
							onclick="return confirmacaoDelecao()" class="btn btn-outline-danger btn-sm">Excluir</a>
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
				class="btn btn-sm btn-secondary">Página Anterior</button>
			<button onclick="proximaPagina()" type="button"
				<%if (lista == null)
				         out.print("disabled");
			          else if (lista.size() == 0)
				               out.print("disabled");%>
				class="btn btn-secondary btn-sm">Próxima Página</button>

		</div>


	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>