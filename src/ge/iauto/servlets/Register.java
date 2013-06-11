package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.User;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(!request.getParameter("code").equals(request.getSession().getAttribute("code"))){
			request.getRequestDispatcher("illegal-verification.jsp").forward(request, response);
		}else{
			User newUser = new User();
			newUser.setUsername((String) request.getSession().getAttribute("username"));
			newUser.setPassword((String) request.getSession().getAttribute("password"));
			newUser.setName((String) request.getSession().getAttribute("name"));
			newUser.setLastName((String) request.getSession().getAttribute("lastname"));
			newUser.setEmail((String) request.getSession().getAttribute("email"));
			newUser.setMale((request.getSession().getAttribute("sex")).equals("male"));
			newUser.setBirthday((String) request.getSession().getAttribute("birthday"));
			
			PersistenceService service = new PersistenceService();
			service.saveUser(newUser);
			
			request.getRequestDispatcher("register-successful.jsp").forward(request, response);
		}
	}

}
