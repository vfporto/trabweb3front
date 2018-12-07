package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.ControllerBase;

@WebServlet("/dispatcher")
@MultipartConfig
public class CrudDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void verificarAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String parametroClasse = request.getParameter("classe");
		
		try {
			
			//Instanciando dinamicamente a controller responsavel, baseada no parametro "classe", passado pelo formulario
			Class<?> classe = Class.forName("controller."+parametroClasse+"Controller");
			ControllerBase controller = (ControllerBase) classe.newInstance();
			
			//Transfere para a controller a verificacao e execucao da Acao, definida no parametro "acao", passado pelo form.
			String pagina = controller.executaAcao(request, response);
			
			//Apos execucao da acao pela controller, redireciona para a pagina correta, definida pela Controller responsavel.
			response.sendRedirect(request.getContextPath() + pagina);
			
		} catch (Exception e) {
			//TODO: Tratar a Exception e nao explodir uma...
			throw new ServletException("Excecao: Nao foi possivel instanciar Class.forName('"+parametroClasse+"Controller') ", e);
		}

	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			verificarAcao(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			verificarAcao(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
