package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;

@Entity

public class StaffDetails implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	private String mda;
	
	private String email;
	
	private int mdaId;
	
	public int getId() {
		return id;
	}
	
	public String getMda() {
		return mda;
	}
	
	public void setMda(String mda) {
		this.mda = mda;
	}
	
	public int getMdaId() {
		return mdaId;
	}
	
	public void setMdaId(int mdaId) {
		this.mdaId = mdaId;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", mda=" + mda + ", mdaId=" + mdaId + ", email=" + email
				+ "]";
	}
	
}
