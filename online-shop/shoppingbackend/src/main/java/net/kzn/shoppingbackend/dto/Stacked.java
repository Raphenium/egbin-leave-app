package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Stacked implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	
	private String mda;
	
	private double staff;
	
	private double salary;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMda() {
		return mda;
	}

	public void setMda(String mda) {
		this.mda = mda;
	}
	
	public double getStaff() {
		return staff;
	}

	public void setStaff(double staff) {
		this.staff = staff;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	@Override
	public String toString() {
		return "Stacked [id=" + id + ", mda=" + mda + ", staff=" + staff + ",salary=" + salary + "]";
	}
	
}