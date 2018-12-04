<%@page import="model.TipoPizzaModel"%>
<%@page import="java.util.List"%>

<%@page import="controller.TipoPizzaController"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%//@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class=""></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">INCLUIR SABOR DE PIZZA</h2><br>
			
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			<input type="hidden" name="classe" value="SaborPizza" >
			<input type="hidden" name="acao" value="incluir" >
			  
			<select name="idTipoPizza" class="custom-select custom-select-lg mb-3">
			<% TipoPizzaController tpc = new TipoPizzaController();
				List<TipoPizzaModel> lista = tpc.listarTudo();
				
				for(TipoPizzaModel tipo : lista){%>
					<option value="<%=tipo.getId()%>"><%=tipo.getNome()%></option>
				<%}%>
				
  			</select>
			  
			  Sabor da Pizza: <br>
			  <input type="text" name="nome" class="form-control" autofocus ><br>
			  Descrição: <br>
			  <input type="text" name="descricao" class="form-control" ><br>
			  
			  Valor Adicional R$:
			  <center><input type="number" step=".01" value="0" name="valorAdicional" class="form-control" style="width: 150px;"><center><br>
			  
 				<input type="button" onclick="history.back()" class="btn btn-primary" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
 			
			</form> 
		</div>
	</div>
	<div class="col-md-10"></div>
</div>
