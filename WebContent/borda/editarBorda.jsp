<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>

<%@ page import="controller.BordaController" %>
<%@ page import="model.BordaModel" %>

<%
String id = request.getParameter("id");
BordaController bordaCont = new BordaController();
BordaModel borda = bordaCont.buscarBordaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Borda</h2]>
			<p>Entre com os seguintes dados:</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="Borda" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%= borda.getId() %>" >
			  Tipo de Borda:<br>
			  <input type="text" name="nome" class="form-control" value="<%= borda.getNome() %>" alt="<%= borda.getNome() %>" autofocus>
			  
			  Valor Adicional:
			  <input type="text" name="valorAdicional" class="form-control" value="<%= borda.getValorAdicional() %>" >
			 
 
			<div class="col-md-12">
			<br>Ingredientes
			</div>			 
			<div class="col-md-12">
			<table class="table table-hover table-striped">
				<thead>
					<th>Ingrediente</th>
					<th>Quantidade</th>
					<th class="mw-200">Ação</th>
				</thead>
				<tbody>
					<%
					//if(lista != null)
					//	for(BordaModel borda : lista) {
					%>
					<input type="hidden" name="ingred" value="5;300">
					<tr>
						<td>
							<% //out.print(borda.getNome()); %>
							Tomate
						</td>
						<td>
							<% //out.print(borda.getValorAdicional()); %>
							200 gramas
						</td>
						<td class="mw-200"><a
							href="<#=request.getContextPath()#>/editarBorda.jsp?id=<#=borda.getId() #>"
							class="btn btn-primary">Editar</a> <a
							href="<#=request.getContextPath()#>/crudBorda?id=<#=borda.getId() #>&acao=excluirBorda"
							onclick="return confirmacaoDelecao()" class="btn btn-danger">Excluir</a>
						</td>
					</tr>
					<!-- Linha 2... soh para testes -->
					<input type="hidden" name="ingred" value="8;200">
					<tr>
						<td>
							<% //out.print(borda.getNome()); %>
							Tomate
						</td>
						<td>
							<% //out.print(borda.getValorAdicional()); %>
							200 gramas
						</td>
						<td class="mw-200"><a
							href="<#=request.getContextPath()#>/editarBorda.jsp?id=<#=borda.getId() #>"
							class="btn btn-primary">Editar</a> <a
							href="<#=request.getContextPath()#>/crudBorda?id=<#=borda.getId() #>&acao=excluirBorda"
							onclick="return confirmacaoDelecao()" class="btn btn-danger">Excluir</a>
						</td>
					</tr>
					<% //} %>
				</tbody>

			</table>
		</div> 
			 
			 
			 <select>
			 <option>Ingred 1</option>
			 <option>Ingred 2</option>
			 </select>
			 <a href="<#=request.getContextPath()#>/incluirIngredienteNaBorda.jsp"
				class="btn btn-success">Incluir</a>
			 
			 <div>
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">
			</div>
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>


