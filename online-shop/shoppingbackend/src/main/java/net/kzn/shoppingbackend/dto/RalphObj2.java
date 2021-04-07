package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class RalphObj2 extends AbstractRalphEntity implements Serializable {
	@Id
	private Long id;
	
	private String myClassName;
	
	 public RalphObj2(String name, String description, Double value, Long id, String myClassName) {
	        super(name, description, value);
	        this.id = id;
	        this.myClassName = myClassName;
	    }
	
	public void setMyClassName(String myClassName) {
		this.myClassName = myClassName;
	}

	@Override
	public String getMyClassName() {
		return RalphObj1.class.getCanonicalName();
	}	
}
