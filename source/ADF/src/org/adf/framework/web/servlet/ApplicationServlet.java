package org.adf.framework.web.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.log4j.Logger;

@SuppressWarnings("all")
public class ApplicationServlet extends HttpServlet {

	private Logger logger = Logger.getLogger(getClass());
	
	public void init() throws ServletException {
		logger.info("ApplicationServlet initialization begin ...");
		// do something you want to do
		logger.info("ApplicationServlet initialization end ...");
	}
	
}
