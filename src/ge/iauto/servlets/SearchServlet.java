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
		if(request.getParameter("carmake_id") != null && !request.getParameter("carmake_id").isEmpty()) {
			data.put("carmake_id", request.getParameter("carmake_id"));
		}
		if(request.getParameter("year_from") != null && !request.getParameter("year_from").isEmpty()) {
			data.put("year_from", request.getParameter("year_from"));
		}
		if(request.getParameter("year_to") != null && !request.getParameter("year_to").isEmpty()) {
			data.put("year_to", request.getParameter("year_to"));
		}
		if(request.getParameter("gearbox") != null && !request.getParameter("gearbox").isEmpty()) {
			String s = request.getParameter("gearbox");
			if (s.equals("1")) {
				data.put("gearbox","მექანიკური");
			}else if (s.equals("2")) {
				data.put("gearbox","ავტომატიკა");
			}else if (s.equals("3")) {
				data.put("gearbox","ტიპტრონიკი");
			}
		}
		if(request.getParameter("ganbajebuli") != null && !request.getParameter("ganbajebuli").isEmpty()) {
			data.put("ganbajebuli", request.getParameter("ganbajebuli"));
		}
		if(request.getParameter("carmodel_id") != null && !request.getParameter("carmodel_id").isEmpty()) {
			data.put("carmodel_id", request.getParameter("carmodel_id"));
		}
		if(request.getParameter("price_from") != null && !request.getParameter("price_from").isEmpty()) {
			try {
				Integer.parseInt(request.getParameter("price_from"));
				data.put("price_from", request.getParameter("price_from"));
			}catch (Exception e){
			}
		}
		if(request.getParameter("price_to") != null && !request.getParameter("price_to").isEmpty()) {
			try {
				Integer.parseInt(request.getParameter("price_to"));
				data.put("price_to", request.getParameter("price_to"));
			}catch (Exception e){
			}
		}
		if(request.getParameter("rightsteeringwheel") != null && !request.getParameter("rightsteeringwheel").isEmpty()) {
			data.put("rightsteeringwheel", request.getParameter("rightsteeringwheel"));
		}
		if(request.getParameter("fuel") != null && !request.getParameter("fuel").isEmpty()) {
			String s = request.getParameter("fuel");
			if (s.equals("1")) {
				data.put("fuel", "ელექტრო");
			}else if (s.equals("2")) {
				data.put("fuel", "ბენზინი");
			}else if (s.equals("3")) {
				data.put("fuel", "დიზელი");
			}
		}
		if(request.getParameter("category_id") != null && !request.getParameter("category_id").isEmpty()) {
			data.put("category_id", request.getParameter("category_id"));
		}
		if(request.getParameter("location_id") != null && !request.getParameter("location_id").isEmpty()) {
			data.put("location_id", request.getParameter("location_id"));
		}
		if(request.getParameter("last_days") != null && !request.getParameter("last_days").isEmpty()) {
			data.put("last_days", request.getParameter("last_days"));
		}
		String page = PageNumber(request);
		PersistenceService service = (PersistenceService) request.getServletContext().getAttribute("persistenceService");
		List<Car> result = service.loadCars(data, (Integer.parseInt(page)-1)*10, 11);	//აქ გადაეცემა შესაბამისად რომელი ინდეხიდან გინდა, და რამდენი გინდა
		request.setAttribute("list", result);
		request.getRequestDispatcher("show-search.jsp?page="+page).forward(request, response);
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}