package net.kzn.shoppingbackend.dto;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class EmployeeType implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int empInstId;
	
	private String employeeType;

	public int getEmpInstId() {
		return empInstId;
	}

	public void setEmpInstId(int empInstId) {
		this.empInstId = empInstId;
	}

	public String getEmployeeType() {
		return employeeType;
	}

	public void setEmployeeType(String employeeType) {
		this.employeeType = employeeType;
	}
	

	@Override
	public String toString() {
		return "EmployeeType [empInstId=" + empInstId + ", employeeType=" + employeeType + "]";
	}
	
}