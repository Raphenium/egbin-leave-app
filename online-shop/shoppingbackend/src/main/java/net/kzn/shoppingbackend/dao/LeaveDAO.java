package net.kzn.shoppingbackend.dao;


import java.util.List;

import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.User;

public interface LeaveDAO {
	public Leave1 get(int id);
	public boolean add(Leave1 leave);
	public boolean update(Leave1 leave);
	List<Leave1> list();

}
