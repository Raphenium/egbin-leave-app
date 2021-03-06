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
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "user_detail")
public class User implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@NotBlank(message = "Please enter first name!")
	@Column(name = "first_name")
	private String firstName;
	@NotBlank(message = "Please enter last name!")
	@Column(name = "last_name")
	private String lastName;
	@NotBlank(message = "Please enter email address!")	
	private String email;
	@NotBlank(message = "Please enter contact number!")
	@Column(name = "contact_number")
	private String contactNumber;
	private String role;
	@NotBlank(message = "Please enter password!")
	private String password;
	private boolean enabled = true;
	
	@JsonIgnore
	@Column(name = "manager_id")
	private int managerId;
	@Column(name = "sick_leave_ballance")
	private int sickLeaveBallance = 10;
	@Column(name = "exam_leave_ballance")
	private int examLeaveBallance = 5;
	@Column(name = "annual_leave_ballance")
	private int annualLeaveBallance = 20;
	
	@Column(name = "level")
	private int level = 0;
	
	@JsonIgnore
	@Column(name = "is_active")	
	private boolean active = true;
	
	@JsonIgnore
	@Transient
	private String confirmPassword;
	
	@JsonIgnore
	@OneToMany(mappedBy="user", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	private List<Leave1> leave = new ArrayList<>();

	public List<Leave1> getLeave() {
		return leave;
	}
	public void setLeave(List<Leave1> leave) {
		this.leave = leave;
	}
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
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
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", contactNumber=" + contactNumber + ", role=" + role + ", password=" + password + ", enabled="
				+ enabled + "]";
	}
	
	@JsonIgnore
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
	private Cart cart;
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
