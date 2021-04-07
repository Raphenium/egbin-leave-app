package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name = "Ralph_Obj")
public class RalphObj1 extends AbstractRalphEntity implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String myClassName;
	
	    public RalphObj1(String name, String description, Double value, Long id) {
	        super(name, description, value);
	        this.id = id;
	       
	    }
	
	@Override
	public String getMyClassName() {
		return RalphObj1.class.getCanonicalName();
	}

	
}
