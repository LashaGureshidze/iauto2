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
		
		//============================================
		
		
		CarModel audi = null;
		List<CarModel> audiModels = new ArrayList<CarModel>();
		
		CarMake audiMark = new CarMake();
		audiMark.setName("AUDI");
		
		audi = new CarModel();
		audi.setName("A3");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("A4");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("A6");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("A8");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("Coupe");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
	
		audi = new CarModel();
		audi.setName("Q5");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("A7");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audi = new CarModel();
		audi.setName("RS4");
		audi.setCarmake(audiMark);
		audiModels.add(audi);
		
		audiMark.setModels(audiModels);
		
		
		//=============================================
		CarModel bmw = null;
		List<CarModel> bmwModels = new ArrayList<CarModel>();
		
		CarMake bmwMark = new CarMake();
		bmwMark.setName("BMW");
		
		bmw = new CarModel();
		bmw.setName("1er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("3er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("5er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("6er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("7er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("8er(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("X(ყველა)");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("M1");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("M3");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("M5");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("M6");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("Z1");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("Z2");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("Z3");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
		
		bmw = new CarModel();
		bmw.setName("Z4");
		bmw.setCarmake(bmwMark);
		bmwModels.add(bmw);
	
		bmwMark.setModels(bmwModels);
		
		//====================================================
		
		CarModel cadillac = null;
		List<CarModel> cadillacModels = new ArrayList<CarModel>();
		
		CarMake cadillacMark = new CarMake();
		cadillacMark.setName("CADILLAC");
		
		cadillac = new CarModel();
		cadillac.setName("Allante");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("Catera");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("CTS");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("DE Ville");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("Eldorado");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("Escalade");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("LSE");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillac = new CarModel();
		cadillac.setName("Seville");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		
		cadillac = new CarModel();
		cadillac.setName("SRX");
		cadillac.setCarmake(cadillacMark);
		cadillacModels.add(cadillac);
		
		cadillacMark.setModels(cadillacModels);
		
		//=========================================
		
		
		CarModel chevrolet = null;
		List<CarModel> chevroletModels = new ArrayList<CarModel>();
		
		CarMake chevroletMark = new CarMake();
		chevroletMark.setName("CHEVROLET");
		
		chevrolet = new CarModel();
		chevrolet.setName("Alero");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Aveo");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Blazer");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Camaro");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Caprice");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Captiva");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Cobalt");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Evanda");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("HHR");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		
		chevrolet = new CarModel();
		chevrolet.setName("Immpala");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Lacetti");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Matiz");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Metro");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Metro Carlo");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Niva");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevrolet = new CarModel();
		chevrolet.setName("Tracker");
		chevrolet.setCarmake(chevroletMark);
		chevroletModels.add(chevrolet);
		
		chevroletMark.setModels(chevroletModels);
		
		//==================================================
		
		CarModel dodge = null;
		List<CarModel> dodgeModels = new ArrayList<CarModel>();
		
		CarMake dodgeMark = new CarMake();
		dodgeMark.setName("DODGE");
		
		dodge = new CarModel();
		dodge.setName("Avanger");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Caliber");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Caravan");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Dakota");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Intrepid");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Magnum");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("Neon");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodge = new CarModel();
		dodge.setName("RAM");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		
		dodge = new CarModel();
		dodge.setName("Viper");
		dodge.setCarmake(dodgeMark);
		dodgeModels.add(dodge);
		
		dodgeMark.setModels(dodgeModels);
		
		
		
		//===================================================\
		CarModel mini = null;
		List<CarModel> miniModels = new ArrayList<CarModel>();
		
		CarMake miniMark = new CarMake();
		miniMark.setName("MINI");
		
		mini = new CarModel();
		mini.setName("1000");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		mini = new CarModel();
		mini.setName("1300");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		mini = new CarModel();
		mini.setName("Clubman");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		mini = new CarModel();
		mini.setName("Cooper");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		mini = new CarModel();
		mini.setName("Cooper S cabrio");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		mini = new CarModel();
		mini.setName("One");
		mini.setCarmake(miniMark);
		miniModels.add(mini);
		
		miniMark.setModels(miniModels);
		
		
		//==========================persist===================
	PersistenceService service = new PersistenceService();
		service.saveCarMake(mark);
		service.saveCarMake(markk);
		service.saveCarMake(audiMark);
		service.saveCarMake(bmwMark);
		service.saveCarMake(cadillacMark);
		service.saveCarMake(chevroletMark);
		service.saveCarMake(dodgeMark);
		service.saveCarMake(miniMark);
		
		
		
		
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
