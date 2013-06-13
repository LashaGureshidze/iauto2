package ge.iauto.server;

import ge.iauto.server.model.Car;
import ge.iauto.server.model.CarMake;
import ge.iauto.server.model.CarModel;
import ge.iauto.server.model.Category;
import ge.iauto.server.model.Location;
import ge.iauto.server.model.SearchData;
import ge.iauto.server.model.User;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.Query;

public class PersistenceService {
	/**
	 * შეინახავს ახალ მომხმარებელს
	 * @param user
	 */
	public void saveUser(User user){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(user);
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * შეინახავს ახალ მანქანის მწარმოებელს
	 * @param carMake
	 */
	public void saveCarMake(CarMake carMake){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(carMake);
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * შეინახავს ახალ მანქანის მოდელს
	 * @param carModel
	 */
	public void saveCarModel(CarModel carModel){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(carModel);
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * შეინახავს ახალ "ადგილმდებარეობს" (თბილისი, ბათუმი და ა.შ.)
	 * @param location
	 */
	
	public void saveLocation(Location location){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(location);
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * შენახავს ახალ კატეგორიას
	 * @param category
	 */
	
	public void saveCategory(Category category){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(category);
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * შეინახავს ახალ მანქანას
	 * @param car
	 */
	public void saveCar(Car car){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();		
		entitymanager.persist(car);
		entitymanager.getTransaction().commit();
		entitymanager.close();
		System.out.println("new Car id = " + car.getId() + " saved! !");
	}
	
	/**
	 * დააბრუნებს true თუ მომხმარებელი გადმოცემული უზერნეიმით არსებობს, წინააღმდეგ შემთხხვევვაში დააბრუნებს false
	 * @param username
	 * @return 
	 */
	public boolean existsUserName(String username){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("SELECT COUNT(*) FROM User WHERE username = :name");
		q.setParameter("name", username);
		if(Long.valueOf(q.getSingleResult().toString()) ==0){
			return false;
		}
		return true;
	}
	
	/**
	 * დდააბრუნებს true თუ იმელი უკვე დარეგისტრირებულის, წინააღმდეგ შემთხვევაში false 
	 * @param email
	 * @return
	 */
	public boolean existsEmail(String email) {
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("SELECT COUNT(*) FROM User WHERE email = :email");
		q.setParameter("email", email);
		if (Long.valueOf(q.getSingleResult().toString()) == 0) {
			return false;
		}
		return true;
	}
	
	/**
	 * დააბრუნებს user შესაბამისი username-ითა და password-ით.
	 * თუ ასეთი მომხმარებლი არ არზსებობს დააბრუნებს null
	 * @param username
	 * @param password
	 * @return
	 */
	public User getUser(String username,String password){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("FROM User WHERE username = :name and password = :pass");
		q.setParameter("name", username);
		q.setParameter("pass", password);
		User user = null;
		try{
			user = (User)q.getSingleResult();
		}catch(NoResultException e){
			
		}
		return user;
	}
	
/**
 * დააბრუნებს ყველა მანქანის მწარმოებლებს
 * @return
 */
	@SuppressWarnings("unchecked")
	public List<CarMake> getCarMakes(){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("FROM CarMake");
		List<CarMake> result = q.getResultList();
		return result;
	}
	/**
	 * დააბრუნებს ყველა ადგილმდებარეობას
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Location> getLocations(){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("FROM Location");
		List<Location> result = q.getResultList();
		return result;
	}
	/**
	 * დააბრუნებს ყველა მანქანის კატეგორიას
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Category> getCategories(){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query q = entitymanager.createQuery("FROM Category");
		List<Category> result = q.getResultList();
		return result;
	}
	
	/**
	 * დააბრუნებს კატეგორიას შესაბამისი id-ით
	 * @param id
	 * @return
	 */
	public Category findCategory(long id){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Category cat = entitymanager.find(Category.class, id);
		return cat;
	}
	
	/**
	 * დააბრუნებს მანქანის მწარმოებელს შესაბამისი id-ით
	 * @param id
	 * @return
	 */
	public CarMake findCarMake(long id){
		EntityManager entitymanager = PersistenceProvider.createEM();
		CarMake car = entitymanager.find(CarMake.class, id);
		return car;
	}
	
	/**
	 * დააბრუნებს მანქანის მოდელს შესაბამისი id-იით
	 * @param id
	 * @return
	 */
	public CarModel findCarModel(long id){
		EntityManager entitymanager = PersistenceProvider.createEM();
		CarModel car = entitymanager.find(CarModel.class, id);
		return car;
	}
	
	/**
	 * დააბრუნებს ადგილმდებარეობას შესაბამისი id-ით
	 * @param id
	 * @return
	 */
	public Location findLocation(long id){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Location loc = entitymanager.find(Location.class, id);
		return loc;
	}

	/**
	 * განაახლებს მომხმარებელს გადმოცემული ობიექტის საფიძველზე
	 * @param user
	 * @param oldUsername
	 */
	public void updateUser(User user, String oldUsername) {
		EntityManager entitymanager = PersistenceProvider.createEM();
        Query q = entitymanager.createQuery("SELECT COUNT(*) FROM User WHERE username= :name");
        q.setParameter("name", oldUsername);
        if (Long.valueOf(q.getSingleResult().toString()) <= 1) {
        	entitymanager.getTransaction().begin();
        	entitymanager.merge(user);
        	entitymanager.getTransaction().commit();
        	entitymanager.close();
        }
	}
/**
 * უზრუნველყოფს ბაზიდან მანქანების სიის წამოღებას	
 * @param data - SearchData ტიპის ობიექტი, რომელშიც გაწერილის ის პარამეტრები, რის მიხედვითაც ხდება მანქანაბეი მოძებნა
 * @param firsResult - ინდექსი, რომლიდანაც დაიწყება მანქანების მოძიება
 * @param maxResult - მანქანების მაქსიმალური რაოდენობა, რაც ერთ ჯერზე შეიძლება დაბრუნდეს
 * @return  - მოზებნილი მანქანების კოლექცია
 */
	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Car> loadCars(SearchData data,int firsResult, int maxResult) {
		Map<String,Object> parameters = new HashMap<String, Object>();
		StringBuilder ql = new StringBuilder();
		ql.append("From Car c WHERE 1=1 ");
		
		String s = null;
		s = data.get("carmake_id");
		if (s != null) {
			ql.append("AND c.carmake.id =:carmake_id ");
			parameters.put("carmake_id", Long.parseLong(data.get("carmake_id")));
		}
		s = data.get("year_from");
		if (s != null) {
			ql.append("AND c.year >=:year_from ");
			parameters.put("year_from", Integer.parseInt(data.get("year_from")));
		}
		s = data.get("year_to");
		if (s != null) {
			ql.append("AND c.year <=:year_to ");
			parameters.put("year_to", Integer.parseInt(data.get("year_to")));
		}
		s = data.get("gearbox");
		if (s != null) {
			ql.append("AND c.gearbox =:gearbox ");
			parameters.put("gearbox", data.get("gearbox"));
		}
		s = data.get("carmodel_id");
		if (s != null) {
			ql.append("AND c.carmodel.id =:carmodel_id ");
			parameters.put("carmodel_id", Long.parseLong(data.get("carmodel_id")));
		}
		s = data.get("ganbajebuli");
		if (s != null) {
			ql.append("AND c.ganbajebuli =:ganbajebuli ");
			parameters.put("ganbajebuli", data.get("ganbajebuli").equals("0") ? false : true);
		}
		s = data.get("price_from");
		if (s != null) {
			ql.append("AND c.price >=:price_from ");
			parameters.put("price_from", Integer.parseInt(data.get("price_from")));
		}
		s = data.get("price_to");
		if (s != null) {
			ql.append("AND c.price <=:price_to ");
			parameters.put("price_to", Integer.parseInt(data.get("price_to")));
		}
		s = data.get("rightsteeringwheel");
		if (s != null) {
			ql.append("AND c.rightsteeringwheel =:rightsteeringwheel ");
			parameters.put("rightsteeringwheel", data.get("rightsteeringwheel").equals("0") ? false : true);
		}
		s = data.get("fuel");
		if (s != null) {
			ql.append("AND c.fuel =:fuel ");
			parameters.put("fuel", data.get("fuel"));
		}
		s = data.get("category_id");
		if (s != null) {
			ql.append("AND c.category.id =:category_id ");
			parameters.put("category_id", Long.parseLong(data.get("category_id")));
		}
		s = data.get("location_id");
		if (s != null) {
			ql.append("AND c.location.id =:location_id ");
			parameters.put("location_id", Long.parseLong(data.get("location_id")));
		}
		s = data.get("last_days");
		if (s != null) {
			Date date = new Date();
			Calendar cal = Calendar.getInstance();  
			cal.setTime(date);  
			if (s.equals("1h")) {
				cal.set(Calendar.HOUR_OF_DAY, date.getHours() - 1);  
			}else if (s.equals("2h")) {
				cal.set(Calendar.HOUR_OF_DAY, date.getHours() - 2);  
			}else if (s.equals("3h")) {
				cal.set(Calendar.HOUR_OF_DAY, date.getHours() - 3);  
			}else if (s.equals("1d")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 1);  
			}else if (s.equals("2d")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 2);  
			}else if (s.equals("3d")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 3);  
			}else if (s.equals("1w")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 7);  
			}else if (s.equals("2w")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 14);  
			}else if (s.equals("3w")) {
				cal.set(Calendar.DAY_OF_MONTH, date.getDate() - 21);  
			}else {
				cal.set(Calendar.MONTH, date.getMonth() - 1);  
			}
			date = cal.getTime(); 
			
			ql.append("AND c.uploaddate > :time ");
			parameters.put("time", date);
		}
		
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query qr = entitymanager.createQuery(ql.toString());
		qr.setFirstResult(firsResult);
		qr.setMaxResults(maxResult);
		for (Entry<String, Object> entry : parameters.entrySet()) {
			qr.setParameter(entry.getKey(), entry.getValue());
		}
		
		return qr.getResultList();
	}
	
	/**
	 * დააბრუნებს მანქანას სესაბამისი -Id-ით
	 * @param id
	 * @return
	 */
	public Car findCar(long id){
		EntityManager entitymanager = PersistenceProvider.createEM();
		Car car = entitymanager.find(Car.class, id);
		entitymanager.close();
		return car;
	}
	/**
	 * დააბრუნებს კონკრეტული მანქანის კონკრეტულ სურათს, წარმოდგენოილს ბაიტების მასივად
	 * @param carId
	 * @param photoId
	 * @return
	 */
	public byte[] findPhoto(long carId, String photoId) {
		EntityManager entitymanager = PersistenceProvider.createEM();
		Car car = entitymanager.find(Car.class, carId);
		if (car == null) return null;
		byte[] img = null;
		if (photoId.equals("photo1")) {
			img = car.getPhoto1();
		}else if (photoId.equals("photo2")) {
			img = car.getPhoto2();
		}else if (photoId.equals("photo3")) {
			img = car.getPhoto3();
		}else if (photoId.equals("photo4")) {
			img = car.getPhoto4();
		}else if (photoId.equals("photo5")) {
			img = car.getPhoto5();
		}else if (photoId.equals("photo6")) {
			img = car.getPhoto6();
		}
		entitymanager.close();
		return img;
	}
	
	/**
	 *განაახლებს მანქანას გადმოცემული ობიექტრის მიხედვით 
	 */
	public void updateCar(Car car){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();
    	entitymanager.merge(car);
    	entitymanager.getTransaction().commit();
    	entitymanager.close();
	}
/**
 * მანქანის ატვირთვის დრო განახლდება
 * @param id
 */
	public void updateCarUpploadTime(long id) {
		EntityManager entitymanager = PersistenceProvider.createEM();
		Car car = entitymanager.find(Car.class, id);
		entitymanager.close();
		car.setUploaddate(new Date());
		updateCar(car);
	}

	/**
	 * შეამოწმებს და წაშლის ყველა იმ მანქნას, რომლის ატვირთვის დროიდან გავიდა გადმოცემული exp რაოდენობის დღე
	 * @param date
	 * @param exp
	 */
	@SuppressWarnings("unchecked")
	public void checkCarExpiration(Date date, int exp){
		EntityManager entitymanager = PersistenceProvider.createEM();
		entitymanager.getTransaction().begin();
		List<Car> cars = entitymanager.createQuery("FROM Car c").getResultList();
		for (Car car : cars) {
			if (car.getUploaddate() == null || (int)( (date.getTime() - car.getUploaddate().getTime()) 
	                 / (1000 * 60 * 60 * 24) ) > exp) {
				System.out.println("Deleting car id = " + car.getId());
				entitymanager.remove(car);
			}
		}
		entitymanager.getTransaction().commit();
		entitymanager.close();
	}
	
	/**
	 * დააბრუნებს მანქანების სიას, რომელების არიან მიბმული გადმოცემულ მომხმარებელზე
	 */
	@SuppressWarnings("unchecked")
	public List<Car> LoadCarsByUser(long userId) {
		EntityManager entitymanager = PersistenceProvider.createEM();
		Query qr = entitymanager.createQuery("FROM Car c WHERE c.user.id =:userId").setParameter("userId", userId);
		return qr.getResultList();
	}
}
