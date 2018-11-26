<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Incluir Ingrediente</h1>
			<p>Entre com os dados</p>
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
				<input type="hidden" name="classe" value="Ingrediente">
				<input type="hidden" name="acao" value="incluir" >
			  
			  Incluir o Ingrediente :<br>
			  <input type="text" name="nome" class="form-control" >
			  
			  Quantidade Máxima : <br>
			  <input type="text" name="qtMaxima" class="form-control" >
			  
			  Quantidade Mínima : <br>
			  <input type="text" name="qtMinima" class="form-control" >
			  
			  Quantidade em Estoque: <br>
			  <input type="text" name="qtEstoque" class="form-control" >
			 
			  Unidade Medida : <br>
			  <input type="text" name="unidadeMedida" class="form-control" >
			  
			  
			  
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
