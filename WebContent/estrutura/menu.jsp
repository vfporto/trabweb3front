<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top navbar-expand-md">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Sistema</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
  <!-- Links -->
  <div class="collapse navbar-collapse" id="navbarCollapse">
  <ul class="navbar-nav">

	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/ingrediente/listarIngredientes.jsp">Ingredientes</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tipoPizza/listarTipoPizzas.jsp">Tipos de Pizza</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tamanho/listarTamanhos.jsp">Tamanhos</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/saborPizza/listarSaboresPizza.jsp">Sabores de Pizza</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/borda/listarBordas.jsp">Tipos de Borda</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/funcionario/listarFuncionarios.jsp">Funcionários</a>
	</li>
	



    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/login/deslogar.jsp">Sair</a>
    </li>


  </ul>
  </div>
</nav>

