package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.User;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {	
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		PersistenceService service = new PersistenceService();
		User user = service.getUser(username, password);
		if (user == null) {
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("log-in.jsp?message=error");
			dispatcher.forward(request, response);
		} else {
			request.getSession().setAttribute("user", user);
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("home-page.jsp");
			dispatcher.forward(request, response);
		}
	}

}
