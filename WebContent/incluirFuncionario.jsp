<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Novo Funcionario</h1>
			<p>Entre com os dados</p>
			<form method="POST" enctype="multipart/form-data" action="<%=request.getContextPath() %>/crud" >
			  <input type="hidden" name="acao" value="incluirFuncionario" >
			  Nome:<br>
			  <input type="text" name="nome" class="form-control" >
			  
			  CPF:<br>
			  <input type="text" name="cpf" class="form-control">
			  
			  Login:<br>
			  <input type="text" name="login" class="form-control">
			  
			  Senha:<br>
			  <input type="password" name="senha" class="form-control">
			  
			  Foto:<br>
			  <input type="file" name="foto" class="form-control">			  
			  <br><br>
				<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar">
				<input type="submit" class="btn btn-primary" value="Salvar">
			
			</form> 
		</div>
	</div>
	<div class="col-md-4"></div>
</div>



<%@ include file="/estrutura/footer.jsp"%>




