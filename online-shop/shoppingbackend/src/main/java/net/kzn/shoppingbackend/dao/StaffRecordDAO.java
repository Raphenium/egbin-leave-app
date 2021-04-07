package net.kzn.shoppingbackend.dao;

import java.util.List;

import net.kzn.shoppingbackend.dto.Product;
import net.kzn.shoppingbackend.dto.StaffRecord;

public interface StaffRecordDAO {
	List<StaffRecord> listLineManagers();	
	List<StaffRecord> list();
	StaffRecord get(int staffId);
	boolean add(StaffRecord staffRecord);
	boolean update(StaffRecord staffRecord);
	boolean delete(StaffRecord staffRecord);
}
