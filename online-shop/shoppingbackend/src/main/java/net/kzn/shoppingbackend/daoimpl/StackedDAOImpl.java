package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.StackedDAO;
import net.kzn.shoppingbackend.dto.Stacked;

@Repository("stackedDAO")
@Transactional
public class StackedDAOImpl implements StackedDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<Stacked> list(){
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Stacked", Stacked.class)
					.getResultList();
	}

}
	
