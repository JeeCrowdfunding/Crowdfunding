package m1.cf.conf;

import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.Database;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
public class Config {

	// validate, update, create, create-drop
	private static final String HBM2DDL = "create";

	private static final String HOST_MYSQL = "localhost";
	private static final String PORT_MYSQL = "3306";
	private static final String USER_MYSQL = "root";
	private static final String PASS_MYSQL = "root";
	private static final String DB_NAME_MYSQL = "crowdfunding";

	private static final Class<com.mysql.jdbc.Driver> DRIVER_MY = com.mysql.jdbc.Driver.class;
	private static final Class<org.hibernate.dialect.MySQL5Dialect> DIALECT_MY = org.hibernate.dialect.MySQL5Dialect.class;
	private static final Database DB_MYSQL = Database.MYSQL;
	private static final String URL_MYSQL = "jdbc:mysql://" + HOST_MYSQL + ":" + PORT_MYSQL + "/" + DB_NAME_MYSQL;

	@Bean
	public DriverManagerDataSource dataSource() {
		DriverManagerDataSource bean = new DriverManagerDataSource();
		bean.setDriverClassName(DRIVER_MY.getName());
		bean.setUrl(URL_MYSQL);
		bean.setUsername(USER_MYSQL);
		bean.setPassword(PASS_MYSQL);
		return bean;
	}

	@Bean
	public Map<String, Object> jpaProperties() {
		Map<String, Object> props = new HashMap<String, Object>();
		props.put("hibernate.dialect", DIALECT_MY.getName());
		props.put("hibernate.hbm2ddl.auto", HBM2DDL);
		props.put("hibernate.show_sql", true);
		return props;
	}

	@Bean
	public JpaVendorAdapter jpaVendorAdapter() {
		HibernateJpaVendorAdapter bean = new HibernateJpaVendorAdapter();
		bean.setShowSql(true);
		bean.setGenerateDdl(true);
		bean.setDatabase(DB_MYSQL);
		return bean;
	}

	@Bean
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
		LocalContainerEntityManagerFactoryBean bean = new LocalContainerEntityManagerFactoryBean();
		bean.setDataSource(this.dataSource());
		bean.setJpaPropertyMap(this.jpaProperties());
		bean.setJpaVendorAdapter(this.jpaVendorAdapter());
		return bean;
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		return new JpaTransactionManager(entityManagerFactory().getObject());
	}

	@Bean
	public InternalResourceViewResolver jspViewResolver() {
		InternalResourceViewResolver bean = new InternalResourceViewResolver();
		bean.setViewClass(org.springframework.web.servlet.view.JstlView.class);
		bean.setPrefix("WEB-INF/views/");
		bean.setSuffix(".jsp");
		return bean;
	}

	/*
	 * files uploading handler, max size 100MB
	 */
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver bean = new CommonsMultipartResolver();
		bean.setDefaultEncoding("UTF-8");
		bean.setMaxUploadSize(100000000);
		return bean;
	}

}