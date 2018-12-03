<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Incluir Ingrediente</h2>
			<p>Entre com os dados</p>
			<form style="font-weight: 700; text-align:left;" method="POST" action="<%=request.getContextPath() %>/dispatcher">
				<input type="hidden" name="classe" value="Ingrediente">
				<input type="hidden" name="acao" value="incluir" >
			  
			  Incluir o Ingrediente :<br>
			  <input type="text" name="nome" class="form-control" autofocus ><br>
			  
			  Quantidade Máxima : <br>
			  <input type="number" name="qtMaxima" class="form-control-sm" value="0" ><br>
			  
			  Quantidade Mínima : <br>
			  <input type="number" name="qtMinima" class="form-control-sm" value="0" ><br>
			  
			  Quantidade Estoque: <br>
			  <input type="number" name="qtEstoque" class="form-control-sm" value="0"><br>
			 
			  Unidade Medida : <br>
			  <input type="number" name="unidadeMedida" class="form-control-sm" value="0" ><br>
			  
			  
			  <br>
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
