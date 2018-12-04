<%@page import="controller.TipoPizzaController"%>
<%@page import="model.TipoPizzaModel"%>
<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>


<%
String id = request.getParameter("id");
TipoPizzaController ctl = new TipoPizzaController();
TipoPizzaModel tipo = ctl.buscarTipoPizzaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Tipo de Pizza</h2>
			<p>Entre com os seguintes dados</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="TipoPizza" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%= tipo.getId() %>" >
			  Tipo de Pizza:<br>
			  <input type="text" name="nome" class="form-control" value="<%= tipo.getNome() %>" alt="<%= tipo.getNome() %>" autofocus >
			  
			  Valor Adicional:
			    <center><input type="number" value="0" step=".01" name="valorAdicional" class="form-control" style="width: 150px;"><center><br>
			 
			 <div>
			 	<br>
				<input type="button" onclick="history.back()" class="btn btn-default btn-lg" value="Cancelar">	
				<input type="submit" class="btn btn-primary btn-lg" value="Salvar">
			</div>
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>


