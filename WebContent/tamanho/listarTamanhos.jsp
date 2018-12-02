<%@page import="model.TamanhoPizzaModel"%>
<%@page import="controller.TamanhoPizzaController"%>
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
	TamanhoPizzaController controller = new TamanhoPizzaController();
	List<TamanhoPizzaModel> lista = controller.listar(paginaAtual, limitePorPagina);
	
%>

<div class="container">
	<div class="row">

		<div class="col-md-10">
			<h2 class="efeito2">Tamanhos de Pizza</h2>
			 
		</div>
		<div class="col-md-10 text-right">
			<a href="<%=request.getContextPath()%>/tamanho/incluirTamanho.jsp"
				class="btn btn-success">Incluir</a>
		</div>
		<div class="col-md-10">
			<table class="table table-hover table-striped">
				<thead>
					<th>Tamanho</th>
					<th>Máx. Sabores</th>
					<th>Preço (R$)</th>
					<th>Fator Mult.</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
					if(lista != null)
						for(TamanhoPizzaModel tamanho : lista) {
					%>
					<tr>
						<td title="<%=tamanho.getDescricao()%>">
							<%=tamanho.getNome() %>
						</td>
						<td>
							<%=tamanho.getNumMaximoSabores()%>
						</td>
						<td>
							<%=tamanho.getNumMaximoSabores()%>
						</td>
						<td>
							<%=tamanho.getPreco()%>
						</td>
						<td>
							<%=tamanho.getFatorMultiplicacao()%>
						</td>
						<td class="mw-200"><a
							href="<%=request.getContextPath()%>/tamanho/editarTamanho.jsp?id=<%=tamanho.getId() %>"
							class="btn btn-outline-warning btn-sm">Editar</a> <a
							href="<%=request.getContextPath()%>/dispatcher?classe=TamanhoPizza&id=<%=tamanho.getId() %>&acao=excluir"
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
				else if (lista.size() < limitePorPagina)
				               out.print("disabled");%>
				class="btn btn-secondary btn-sm">Próxima Página</button>

		</div>


	</div>
</div>


<%@ include file="/estrutura/footer.jsp"%>