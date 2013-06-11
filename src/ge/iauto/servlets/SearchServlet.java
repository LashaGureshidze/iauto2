package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.Car;
import ge.iauto.server.model.SearchData;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public SearchServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SearchData data = new SearchData();
		if(!request.getParameter("carmake_id").isEmpty()) {
			data.put("carmake_id", request.getParameter("carmake_id"));
		}
		if(!request.getParameter("year_from").isEmpty()) {
			data.put("year_from", request.getParameter("year_from"));
		}
		if(!request.getParameter("year_to").isEmpty()) {
			data.put("year_to", request.getParameter("year_to"));
		}
		if(!request.getParameter("gearbox").isEmpty()) {
			data.put("gearbox", request.getParameter("gearbox"));
		}
		if(!request.getParameter("ganbajebuli").isEmpty()) {
			data.put("ganbajebuli", request.getParameter("ganbajebuli"));
		}
		if(!request.getParameter("carmodel_id").isEmpty()) {
			data.put("carmodel_id", request.getParameter("carmodel_id"));
		}
		if(!request.getParameter("price_from").isEmpty()) {
			try {
				Integer.parseInt(request.getParameter("price_from"));
				data.put("price_from", request.getParameter("price_from"));
			}catch (Exception e){
			}
		}
		if(!request.getParameter("price_to").isEmpty()) {
			try {
				Integer.parseInt(request.getParameter("price_to"));
				data.put("price_to", request.getParameter("price_to"));
			}catch (Exception e){
			}
		}
		if(!request.getParameter("rightsteeringwheel").isEmpty()) {
			data.put("rightsteeringwheel", request.getParameter("rightsteeringwheel"));
		}
		if(!request.getParameter("fuel").isEmpty()) {
			data.put("fuel", request.getParameter("fuel"));
		}
		if(!request.getParameter("category_id").isEmpty()) {
			data.put("category_id", request.getParameter("category_id"));
		}
		if(!request.getParameter("location_id").isEmpty()) {
			data.put("location_id", request.getParameter("location_id"));
		}
		
		PersistenceService service = new PersistenceService();
		List<Car> result = service.loadCars(data, 0, 100);	//აქ გადაეცემა შესაბამისად რომელი ინდეხიდან გინდა, და რამდენი გინდა
		for (Car car : result) {
			//TODO
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
