<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav id="menu-principal" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top navbar-expand-sm">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">S.G.P</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
  <!-- Links -->
  <div class="collapse navbar-collapse" id="navbarCollapse">
<ul class="nav justify-content-center">

	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/ingrediente/listarIngredientes.jsp">INGREDIENTES</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tipoPizza/listarTipoPizzas.jsp">TIPOS DE PIZZA</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tamanho/listarTamanhos.jsp">TAMANHOS</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/saborPizza/listarSaboresPizza.jsp">SABORES</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/borda/listarBordas.jsp">BORDAS</a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/funcionario/listarFuncionarios.jsp">FUNCIONÁRIOS</a>
	</li>
	



    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/login/deslogar.jsp"><button type="button" class="btn btn-danger">SAIR</button></a>
    </li>


  </ul>
  </div>
</nav>

 

