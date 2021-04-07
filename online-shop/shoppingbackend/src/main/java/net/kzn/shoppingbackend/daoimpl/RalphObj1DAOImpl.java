package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.RalphObj1DAO;
import net.kzn.shoppingbackend.dto.RalphObj1;

@Repository("RalphObj1DAO")
@Transactional
public class RalphObj1DAOImpl implements RalphObj1DAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<RalphObj1> list(){
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM RalphObj1", RalphObj1.class)
					.getResultList();
	}
}
	
