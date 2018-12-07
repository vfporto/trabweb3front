<%@page import="model.SaborPizzaIngredienteModel"%>
<%@page import="model.IngredienteModel"%>
<%@page import="controller.IngredienteController"%>
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
	<div class="col-md-10">
		<div class="login">
			<h1 class="efeito2">EDITAR SABOR DE PIZZA</h1>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="SaborPizza" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%= sabor.getId() %>" >
			  
			<select name="idTipoPizza" class="custom-select custom-select-lg mb-3">
			<% TipoPizzaController tpc = new TipoPizzaController();
				List<TipoPizzaModel> listaTipos = tpc.listarTudo();
				
				for(TipoPizzaModel tipo : listaTipos){%>
					<option value="<%=tipo.getId()%>" <%=(tipo.getId()==sabor.getId())?"selected":""%> ><%=tipo.getNome()%></option>
				<%}%>
				
  			</select>
			  
			  Sabor da Pizza:<br>
			  <input type="text" name="nome" class="form-control" value="<%= sabor.getNome() %>" alt="<%= sabor.getNome() %>" autofocus >
			  Descrição:<br>
			  <input type="text" name="descricao" class="form-control" value="<%= sabor.getDescricao() %>" alt="<%= sabor.getDescricao() %>" >
			  
			  
			  
			  Valor Adicional:
			  <input type="number" step="0.1" name="valorAdicional" class="form-control" value="<%= sabor.getValorAdicional() %>" >
			 
 
				<!--  -------------------------------------------- INGREDIENTES------------------------------------------- -->
				<div class="col-md-12 text-right">
					<br>Ingredientes <button type="button" class="btn btn-success" data-toggle="modal" data-target="#incluirIngredienteModal" id="btnIncluirIngrediente">Incluir Ingrediente</button>
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
							if(sabor.getListaIngredientes() != null && sabor.getListaIngredientes().size() != 0)
								for(SaborPizzaIngredienteModel ingred : sabor.getListaIngredientes()) {
							%>
									<tr>
										<input type="hidden" name="ingred" value="<%=ingred.getIngrediente().getId() + ";" + ingred.getQuantidade()%>">
										<td><%=ingred.getIngrediente().getNome()%></td>
										<td><%=ingred.getQuantidade() + " " + ingred.getIngrediente().getUnidadeMedida()%></td>
										<td class="mw-200">
											<input type='button'  class='btn btn-outline-primary btn-sm btnEdit' value='Editar'>
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


<!--  -------------------------------------------- MODAL --------------------------------------------------------------------------- -->
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
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnModalCancelar">Cancelar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="btnModalOk">OK</button>
      </div>
    </div>
  </div>
</div>





<script type="text/javascript" src="<%=request.getContextPath()%>/js/scriptsIngredientes.js"></script>

