package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyCarsServlet
 */
@WebServlet("/MyCarsServlet")
public class MyCarsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyCarsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = PageNumber(request);		
		PersistenceService service = (PersistenceService)request.getServletContext().getAttribute("persistenceService");
		long id = Long.parseLong(request.getParameter("id"));
		request.setAttribute("myCars", service.LoadCarsByUser(id));
		request.getRequestDispatcher("my-cars.jsp?page="+page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String PageNumber(HttpServletRequest request) {
		String number = request.getParameter("page");
		if(number == null)return "1";
		else{
			int a = Integer.parseInt(number)+1;
			number = ""+a;
			return number;
		}
	}
}
