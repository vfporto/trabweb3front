/**
 * 
 */

function criarLinha(ingredId, ingredNome, qtd) {
	var linha = "<tr><input type='hidden' name='ingred' value='"+ingredId + ";"+ qtd +"'>"
				+ "<td>" + ingredNome +"</td>"
				+ "<td>" + qtd + " gramas" + "</td> <td class='mw-200'>"
				+ "<input type='button'  class='btn btn-outline-primary btn-sm btnEdit' value='Editar'>"
				+ "<input type='button'  class='btn btn-outline-danger btn-sm btnDelete' value='Excluir'> </td></tr>";
	
	
	return linha;
}



jQuery.fn.incluirLinha = function() {
	console.log('incluindo linha..')
	var ingredId = $('#addIdIngrediente').val();
	var ingredNome = $( '#addIdIngrediente option:selected' ).text();
	var qtd = $('#addQuantidade').val();
	var linha = criarLinha(ingredId, ingredNome, qtd);
	$("table tbody").append(linha);
	atualizaBotoes();
};

jQuery.fn.editarLinha = function(linha) {
	console.log('incio editando linha');
	console.log(this);
	console.log(linha);
	var ingredId = $('#addIdIngrediente').val();
	var ingredNome = $( '#addIdIngrediente option:selected' ).text();
	var qtd = $('#addQuantidade').val();
	var novaLinha = criarLinha(ingredId, ingredNome, qtd);
	//console.log(this.parents('tr'));
	linha.parents('tr').replaceWith(novaLinha);
	atualizaBotoes();
	console.log('fim editando linha');
};



jQuery.fn.setEditionMode = function(editionMode) {
	//Altera o Modal para modo de edicao
	if(editionMode == true){
		 this.unbind('click');
		 this.click(function(){
			 console.log(this);
			 console.log($(this));
			 $(this).editarLinha();
		 });
	//editionMode == false (Modo de Insercao)	
	} else{
		this.unbind('click');
		this.click(function(){
			$(this).incluirLinha();
		});
		
	}
};



function atualizaBotoes() {
	//Excluir a linha de um ingrediente (só vai persistir se/quando salvar a borda)
    $('.btnDelete').unbind('click');
	$('.btnDelete').click(function(){
    		$(this).parents('tr').remove();
    	return false;
    });
	
	//Substitui uma linha por outra criada
	$('.btnEdit').unbind('click');
    $('.btnEdit').click(function(){
    		var item = $(this).parents('tr').find('input[type="hidden"]').val().split(';');
    		var $botao = $(this);
    		
    		$('#addIdIngrediente').val(item[0]);
    		$('#addQuantidade').val(item[1]);
    		
	    		 $('#btnModalOk').unbind('click');
	    			$('#btnModalOk').click(function(){
	    		    		$(this).editarLinha($botao);
	    		    	$('#incluirIngredienteModal').modal('show: false');
	    		    	return false;
	    		    });
    		
    		$('#incluirIngredienteModal').modal('show');
    	return false;
    });
	
}
$(document).ready(function(){
	
	atualizaBotoes();
/*
	$('#btnModalOk').unbind('click');
	$('#btnModalOk').click(function(){
		$(this).incluirLinha();
		
	});
*/	
	$("#incluirIngredienteModal").on('hidden.bs.modal', function () {
		$('#addQuantidade').val('');
		$('#addIdIngrediente').val('0');
		atualizaBotoes();
});
	
	$('#btnIncluirIngrediente').click(function(){
		$('#btnModalOk').setEditionMode(false);
        $('#incluirIngredienteModal').modal('show');
    });
	
	
});