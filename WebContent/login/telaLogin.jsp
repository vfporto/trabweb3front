<%@ include file="/estrutura/header.jsp"%>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<div class="login">
			<h1>Login</h1>
			<p>Entre com seu Usuário e Senha</p>
			<form id="Login" method="post"
				action="<%=request.getContextPath()%>/login/controleLogin.jsp">
				
				<div class="form-group">
					<input type="text" class="form-control" id="login" required
						name="login" placeholder="Login">
				</div>

				<div class="form-group">
					<input type="password" class="form-control" id="senha" required
						name="senha" placeholder="Senha">
				</div>
				
				<button type="submit" class="btn btn-primary">Entrar</button>
			</form>
		</div>
	</div>
	<div class="col-md-4"></div>
</div>



<%@ include file="/estrutura/footer.jsp"%>