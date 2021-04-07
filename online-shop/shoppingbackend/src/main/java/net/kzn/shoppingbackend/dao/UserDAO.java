package net.kzn.shoppingbackend.dao;

import java.util.List;

import net.kzn.shoppingbackend.dto.Address;
import net.kzn.shoppingbackend.dto.StaffRecord;
import net.kzn.shoppingbackend.dto.User;

public interface UserDAO {

	// user related operation
	User getByEmail(String email);
	User get(int id);
	boolean update(User user);

	boolean add(User user);
	
	// adding and updating a new address
	Address getAddress(int addressId);
	boolean addAddress(Address address);
	boolean updateAddress(Address address);
	Address getBillingAddress(int userId);
	List<Address> listShippingAddresses(int userId);
	boolean delete(User staffRecord);
	List<User> list();
	List<User> listLineManagers();	
	

	
}
