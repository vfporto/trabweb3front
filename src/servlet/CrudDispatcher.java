package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.BaseController;

@WebServlet("/dispatcher")
public class CrudDispatcher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private void verificarAcao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String parametro = request.getParameter("classe");

		try {
			Class<?> classe = Class.forName("controller."+parametro+"Controller");
			BaseController controller = (BaseController) classe.newInstance();
			
			String pagina = controller.executaAcao(request, response);
			
			request.getRequestDispatcher(pagina).forward(request, response);
			
		} catch (Exception e) {
			throw new ServletException("Excecao: Nao foi possivel instanciar Class.forName. ", e);
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
