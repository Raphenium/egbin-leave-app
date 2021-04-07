package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.StaffRecordDAO;
import net.kzn.shoppingbackend.dto.Product;
import net.kzn.shoppingbackend.dto.StaffRecord;


@Repository("staffRecordDAO")
@Transactional
public class StaffRecordDAOImpl implements StaffRecordDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<StaffRecord> list() {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM StaffRecord" , StaffRecord.class)
						.getResultList();
	}
	
	@Override
	public List<StaffRecord> listLineManagers() {
		String selectActiveProducts = "FROM StaffRecord WHERE level = :level";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProducts, StaffRecord.class)
						.setParameter("level", 1)
							.getResultList();
	}
	
	/*
	 * INSERT
	 * */
	@Override
	public boolean add(StaffRecord staffRecord) {
		try {			
			sessionFactory
					.getCurrentSession()
						.persist(staffRecord);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;
	}

	/*
	 * UPDATE
	 * */
	@Override
	public boolean update(StaffRecord staffRecord) {
		try {			
			sessionFactory
					.getCurrentSession()
						.update(staffRecord);
			return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;		
	}

	
	/*
	 * DELETE
	 * */
	@Override
	public boolean delete(StaffRecord staffRecord) {
		try {
			
			sessionFactory
			.getCurrentSession()
				.delete(staffRecord);
					return true;
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}		
		return false;			
	}
	
	@Override
	public StaffRecord get(int staffId) {
		try {			
			return sessionFactory
					.getCurrentSession()
						.get(StaffRecord.class,Integer.valueOf(staffId));			
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}
		return null;
	}

}
