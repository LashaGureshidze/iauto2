package ge.iauto.server.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
@SuppressWarnings("serial")
@Entity
public class CarMake implements Serializable{
	
	private long id;
	
	private String name;
	
	private List<CarModel> models = new ArrayList<CarModel>();
	
	private List<Car> cars = new ArrayList<Car>();
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	public long getId() {
		return id;
	}
	
	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	@OneToMany(mappedBy="carmake",cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	public List<CarModel> getModels() {
		return models;
	}

	public void setModels(List<CarModel> models) {
		this.models = models;
	}
	@OneToMany(mappedBy="carmake",cascade = CascadeType.ALL)
	public List<Car> getCars() {
		return cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}
}
