package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.LeaveDAO;
import net.kzn.shoppingbackend.dto.Leave1;
import net.kzn.shoppingbackend.dto.User;

@Repository("leaveDAO")
@Transactional
public class LeaveDAOImpl implements LeaveDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean add(Leave1 leave) {
		try {
			sessionFactory.getCurrentSession().persist(leave);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@Override
	public List<Leave1> list() {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM Leave1", Leave1.class)
						.getResultList();
	}

	@Override
	public boolean update(Leave1 leave) {
		try {
			sessionFactory.getCurrentSession().update(leave);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}
	
	@Override
	public Leave1 get(int id) {		
		return sessionFactory.getCurrentSession().get(Leave1.class, Integer.valueOf(id));
	}

}
