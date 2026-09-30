package br.com.ammf.utils;

import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
	static Logger logger = Logger.getLogger(HibernateUtil.class);

	/** System property (-Dammf.ambiente=dsv) que define o ambiente. */
	public static final String PROPRIEDADE_AMBIENTE = "ammf.ambiente";
	/** Variavel de ambiente alternativa a system property. */
	public static final String VARIAVEL_AMBIENTE = "AMMF_AMBIENTE";
	/** Sem configuracao explicita assume producao, para o deploy nao depender de ajuste no servidor. */
	public static final String AMBIENTE_PADRAO = "prd";

	private static SessionFactory factory;

	static{
		try {
			String ambiente = getAmbiente();
			Configuration configuration = new Configuration().configure("hibernate.cfg.xml");
			configuration.addProperties(carregarPropriedades(ambiente));
			logger.info("=> :: HibernateUtil.java :: ambiente [" + ambiente + "] url ["
					+ configuration.getProperty("hibernate.connection.url") + "]");
			factory = configuration.buildSessionFactory();
		} catch (Exception e) {
			logger.error("=> :: HibernateUtil.java :: " + e.getMessage(), e);
		}
	}

	public static String getAmbiente() {
		String ambiente = System.getProperty(PROPRIEDADE_AMBIENTE);
		if (ambiente == null || ambiente.trim().isEmpty()) {
			ambiente = System.getenv(VARIAVEL_AMBIENTE);
		}
		if (ambiente == null || ambiente.trim().isEmpty()) {
			ambiente = AMBIENTE_PADRAO;
		}
		return ambiente.trim().toLowerCase();
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
