package ge.iauto.server.model;

import ge.iauto.server.PersistenceService;

import java.util.ArrayList;
import java.util.List;

public class AddInitialData {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		
		CarModel model = null;
		List<CarModel> modelsss = new ArrayList<CarModel>();
		
		CarMake mark = new CarMake();
		mark.setName("ACURA");
		model = new CarModel();
		
		model.setName("CL");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("CSX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("El");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("ILX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("Integra");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("Legend");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("MDX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("NSX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("RDX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("TL");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("Verisa");
		model.setCarmake(mark);
		modelsss.add(model);
		
		model = new CarModel();
		model.setName("ZDX");
		model.setCarmake(mark);
		modelsss.add(model);
		
		
		mark.setModels(modelsss);
		
		
		//===========================================
		
		CarModel mod = null;
		List<CarModel> models = new ArrayList<CarModel>();
		
		CarMake markk = new CarMake();
		markk.setName("ALFA ROMEO");
		
		mod = new CarModel();
		mod.setName("145");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("146");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("156");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("159");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("164");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("8C");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Alfasud");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Alfeta");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Arna");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Brera");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Giulieta");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("GT");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("GTA Coupe");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("GTV");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Mito");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Montreal");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("RZ");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("Spider");
		mod.setCarmake(markk);
		models.add(mod);
		
		mod = new CarModel();
		mod.setName("SZ");
		mod.setCarmake(markk);
		models.add(mod);
		
		
		markk.setModels(models);
		
		
		//==========================persist===================
	PersistenceService service = new PersistenceService();
		service.saveCarMake(mark);
		service.saveCarMake(markk);
		
		//=========================save Location and Category
		Location location = null;
		
		location = new Location();
		location.setName("საქართველო");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("თბილისი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("რუსთავის ავტობაზრობა");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ქუთაისი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ზესტაფონი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ახმეტა");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ბორჯომი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ბატუმი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("სოხუმი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ცხინვალი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("გორი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ფოთი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("თელავი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("გურჯაანი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("კასპი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("საგარეჯო");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ქობულეთი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ოზურგეთი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ამბროლაური");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ხაშური");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ახალქალაქი");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("ახალციხე");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("მცხეთა");
		service.saveLocation(location);
		
		location = new Location();
		location.setName("საზღვარგარეთი");
		service.saveLocation(location);
		
		
		
		
		Category category = null;
		
		category = new Category();
		category.setName("სედანი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("ჯიპი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("კუპე");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("ჰეჩბეკი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("კაბრიოლეტი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("პიკაპი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("მინივენი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("მიკროავტობუსი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("ფურგონი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("ლიმუზინი");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("სპეც-ტექნიკა");
		service.saveCategory(category);
		
		category = new Category();
		category.setName("მოტოციკლი");
		service.saveCategory(category);
		

	}

}
