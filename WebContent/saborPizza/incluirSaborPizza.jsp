<%@page import="model.TipoPizzaModel"%>
<%@page import="java.util.List"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="controller.TipoPizzaController"%>
<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%//@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class=""></div>
	<div class="col-md-4">
		<div class="login">
			<h2 class="efeito" style="font-size:4em !important;">INCLUIR SABOR DE PIZZA</h2><br>
			
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
			  <input type="text" name="nome" class="form-control" ><br>
			  Descrição: <br>
			  <input type="text" name="descricao" class="form-control" ><br>
			  
			  Valor Adicional R$:
			  <center><input type="text" name="valorAdicional" class="form-control" style="width: 250px;"><center><br>
			  
 				<input type="button" onclick="history.back()" class="btn btn-primary" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
 			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
