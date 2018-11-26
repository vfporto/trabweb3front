package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface BaseController {
	//Teste de interface para tentar fazer um servlet mais generico
	//A ideia é que todas as controllers implementem essa interface,
	//O request deve receber o nome da classe e o nome da acao a ser executada, alem dos dados do formulario.
	//O metodo executaAcao deve devolver o valor da pagina JSP que deve ser acessada apos a execucao.
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
