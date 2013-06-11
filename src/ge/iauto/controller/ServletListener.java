package ge.iauto.controller;

import ge.iauto.server.PersistenceProvider;
import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.CarMake;
import ge.iauto.server.model.Category;
import ge.iauto.server.model.Location;
import ge.iauto.services.CarExpirationTimeChecker;
import ge.iauto.services.CurrencyAutoUpdaterService;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ServletListener
 *
 */
@WebListener
public class ServletListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ServletListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    /*
     * when context is create it puts into it
     * two HashMap . one is id with names and 
     * second is cars with keys their id 
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	PersistenceService service = new PersistenceService();
    	List<CarMake> result = service.getCarMakes();
    	HashMap<String, Long> Ids = new HashMap<String, Long>();
    	HashMap<Long, CarMake> cars = new HashMap<Long, CarMake>();
    	for(CarMake car : result){
    		Ids.put(car.getName(), car.getId());
    		cars.put(car.getId(), car);
    	}
        arg0.getServletContext().setAttribute("idByName", Ids);
        arg0.getServletContext().setAttribute("carById", cars);
    
        //=======================load Locations==========
        List<Location> list = service.getLocations();
        arg0.getServletContext().setAttribute("locations", list);
        
        //======================load Categroies
        List<Category> lis = service.getCategories();
        arg0.getServletContext().setAttribute("categories", lis);
        //================start up timer==============
        CurrencyAutoUpdaterService.start(15 * 60); //15 წუთების რაოდენობა
        CarExpirationTimeChecker.start(24 * 60 * 60);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        PersistenceProvider.closeEM();
        CurrencyAutoUpdaterService.shutdown();
        CarExpirationTimeChecker.shutdown();
    }
	
}
