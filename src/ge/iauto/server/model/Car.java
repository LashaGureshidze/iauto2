package ge.iauto.server.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

@SuppressWarnings("serial")
@Entity
public class Car implements Serializable{
	
	private long id;
	
	private Date uploaddate;
	
	private User user;
	
	private Category category;
	
	private CarMake carmake;
	
	private CarModel carmodel;
	
	private Location location;
	
	private int year;
	
	private int month;
	
	private String currency;
	
	private String kilometer;
	
	private String doors;
	
	private String airbag;
	
	private boolean rent;
	
	private String gearbox;
	
	private String username;
	
	private boolean abs;
	
	private boolean window;
	
	private boolean climat;
	
	private boolean wheel;
	//ლუქი
	private boolean topwindow;
	
	private boolean computer;
	
	private boolean sequrity;
	
	private int price;
	
	private boolean ganbajebuli;
	
	private boolean changable;
	
	private boolean saleonauction;
	
	private double engine;
	
	private String cylinder;
	
	private String actionwheel;
	
	private String fuel;
	
	private String color;
	
	private boolean rightsteeringwheel;
	
	private boolean turbo;
	
	private String telephone;
	
	private boolean parkcontrol;
	
	private boolean conditioner;
	
	private boolean leather;
	
	private boolean navigation;
	
	private boolean centrallock;
	
	private boolean savardzlisgatboba;
	
	private boolean hydraulics;
	
	private String bringyear;
	
	private String vincode;
	
	private String describtion;
	
	private byte[] photo1;

	private byte[] photo2;
	
	private byte[] photo3;
	
	private byte[] photo4;
	
	private byte[] photo5;
	
	private byte[] photo6;
	
	public Car() {
		// TODO Auto-generated constructor stub
	}
	
	public Car(long id, Date uploaddate) {
		this.id = id;
		this.uploaddate = uploaddate;
	}
	
	@Lob
	@Basic(fetch=FetchType.EAGER)
	public byte[] getPhoto1() {
		return photo1;
	}
	
	public void setPhoto1(byte[] photo1) {
		this.photo1 = photo1;
	}
	@Lob
	@Basic(fetch=FetchType.LAZY)
	public byte[] getPhoto2() {
		return photo2;
	}

	public void setPhoto2(byte[] photo2) {
		this.photo2 = photo2;
	}
	@Lob
	@Basic(fetch=FetchType.LAZY)
	public byte[] getPhoto3() {
		return photo3;
	}

	public void setPhoto3(byte[] photo3) {
		this.photo3 = photo3;
	}
	@Lob
	@Basic(fetch=FetchType.LAZY)
	public byte[] getPhoto4() {
		return photo4;
	}

	public void setPhoto4(byte[] photo4) {
		this.photo4 = photo4;
	}
	@Lob
	@Basic(fetch=FetchType.LAZY)
	public byte[] getPhoto5() {
		return photo5;
	}

	public void setPhoto5(byte[] photo5) {
		this.photo5 = photo5;
	}
	@Lob
	@Basic(fetch=FetchType.LAZY)
	public byte[] getPhoto6() {
		return photo6;
	}

	public void setPhoto6(byte[] photo6) {
		this.photo6 = photo6;
	}
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getKilometer() {
		return kilometer;
	}

	public void setKilometer(String kilometer) {
		this.kilometer = kilometer;
	}

	public String getDoors() {
		return doors;
	}

	public void setDoors(String doors) {
		this.doors = doors;
	}

	public String getAirbag() {
		return airbag;
	}

	public void setAirbag(String airbag) {
		this.airbag = airbag;
	}

	public boolean isRent() {
		return rent;
	}

	public void setRent(boolean rent) {
		this.rent = rent;
	}

	public String getGearbox() {
		return gearbox;
	}

	public void setGearbox(String gearbox) {
		this.gearbox = gearbox;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public boolean isAbs() {
		return abs;
	}

	public void setAbs(boolean abs) {
		this.abs = abs;
	}

	public boolean isWindow() {
		return window;
	}

	public void setWindow(boolean window) {
		this.window = window;
	}

	public boolean isClimat() {
		return climat;
	}

	public void setClimat(boolean climat) {
		this.climat = climat;
	}

	public boolean isWheel() {
		return wheel;
	}

	public void setWheel(boolean wheel) {
		this.wheel = wheel;
	}

	public boolean isTopwindow() {
		return topwindow;
	}

	public void setTopwindow(boolean topwindow) {
		this.topwindow = topwindow;
	}

	public boolean isComputer() {
		return computer;
	}

	public void setComputer(boolean computer) {
		this.computer = computer;
	}

	public boolean isSequrity() {
		return sequrity;
	}

	public void setSequrity(boolean sequrity) {
		this.sequrity = sequrity;
	}

	public boolean isGanbajebuli() {
		return ganbajebuli;
	}

	public void setGanbajebuli(boolean ganbajebuli) {
		this.ganbajebuli = ganbajebuli;
	}

	public boolean isSaleonauction() {
		return saleonauction;
	}

	public void setSaleonauction(boolean saleonauction) {
		this.saleonauction = saleonauction;
	}

	public double getEngine() {
		return engine;
	}

	public void setEngine(double engine) {
		this.engine = engine;
	}

	public String getCylinder() {
		return cylinder;
	}

	public void setCylinder(String cylinder) {
		this.cylinder = cylinder;
	}

	public String getActionwheel() {
		return actionwheel;
	}

	public void setActionwheel(String actionwheel) {
		this.actionwheel = actionwheel;
	}

	public String getFuel() {
		return fuel;
	}

	public void setFuel(String fuel) {
		this.fuel = fuel;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public boolean isRightsteeringwheel() {
		return rightsteeringwheel;
	}

	public void setRightsteeringwheel(boolean rightsteeringwheel) {
		this.rightsteeringwheel = rightsteeringwheel;
	}

	public boolean isTurbo() {
		return turbo;
	}

	public void setTurbo(boolean turbo) {
		this.turbo = turbo;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public boolean isParkcontrol() {
		return parkcontrol;
	}

	public void setParkcontrol(boolean parkcontrol) {
		this.parkcontrol = parkcontrol;
	}

	public boolean isConditioner() {
		return conditioner;
	}

	public void setConditioner(boolean conditioner) {
		this.conditioner = conditioner;
	}

	public boolean isLeather() {
		return leather;
	}

	public void setLeather(boolean leather) {
		this.leather = leather;
	}

	public boolean isNavigation() {
		return navigation;
	}

	public void setNavigation(boolean navigation) {
		this.navigation = navigation;
	}

	public boolean isCentrallock() {
		return centrallock;
	}

	public void setCentrallock(boolean centrallock) {
		this.centrallock = centrallock;
	}

	public boolean isSavardzlisgatboba() {
		return savardzlisgatboba;
	}

	public void setSavardzlisgatboba(boolean savardzlisgatboba) {
		this.savardzlisgatboba = savardzlisgatboba;
	}

	public boolean isHydraulics() {
		return hydraulics;
	}

	public void setHydraulics(boolean hydraulics) {
		this.hydraulics = hydraulics;
	}

	public String getBringyear() {
		return bringyear;
	}

	public void setBringyear(String bringyear) {
		this.bringyear = bringyear;
	}

	public String getVincode() {
		return vincode;
	}

	public void setVincode(String vincode) {
		this.vincode = vincode;
	}

	public String getDescribtion() {
		return describtion;
	}

	public void setDescribtion(String describtion) {
		this.describtion = describtion;
	}

	@ManyToOne
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	@ManyToOne
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
	@ManyToOne
	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public boolean isChangable() {
		return changable;
	}

	public void setChangable(boolean changable) {
		this.changable = changable;
	}
	@ManyToOne
	public CarMake getCarmake() {
		return carmake;
	}

	public void setCarmake(CarMake carmake) {
		this.carmake = carmake;
	}
	@ManyToOne
	public CarModel getCarmodel() {
		return carmodel;
	}

	public void setCarmodel(CarModel carmodel) {
		this.carmodel = carmodel;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public Date getUploaddate() {
		return uploaddate;
	}

	public void setUploaddate(Date uploaddate) {
		this.uploaddate = uploaddate;
	}
}
