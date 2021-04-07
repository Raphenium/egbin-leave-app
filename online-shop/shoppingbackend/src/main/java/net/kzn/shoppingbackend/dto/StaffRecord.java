package net.kzn.shoppingbackend.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Max;

@Entity
public class StaffRecord implements Serializable{
private static final long serialVersionUID = 1L;
	
	// private fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "first_name")
	private String firstName;
	@Column(name = "last_name")
	private String lastName;
	@Column(name = "manager_id")
	private int managerId;
	@Column(name = "sick_leave_ballance")
	private int sickLeaveBallance = 10;
	@Column(name = "exam_leave_ballance")
	private int examLeaveBallance = 5;
	@Column(name = "annual_leave_ballance")
	private int annualLeaveBallance = 20;
	private int level = 0;
	@Column(name = "is_active")	
	private boolean active = true;
	
	
	
//	@Transient
//	@Max(value = 5, message="You can only select a maximum of 10 days for sick Leave!")
//	private int sickLeaveApplied;
//	@Transient
//	@Max(value = 5, message="You can only select a maximum of 5 days for exam Leave!")
//	private int examLeaveApplied;
//	@Transient
//	@Max(value = 14, message="You can only select a maximum of 14 days at a stretch for Annual Leave!")
//	private int annualLeaveApplied;
	
	
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public int getManagerId() {
		return managerId;
	}
	public void setManagerId(int managerId) {
		this.managerId = managerId;
	}
	public int getSickLeaveBallance() {
		return sickLeaveBallance;
	}
	public void setSickLeaveBallance(int sickLeaveBallance) {
		this.sickLeaveBallance = sickLeaveBallance;
	}
	public int getExamLeaveBallance() {
		return examLeaveBallance;
	}
	public void setExamLeaveBallance(int examLeaveBallance) {
		this.examLeaveBallance = examLeaveBallance;
	}
	public int getAnnualLeaveBallance() {
		return annualLeaveBallance;
	}
	public void setAnnualLeaveBallance(int annualLeaveBallance) {
		this.annualLeaveBallance = annualLeaveBallance;
	}
	
	
//	public int getSickLeaveApplied() {
//		return sickLeaveApplied;
//	}
//	public void setSickLeaveApplied(int sickLeaveApplied) {
//		this.sickLeaveApplied = sickLeaveApplied;
//	}
//	public int getExamLeaveApplied() {
//		return examLeaveApplied;
//	}
//	public void setExamLeaveApplied(int examLeaveApplied) {
//		this.examLeaveApplied = examLeaveApplied;
//	}
//	public int getAnnualLeaveApplied() {
//		return annualLeaveApplied;
//	}
//	public void setAnnualLeaveApplied(int annualLeaveApplied) {
//		this.annualLeaveApplied = annualLeaveApplied;
//	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	
	@Override
	public String toString() {
		return "StaffRecord [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", managerId="
				+ managerId + ", sickLeaveBallance=" + sickLeaveBallance + ", examLeaveBallance=" + examLeaveBallance
				+ ", annualLeaveBallance=" + annualLeaveBallance + ", level=" + level + "]";
	}
	
}
