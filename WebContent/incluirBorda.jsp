<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Incluir Borda</h1>
			<p>Entre com os dados</p>
			<form method="POST" action="<%=request.getContextPath() %>/borda/crud.jsp">
			  <input type="hidden" name="acao" value="incluirBorda" >
			  Tipo da Borda:<br>
			  <input type="text" name="nome" class="form-control" >
			  
			  Valor Adicional:
			  <input type="text" name="valorAdicional" class="form-control" >
			  
			  
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>