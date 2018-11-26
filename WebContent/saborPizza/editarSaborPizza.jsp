<%@page import="model.TipoPizzaModel"%>
<%@page import="java.util.List"%>
<%@page import="controller.TipoPizzaController"%>
<%@page import="model.SaborPizzaModel"%>
<%@page import="controller.SaborPizzaController"%>
<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>

<%@ page import="controller.BordaController" %>
<%@ page import="model.BordaModel" %>

<%
String id = request.getParameter("id");
SaborPizzaController controller = new SaborPizzaController();
SaborPizzaModel sabor = controller.buscarSaborPizzaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Editar Borda</h1>
			<p>Entre com os dados</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="SaborPizza" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%= sabor.getId() %>" >
			  
			<select name="idTipoPizza" custom-select custom-select-lg mb-3">
			<% TipoPizzaController tpc = new TipoPizzaController();
				List<TipoPizzaModel> lista = tpc.listarTudo();
				
				for(TipoPizzaModel tipo : lista){%>
					<option value="<%=tipo.getId()%>" <%=(tipo.getId()==sabor.getId())?"selected":""%> ><%=tipo.getNome()%></option>
				<%}%>
				
  			</select>
			  
			  Sabor da Pizza:<br>
			  <input type="text" name="nome" class="form-control" value="<%= sabor.getNome() %>" alt="<%= sabor.getNome() %>" >
			  Descrição:<br>
			  <input type="text" name="descricao" class="form-control" value="<%= sabor.getDescricao() %>" alt="<%= sabor.getDescricao() %>" >
			  
			  
			  
			  Valor Adicional:
			  <input type="text" name="valorAdicional" class="form-control" value="<%= sabor.getValorAdicional() %>" >
			 
 
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
					<tr>
						<td>
							<% //out.print(borda.getNome()); %>
							Mussarela
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


