package br.com.ammf.utils;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.stat.Statistics;

public class HibernateUtil {
	static Logger logger = Logger.getLogger(HibernateUtil.class);
	
	private static SessionFactory factory;
	
	static{
		try {
			factory = new AnnotationConfiguration().configure("hibernate.cfg.xml").buildSessionFactory();
		} catch (Exception e) {
			logger.error("=> :: HibernateUtil.java :: " + e.getMessage());
		}
	}

	public static Session getSession() {
		return factory.openSession();
	}
	
	public static void getStatistics() {
		
		long abertas;
		long fechadas;
		
	    if (!factory.getStatistics().isStatisticsEnabled()) {
	    	factory.getStatistics().setStatisticsEnabled(true);
	    }	    
	    
	    Statistics statistics = factory.getStatistics();
	    
	    abertas = statistics.getSessionOpenCount();
	    fechadas = statistics.getSessionCloseCount();
	    System.out.println("|- Sessoes abertas (Factory):"+(abertas));
	    System.out.println("|- Sessoes fechadas (Factory):"+(fechadas));
	    System.out.println("|- Sessoes nao fechadas (Factory):"+(abertas-fechadas));	    
		
	 }

}
