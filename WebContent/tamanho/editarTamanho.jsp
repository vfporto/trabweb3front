<%@page import="model.TamanhoPizzaModel"%>
<%@page import="controller.TamanhoPizzaController"%>

<%@ include file="/estrutura/header.jsp" %>
<%@ include file="/estrutura/menu.jsp" %>
<%@ include file="/login/controleAcesso.jsp" %>

<%
String id = request.getParameter("id");
TamanhoPizzaController ctl = new TamanhoPizzaController();
TamanhoPizzaModel tamanho = ctl.buscarTamanhoPizzaPorId(Long.parseLong(id));
%>



<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-10">
		<div class="login">
			<h2 class="efeito2">Editar Tamanho de Pizza</h2>
			<p>Entre com os seguintes dados</p>
						
			<form method="POST" action="<%=request.getContextPath() %>/dispatcher">
			  <input type="hidden" name="classe" value="TamanhoPizza" >
			  <input type="hidden" name="acao" value="editar" >
			  <input type="hidden" name="id" value="<%= tamanho.getId() %>" >
	
<!-- ************************************************************************** --> 

				Tamanho: <br> 
				<input type="text" name="nome" class="form-control" value="<%=tamanho.getNome()%>" autofocus><br> 
				
				Descrição: <br> 
				<input type="text" name="descricao" class="form-control"  value="<%=tamanho.getDescricao()%>"><br> 
				
				Núm. Máximo de sabores: <br> 
				<input type="text" name="numMaximoSabores" class="form-control"  value="<%=tamanho.getNumMaximoSabores()%>" ><br> 
				
				Fator de Múltiplicação: (Ajuda?)<br>
				<!-- Colocar um tipo de glyph-icon com interrogação... Vou colocar um modal explicando o que é isso  -->
				 
				<input type="text" name="fatorMultiplicacao" class="form-control" value="<%=tamanho.getFatorMultiplicacao()%>" ><br> 
				

				Preço R$:
				<center>
					<input type="text" name="preco" class="form-control" style="width: 250px;">
<!-- ************************************************************************** --> 
			 <div>
			 <br>
				<input type="button" onclick="history.back()" class="btn btn-default btn-lg" value="Cancelar">	
				<input type="submit" class="btn btn-primary btn-lg" value="Salvar">
			</div>
			
			</form> 

		</div>
	</div>
	<div class="col-md-4"></div>
</div>


