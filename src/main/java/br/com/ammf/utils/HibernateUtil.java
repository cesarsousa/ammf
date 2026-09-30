package br.com.ammf.utils;

import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	static Logger logger = Logger.getLogger(HibernateUtil.class);

	private static SessionFactory factory;

	static{
		try {
			String ambiente = Ambiente.getAtual();
			Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
			configuration.addProperties(carregarPropriedades(ambiente));
			logger.info("=> :: HibernateUtil.java :: ambiente [" + ambiente + "] url ["
					+ configuration.getProperty("hibernate.connection.url") + "]");
			factory = configuration.buildSessionFactory();
		} catch (Exception e) {
			logger.error("=> :: HibernateUtil.java :: " + e.getMessage(), e);
		}
	}

	private static Properties carregarPropriedades(String ambiente) throws Exception {
		String arquivo = "ambiente/hibernate-" + ambiente + ".properties";
		InputStream in = HibernateUtil.class.getClassLoader().getResourceAsStream(arquivo);
		if (in == null) {
			throw new IllegalStateException("Arquivo de configuracao do ambiente [" + ambiente
					+ "] nao encontrado no classpath: " + arquivo);
		}
		try {
			Properties propriedades = new Properties();
			propriedades.load(in);
			return propriedades;
		} finally {
			in.close();
		}
	}

	public static Session getSession() {
		return factory.openSession();
	}

}
