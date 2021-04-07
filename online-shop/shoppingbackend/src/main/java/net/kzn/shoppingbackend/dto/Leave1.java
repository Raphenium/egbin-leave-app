package net.kzn.shoppingbackend.dto;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Max;

@Entity
public class Leave1 implements Serializable {
	
    private static final long serialVersionUID = 1L;
	
	// private fields
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "start_date")
	private String startDate; 
	
	@Column(name = "created_date")
	private LocalDate createdDate; 
	
	@Column(name = "approved_date")
	private LocalDate approvedDate; 
	
	@Column(name = "end_date")
	private String endDate;
	
	@Column(name = "resumption_date")
	private String resumptionDate;
	
	private int days;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;
	
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Max(value = 10, message="You can only select a maximum of 10 days for sick Leave!")
	private int sickLeaveApplied;
	
	@Max(value = 5, message="You can only select a maximum of 5 days for exam Leave!")
	private int examLeaveApplied;
	
	@Max(value = 14, message="You can only select a maximum of 14 days at a stretch for Annual Leave!")
	private int annualLeaveApplied;
	
	private String status = "PENDING"; 
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getResumptionDate() {
		return resumptionDate;
	}
	public void setResumptionDate(String resumptionDate) {
		this.resumptionDate = resumptionDate;
	}
	public int getDays() {
		return days;
	}
	public void setDays(int days) {
		this.days = days;
	}
	public int getSickLeaveApplied() {
		return sickLeaveApplied;
	}
	public void setSickLeaveApplied(int sickLeaveApplied) {
		this.sickLeaveApplied = sickLeaveApplied;
	}
	public int getExamLeaveApplied() {
		return examLeaveApplied;
	}
	public void setExamLeaveApplied(int examLeaveApplied) {
		this.examLeaveApplied = examLeaveApplied;
	}
	public int getAnnualLeaveApplied() {
		return annualLeaveApplied;
	}
	public void setAnnualLeaveApplied(int annualLeaveApplied) {
		this.annualLeaveApplied = annualLeaveApplied;
	}
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public LocalDate getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(LocalDate createdDate) {
		this.createdDate = createdDate;
	}
	public LocalDate getApprovedDate() {
		return approvedDate;
	}
	public void setApprovedDate(LocalDate approvedDate) {
		this.approvedDate = approvedDate;
	}
	@Override
	public String toString() {
		return "Leave [id=" + id + ", startDate=" + startDate + ", endDate=" + endDate + ", resumptionDate="
				+ resumptionDate + ", days=" + days + ", sickLeaveApplied=" + sickLeaveApplied + ", examLeaveApplied="
				+ examLeaveApplied + ", annualLeaveApplied=" + annualLeaveApplied + ", status=" + status + "]";
	}
}
