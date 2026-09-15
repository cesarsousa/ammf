package br.com.ammf.utils;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	static Logger logger = Logger.getLogger(HibernateUtil.class);

	private static SessionFactory factory;

	static{
		try {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		} catch (Exception e) {
			logger.error("=> :: HibernateUtil.java :: " + e.getMessage());
		}
	}

	public static Session getSession() {
		return factory.openSession();
	}

}
