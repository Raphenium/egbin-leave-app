package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import net.kzn.shoppingbackend.dao.EmployeeTypeDAO;
import net.kzn.shoppingbackend.dto.EmployeeType;

@Repository("EmployeeTypeDAO")
@Transactional
public class EmployeeTypeDAOImpl implements EmployeeTypeDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<EmployeeType> list(){
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM EmployeeType", EmployeeType.class)
					.getResultList();
	}
}
	
