<%@ page import="java.util.List"%>

<%@ page import="controller.BordaController, controller.IngredienteController" %>
<%@ page import="model.BordaModel, model.BordaIngredienteModel, model.IngredienteModel" %>

<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>


<%
String id = request.getParameter("id");
BordaController bordaCont = new BordaController();
BordaModel borda = bordaCont.buscarBordaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Borda</h2>
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
						if(borda.getListaIngredientes() != null)
							for(BordaIngredienteModel ingred : borda.getListaIngredientes()) {
						%>
								<tr>
									<input type="hidden" name="ingred" value="<%=ingred.getIngrediente().getId() + ";" + ingred.getQuantidade()%>">
									<td><%=ingred.getIngrediente().getNome()%></td>
									<td><%=ingred.getQuantidade() + " " + ingred.getIngrediente().getUnidadeMedida()%></td>
									<td class="mw-200">
										<a href="#" class="btn btn-outline-warning btn-sm">Editar</a>
										<input type="button" class="btn btn-outline-danger btn-sm btnDelete" value="Excluir">	
										
									</td>
								</tr>
							<%}%>
					</tbody>
	
				</table>
			</div> 
		
		<p>Adicionar Ingredientes:</p>	 
		<div class="row">	 
			<select class="form-control custom-select custom-select-lg col-md-5 mb-3" id="addIdIngrediente">
			<% IngredienteController ic = new IngredienteController();
				List<IngredienteModel> lista = ic.listarTudo();
				
				for(IngredienteModel ing : lista){%>
					<option value="<%=ing.getId()%>"><%=ing.getNome()%></option>
				<%}%>
  			</select>

			 <input type="number" step=".01" id="addQuantidade" class="form-control col-md-5 mb-3" >
			 
			 <input type="button" id="btnIncluir"  class="btn btn-success col-md-2 mb-3" value="Incluir">
		</div>
			 <div>
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
				<input type="submit" class="btn btn-primary" value="Salvar">
			</div>
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>

<script>
function atualizaBotoes() {
	//Excluir a linha de um ingrediente (só vai persistir se/quando salvar a borda)
    $(".btnDelete").click(function(){
    	//if(confirm('Tem certeza que deseja remover o ingrediente?'))
        	//alert($(this).parents('tr').find('input[type="hidden"]').val());
    		$(this).parents('tr').remove();
    	return false;
    });
}
$(document).ready(function(){
	
	atualizaBotoes();
	
	
	$('#btnIncluir').click(function(){
		var ingredId = $('#addIdIngrediente').val();
		var ingredNome = $( '#addIdIngrediente option:selected' ).text();
		var qtd = $('#addQuantidade').val();
		
		var linha = "<tr><input type='hidden' name='ingred' value='"+ingredId + ";"+ qtd +"'>"
					+ "<td>" + ingredNome +"</td>"
					+ "<td>" + qtd + " gramas" + "</td> <td class='mw-200'>"
					+ "<a href='#' class='btn btn-outline-warning btn-sm'>Editar</a>"
					+ "<input type='button' onclick='return excluirLinha()' class='btn btn-outline-danger btn-sm btnDelete' value='Excluir'> </td></tr>";	
		$("table tbody").append(linha);
		atualizaBotoes();
	});
	
	
});
</script>

