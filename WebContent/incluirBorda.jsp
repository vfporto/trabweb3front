<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%//@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class=""></div>
	<div class="col-md-4">
		<div class="login">
			<h2 class="efeito" style="font-size:4em !important;">INCLUIR BORDA</h2><br>
			
			<form method="POST" action="<%=request.getContextPath() %>/borda/crud.jsp">
			  <input type="hidden" name="acao" value="incluirBorda" >
			  EAE!? QUAL SABOR VAI NA BORDA!<br>
			  <input type="text" name="nome" class="form-control" ><br>
			  
			  Valor Adicional R$:
			  <center><input type="text" name="valorAdicional" class="form-control" style="width: 250px;"><center><br>
			  
 				<input type="button" onclick="history.back()" class="btn btn-primary" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
 			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
