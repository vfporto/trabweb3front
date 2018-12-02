<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<nav id="menu-principal" class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top navbar-expand-md">
  <!-- Brand -->
  <a class="navbar-brand" href="<%=request.getContextPath() %>/index.jsp">Home</a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarCollapse" aria-controls="navbarCollapse"
		aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
  <!-- Links -->
  <div class="collapse navbar-collapse" id="navbarCollapse">
  <ul class="navbar-nav">

	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/ingrediente/listarIngredientes.jsp"><button>Ingredientes</button></a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tipoPizza/listarTipoPizzas.jsp"><button>Tipos de Pizza</button></a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/tamanho/listarTamanhos.jsp"><button>Tamanhos</button></a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/saborPizza/listarSaboresPizza.jsp"><button>Sabores de Pizza</button></a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/borda/listarBordas.jsp"><button>Tipos de Borda</button></a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="<%=request.getContextPath() %>/funcionario/listarFuncionarios.jsp"><button>Funcionários</button></a>
	</li>
	



    <li class="nav-item">
      <a class="nav-link" href="<%=request.getContextPath() %>/login/deslogar.jsp"><button>Sair</button></a>
    </li>


  </ul>
  </div>
</nav>

 

