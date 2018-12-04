<%@ include file="/estrutura/header.jsp"%>
<%@ include file="/estrutura/menu.jsp"%>

<%@ include file="/login/controleAcesso.jsp"%>

<div class="row">
	<div class=""></div>
	<div class="col-md-10">
		<div class="login">

			<h2 class="efeito2">INCLUIR TAMANHO DE PIZZA</h2>
			<p>Entre com os seguintes dados:</p>

			<form method="POST"
				action="<%=request.getContextPath() %>/dispatcher">

				<input type="hidden" name="classe" value="TamanhoPizza"> 
				<input type="hidden" name="acao" value="incluir"> 
				
				Tamanho: <br> 
				<input type="text" name="nome" class="form-control" autofocus><br> 
				
				Descrição: <br> 
				<input type="text" name="descricao" class="form-control"><br> 
				
				Núm. Máximo de sabores: <br> 
				<input type="text" name="numMaximoSabores" class="form-control"><br> 
				
				Fator de Múltiplicação: (Ajuda?)<br>
				<!-- Colocar um tipo de glyph-icon com interrogação... Vou colocar um modal explicando o que é isso  -->
				 
				<input type="number" value="0" step="0.01" name="fatorMultiplicacao" class="form-control"><br> 
				
				Preço R$:
				<center>
					<input type="text" name="preco" class="form-control" style="width: 250px;">
					<center> <br> 
						<input type="button" onclick="history.back()" class="btn btn-default" value="Cancelar"> 
						<input type="submit" class="btn btn-primary" value="Salvar">
			</form>
		</div>
	</div>
	<div class="col-md-4"></div>
</div>
