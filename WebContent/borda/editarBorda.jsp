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
			 
				<div class="col-md-12 text-right">
					<!-- <a href="<#=request.getContextPath()%>/borda/incluirBorda.jsp" class="btn btn-success">Incluir</a> -->
					<br><button type="button" class="btn btn-success" data-toggle="modal" data-target="#incluirIngredienteModal" id="btnIncluirIngrediente">Incluir Ingrediente</button>
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
											<!-- <a href="#" class="btn btn-outline-warning btn-sm btnEdit">Editar</a> -->
											<input type='button'  class='btn btn-outline-warning btn-sm btnEdit' value='Editar'>
											<input type="button" class="btn btn-outline-danger btn-sm btnDelete" value="Excluir">	
											
										</td>
									</tr>
								<%}%>
						</tbody>
		
					</table>
				</div>
				<div class="row">
					<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">	
					<input type="submit" class="btn btn-primary" value="Salvar">
				</div>
			</form> 
		</div>
	</div>

</div>



<div class="modal fade" id="incluirIngredienteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Incluir Ingrediente</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="addIdIngrediente" class="col-form-label">Ingrediente:</label>
            <select class="form-control custom-select" id="addIdIngrediente">
			<% IngredienteController ic = new IngredienteController();
				List<IngredienteModel> lista = ic.listarTudo();
				
				for(IngredienteModel ing : lista){%>
					<option value="<%=ing.getId()%>"><%=ing.getNome()%></option>
				<%}%>
  			</select>
          </div>
          <div class="form-group">
            <label for="addQuantidade" class="col-form-label">Quantidade:</label>
            <input type="number" step=".01" id="addQuantidade" class="form-control" >
            
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnIncluir">Incluir</button>
      </div>
    </div>
  </div>
</div>






<script>
function atualizaBotoes() {
	//Excluir a linha de um ingrediente (só vai persistir se/quando salvar a borda)
    $('.btnDelete').unbind('click');
	$('.btnDelete').click(function(){
    	//if(confirm('Tem certeza que deseja remover o ingrediente?'))
        	//alert($(this).parents('tr').find('input[type="hidden"]').val());
    		$(this).parents('tr').remove();
    	return false;
    });
	
	$('.btnEdit').unbind('click');
    $('.btnEdit').click(function(){
    	//if(confirm('Tem certeza que deseja remover o ingrediente?'))
        	//alert($(this).parents('tr').find('input[type="hidden"]').val());
    		//$(this).parents('tr').remove();
    		
    		console.log($(this).parents('tr').find('input[type="hidden"]').val().split(';'));
    		var item = $(this).parents('tr').find('input[type="hidden"]').val().split(';');
    		
    		$('#addIdIngrediente').val(item[0]);
    		$('#addQuantidade').val(item[1]);
    		$('#incluirIngredienteModal').modal('show');
    	return true;
    });
	
}
$(document).ready(function(){
	atualizaBotoes();

	$('#btnIncluir').unbind('click');
	$('#btnIncluir').click(function(){
		var ingredId = $('#addIdIngrediente').val();
		var ingredNome = $( '#addIdIngrediente option:selected' ).text();
		var qtd = $('#addQuantidade').val();
		
		var linha = "<tr><input type='hidden' name='ingred' value='"+ingredId + ";"+ qtd +"'>"
					+ "<td>" + ingredNome +"</td>"
					+ "<td>" + qtd + " gramas" + "</td> <td class='mw-200'>"
					+ "<input type='button'  class='btn btn-outline-warning btn-sm btnEdit' value='Editar'>"
					+ "<input type='button'  class='btn btn-outline-danger btn-sm btnDelete' value='Excluir'> </td></tr>";	
		$("table tbody").append(linha);
		//atualizaBotoes();
		
		
		
	});
	
	$("#incluirIngredienteModal").on('hidden.bs.modal', function () {
		$('#addQuantidade').val('');
		$('#addIdIngrediente').val('');
		atualizaBotoes();
});
	
	$('#btnIncluirIngrediente').click(function(){
        $('#incluirIngredienteModal').modal('show');
    });
	
	
});
</script>

