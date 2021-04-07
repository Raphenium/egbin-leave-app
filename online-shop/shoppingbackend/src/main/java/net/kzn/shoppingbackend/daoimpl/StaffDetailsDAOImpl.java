package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.StaffDetailsDAO;
import net.kzn.shoppingbackend.dto.StaffDetails;

@Repository("staffDetailsDAO")
@Transactional
public class StaffDetailsDAOImpl implements StaffDetailsDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<Object[]> list(){
		return sessionFactory
				.getCurrentSession()
					.createQuery("SELECT m.mda, s.name, s.email FROM Stacked m, StaffDetails s WHERE m.id = s.mdaId", Object[].class)
					.getResultList();
	}
}
	
