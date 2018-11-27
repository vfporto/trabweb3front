<%@ include file="/estrutura/header.jsp"%>

<div class="row">

	<div class=""></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito">Login</h2>
			<p style="color: #000;">Ola! Seja bem vindo. </p>
			<form id="Login" method="post"
				action="<%=request.getContextPath()%>/login/controleLogin.jsp">
				
				<div class="form-group">
					<input type="text" class="form-control-sm" id="login" required
						name="login" placeholder="Login">
				</div>

				<div class="form-group">
					<input type="password" class="form-control-sn" id="senha" required
						name="senha" placeholder="Senha">
				</div>
				
				<button type="submit" class="btn btn-primary">Entrar</button>
			</form>
		</div>
	</div>

	<div class="col-md-4"></div>
</div>



<%@ include file="/estrutura/footer.jsp"%>