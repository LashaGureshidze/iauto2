package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.Car;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateCar
 */
@WebServlet("/UpdateCar")
public class UpdateCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user") == null || request.getSession().getAttribute("car") == null){
			request.getRequestDispatcher("log-in.jsp").forward(request, response);
		}else{
			PersistenceService service = (PersistenceService) request.getServletContext().getAttribute("persistenceService");
			Car car = (Car)request.getSession().getAttribute("car");
			if(car != null){
				if(request.getParameter("category_id")!=null){
					car.setCategory(service.findCategory(Long.valueOf(request.getParameter("category_id"))));			
				}if(request.getParameter("carmake_id")!=null){
					car.setCarmake(service.findCarMake(Long.valueOf(request.getParameter("carmake_id"))));
				}if(request.getParameter("model_id")!= null){
					car.setCarmodel(service.findCarModel(Long.valueOf(request.getParameter("model_id"))));
				}if(request.getParameter("location_id")!=null){
					car.setLocation(service.findLocation(Long.valueOf(request.getParameter("location_id"))));
				}
				service.updateCar(car);
				request.getSession().setAttribute("car",null);
				request.getRequestDispatcher("my-page.jsp").forward(request, response);
			}
		}
	}

}
