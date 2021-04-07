package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.EpmRepObjAttrDAO;
import net.kzn.shoppingbackend.dto.EpmRepObjAttr;

@Repository("epmRepObjAttrDAO")
@Transactional
public class EpmRepObjAttrDAOImpl implements EpmRepObjAttrDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	/*
	 * LIST
	 * */
	
	@Override
	public List<EpmRepObjAttr> list(){
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM EpmRepObjAttr", EpmRepObjAttr.class)
					.getResultList();
	}
}