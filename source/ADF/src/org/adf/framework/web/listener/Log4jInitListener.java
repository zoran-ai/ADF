package org.adf.framework.web.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

@SuppressWarnings("all")
public class Log4jInitListener implements ServletContextListener {

	public static final String log4jDirectory = "log4jDirectory";
	
	public void contextDestroyed(ServletContextEvent servletContextEvent) {
		System.getProperties().remove(log4jDirectory);
	}

	public void contextInitialized(ServletContextEvent servletContextEvent) {
		String path = this.getClass().getClassLoader().getResource("/").getPath();
		String dir = path.substring(0, path.indexOf("WEB-INF/classes"));
		System.out.println("log4j path = " + dir);
		System.setProperty(log4jDirectory, dir);
	}

}
