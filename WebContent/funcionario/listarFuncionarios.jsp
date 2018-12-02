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
	FuncionarioController app = new FuncionarioController();
	List<FuncionarioModel> lista = app.listar(paginaAtual,limitePorPagina);
%>

<div class="container">
	<div class="row">

		<div class="col-md-6">
			<h2 class="efeito2">Funcionários</h2>
		</div>
		<div class="col-md-6 text-right">
			<a href="<%=request.getContextPath()%>/funcionario/incluirFuncionario.jsp"
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
					if(lista != null)
						for(FuncionarioModel funcionario : lista) {
					%>
					<tr>
						<td>
							<% out.print(funcionario.getNome()); %>
						</td>
						<td>
							<% out.print(funcionario.getCpf()); %>
						</td>
						<td>
							<% out.print(funcionario.getLogin()); %>
						</td>
						<td class="mw-200"><a
							href="<%=request.getContextPath()%>/funcionario/editarFuncionario.jsp?id=<%=funcionario.getId() %>"
							class="btn btn-outline-warning btn-sm">Editar</a> <a
							href="<%=request.getContextPath()%>/dispatcher?classe=Funcionario&id=<%=funcionario.getId() %>&acao=excluirFuncionario"
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
				class="btn btn-lg btn-secondary btn-sm">Página Anterior</button>
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