<%@page import="model.BordaModel"%>
<%@page import="controller.BordaController"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<%@ page import="java.util.List"%>

<%
	int limitePorPagina = 3;
	int paginaAtual;
	if (request.getParameter("pag") != null)
		paginaAtual = Integer.parseInt(request.getParameter("pag"));
	else
		paginaAtual = 1;
%>

<%
	BordaController app = new BordaController();
	List<BordaModel> lista = app.listar(paginaAtual, limitePorPagina);
	
%>

<div class="container">
	<div class="row">

		<div class="col-md-10">
			<h2 class="efeito2">Bordas</h2>
			 
		</div>
		<div class="col-md-10 text-right">
			<a href="<%=request.getContextPath()%>/borda/incluirBorda.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-10">
			<table class="table table-hover table-striped">
				<thead>
					<th>Borda</th>
					<th>Valor adicional</th>
					<th class="mw-200">A��o</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(BordaModel borda : lista) {
					%>
					<tr>
						<td>
							<% out.print(borda.getNome()); %>
						</td>
						<td>
							<% out.print(borda.getValorAdicional()); %>
						</td>
						<td class="mw-200"><a
							href="<%=request.getContextPath()%>/borda/editarBorda.jsp?id=<%=borda.getId() %>"
							class="btn btn-outline-primary btn-sm">Editar</a> <a
							href="<%=request.getContextPath()%>/dispatcher?classe=Borda&id=<%=borda.getId() %>&acao=excluir"
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
				class="btn btn-sm btn-secondary">P�gina Anterior</button>
			<button onclick="proximaPagina()" type="button"
				<%if (lista == null)
				         out.print("disabled");
				else if (lista.size() < limitePorPagina)
				               out.print("disabled");%>
				class="btn btn-secondary btn-sm">Pr�xima P�gina</button>

		</div>


	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>