package net.kzn.onlineshopping.model;

import java.io.Serializable;

import net.kzn.shoppingbackend.dto.Cart;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.StaffRecord;
import net.kzn.shoppingbackend.dto.User;

public class UserModel implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String fullName;
	private String role;
	private StaffRecord staffRecord;
	private Leave1 leave;
	private User user;
	
	
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Leave1 getLeave() {
		return leave;
	}
	public void setLeave(Leave1 leave) {
		this.leave = leave;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	private Cart cart;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	public StaffRecord getStaffRecord() {
		return staffRecord;
	}
	public void setStaffRecord(StaffRecord staffRecord) {
		this.staffRecord = staffRecord;
	}
	
	
		
}
