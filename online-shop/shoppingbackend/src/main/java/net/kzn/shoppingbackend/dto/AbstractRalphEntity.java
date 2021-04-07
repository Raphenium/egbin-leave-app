package net.kzn.shoppingbackend.dto;


import javax.persistence.Entity;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public abstract class AbstractRalphEntity {
	
	private String name;
	
	private String description;
	
	private double value;
	
	public AbstractRalphEntity(String name, String description, Double value) {
		this.name = name;
		this.description = description;
		this.value = value;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}


	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}


	public double getValue() {
		return value;
	}


	public void setValue(double value) {
		this.value = value;
	}
	
	@Override
	public String toString() {
		return "AbstractRalphEntity [name=" + name + ", description=" + description + ", value=" + value + "]";
	}	
	
	public abstract String getMyClassName();
}