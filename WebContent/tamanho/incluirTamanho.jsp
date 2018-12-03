<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%//@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class=""></div>
	<div class="col-md-10">
		<div class="login">
			 
			<h2 class="efeito2" style="">INCLUIR TIPO DE PIZZA</h2><br>
			
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			<input type="hidden" name="classe" value="TipoPizza" >
			  <input type="hidden" name="acao" value="incluir" >
			  Tipo de Pizza <br>
			  <input type="text" name="nome" class="form-control" autofocus="autofocus" ><br>
			  
			  Valor Adicional R$:
			  <center><input type="number" value="0"name="valorAdicional" class="form-control" style="width: 200px;"><center><br>
			  
 				<input type="button" onclick="history.back()" class="btn btn-primary" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
 			
			</form> 
			 
		</div>
	</div>
	<div class="col-md-10"></div>
</div>
