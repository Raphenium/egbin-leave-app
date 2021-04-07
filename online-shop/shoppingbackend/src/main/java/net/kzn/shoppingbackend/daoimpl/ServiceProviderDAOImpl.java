package net.kzn.shoppingbackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import net.kzn.shoppingbackend.dao.ServiceProviderDAO;
import net.kzn.shoppingbackend.dto.ServiceProviders;

@Repository("ServiceProviderDAO")
@Transactional
public class ServiceProviderDAOImpl implements ServiceProviderDAO{
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<ServiceProviders> list() {
		return sessionFactory
				.getCurrentSession()
					.createQuery("FROM ServiceProviders", ServiceProviders.class)
						.getResultList();
	}

}
