package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.services.MessageSendService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Verification
 */
@WebServlet("/Verification")
public class Verification extends HttpServlet {
	private static final long serialVersionUID = 1L;
   	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(final HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<String> errorList  = new ArrayList<String>();
		for (int i = 0; i < 3; i++) errorList.add(null);
		boolean added = false;
		
		PersistenceService service = new PersistenceService();
		if(request.getParameter("username").isEmpty()){
			added = true;
			errorList.set(0,"შეიყვანეთ მომხმარებლის სახელი!");
		}else if(service.existsUserName(request.getParameter("username"))){
			added = true;
			errorList.set(0,"ასეთი მომხმარებელი უკვე არსებობს!");
		}
		if(request.getParameter("password").isEmpty()){
			added = true;
			errorList.set(1,"შეიყვანეთ პაროლი!");
		}else if(request.getParameter("rpassword").isEmpty()){
			added = true;
			errorList.set(1,"გაიმეორეთ პაროლი!");
		}
		if(request.getParameter("email").isEmpty()){
			added = true;
			errorList.set(2,"შეიყვანეთ სწორი ელ-ფოსტა!");
		}else if(service.existsEmail(request.getParameter("email"))){
			added = true;
			errorList.set(2,"ასეთი ელ-ფოსტა უკვე არსებობს!");
		}
		request.setAttribute("errorList", errorList);
		if(added){
			request.getRequestDispatcher("user-register.jsp").forward(request, response);
		}else{
			HttpSession session = request.getSession();
			session.setAttribute("username", request.getParameter("username"));
			session.setAttribute("password", request.getParameter("password"));
			session.setAttribute("name", request.getParameter("name"));
			session.setAttribute("lastname", request.getParameter("lastname"));
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("birthday", request.getParameter("birthday"));
			session.setAttribute("sex", request.getParameter("sex"));
			
			int min = 1000; int max = 10000;
			final String code = "" + (int)(min + (Math.random() * (max - min)));
			Thread sendMessage = new Thread(new Runnable() {
				@Override
				public void run() {
					MessageSendService.sendMessage(request.getParameter("email"), code);
				}
			});
			sendMessage.setPriority(Thread.MIN_PRIORITY);
			sendMessage.start();
			
			request.getSession().setAttribute("code", code);
			request.getRequestDispatcher("verification.jsp").forward(request, response);
		}
	}

}
