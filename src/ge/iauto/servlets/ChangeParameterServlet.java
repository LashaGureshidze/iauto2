package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.User;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ChangeParameterServlet
 */
@WebServlet("/ChangeParameterServlet")
public class ChangeParameterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeParameterServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList  = new ArrayList<String>();
		errorList.add(null); errorList.add(null);
		boolean added = false;
		
		PersistenceService service = new PersistenceService();
		User user = service.getUser(request.getParameter("oldUsername"), request.getParameter("oldPassword"));
		
		if (!request.getParameter("newUsername").isEmpty()) {
			if (service.existsUserName(request.getParameter("newUsername"))) {
				added = true;
				errorList.set(0,"ასეთი მომხმარებელი უკვე არსებობს!");
			} else user.setUsername(request.getParameter("newUsername"));
		}
		
		if (!request.getParameter("newEmail").isEmpty()) {
			if (service.existsUserName(request.getParameter("newEmail"))) {
				added = true;
				errorList.set(1,"ეს ელ-ფოსტა უკვე დაკავებულია!");
			} else user.setEmail(request.getParameter("newEmail"));
		}
		
		if (!request.getParameter("password").isEmpty()) user.setPassword(request.getParameter("password"));
		
		request.setAttribute("errorList", errorList);
		if (added) request.getRequestDispatcher("profile-parameters.jsp").forward(request, response);
		else {
			request.getSession().setAttribute("user", user);
			service.updateUser(user, request.getParameter("oldUsername"));
			request.getRequestDispatcher("change-successful.jsp").forward(request, response);
		}
	}

}
