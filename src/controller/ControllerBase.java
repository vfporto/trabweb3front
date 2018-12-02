package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Interface ControllerBase
 *  
 * Interface criada para manter um unico servlet para processar as acoes CRUD,
 * mas distribuir a logica desse processamento para as Controllers
 * 
 */
public interface ControllerBase {
	/**
	 * Metodo executaAcao
	 * 
	 * Em principio eh o mesmo executaAcao criado na classe CrudServlet mostrada em sala,
	 * apenas com alteracao do retorno.
	 * 
	 * @param request 
	 * @param response
	 * @return Pagina que deve ser acessada apos a execucao da acao.
	 * 
	 * @throws Exception //TODO: tratar essa exception na classe CrudDispatcher
	 */
	public String executaAcao(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
