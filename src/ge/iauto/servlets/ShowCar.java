package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowCar
 */
@WebServlet("/ShowCar")
public class ShowCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PersistenceService service = (PersistenceService) request.getServletContext().getAttribute("persistenceService");
		service.increaseViewCount(Long.parseLong(request.getParameter("id")));
		request.setAttribute("carsToShow", service.findCar(Long.parseLong(request.getParameter("id"))));
		request.getRequestDispatcher("show-car.jsp").forward(request, response);
	}
}
