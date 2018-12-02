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
		String parametro = request.getParameter("classe");
		//System.out.println("\n-------- [dispatcher] parametro: "+parametro+" --------");
		//System.out.println("-------- [dispatcher] acao.....: "+request.getParameter("acao")+" --------\n");
		try {
			Class<?> classe = Class.forName("controller."+parametro+"Controller");
			ControllerBase controller = (ControllerBase) classe.newInstance();
			
			String pagina = controller.executaAcao(request, response);
			
			//request.getRequestDispatcher(pagina).forward(request, response);
			response.sendRedirect(request.getContextPath() + pagina);
			
		} catch (Exception e) {
			throw new ServletException("Excecao: Nao foi possivel instanciar Class.forName('"+parametro+"Controller') ", e);
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
