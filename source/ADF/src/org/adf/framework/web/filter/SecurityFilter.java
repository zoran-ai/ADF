package org.adf.framework.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.adf.application.common.mybatis.vo.SecurityContext;

@SuppressWarnings("all")
public class SecurityFilter implements Filter {

	private Logger logger = Logger.getLogger(getClass());
	
	public void init(FilterConfig filterConfig) throws ServletException {
		logger.info("SecurityFilter init success ...");
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)servletRequest;
	    HttpServletResponse response = (HttpServletResponse)servletResponse;
	    
		HttpSession session = request.getSession();
		
		// 临时添加 begin
		SecurityContext context = new SecurityContext();
		context.setAdminLTESkin("blue");
		context.setBootstrapSkin("primary");
		session.setAttribute("SecurityContext", context);
		// 临时添加 end
		
//		if (session == null) {
// 			doRequest(request, response, "timeout");
// 		} else {
// 			SecurityContext context = (SecurityContext) session.getAttribute("SecurityContext");
// 			if (context == null) {
// 				doRequest(request, response, "login");
// 		    } else {
 		    	filterChain.doFilter(request, response);
// 		    }
// 		}
	}

	public void destroy() {
		logger.info("SecurityFilter destroy success ...");
	}
	
	private void doRequest(HttpServletRequest request,
			HttpServletResponse response, String page) throws IOException {
		String requestWith = request.getHeader("x-requested-with");
		// Ajax请求
		if (requestWith != null && "XMLHttpRequest".equalsIgnoreCase(requestWith)) {
			response.setHeader("Access-Control-Allow-Origin", "*");
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print("<script>window.location.href='" + request.getContextPath() + "/" + page + "';</script>");
			response.getWriter().flush();
			response.getWriter().close();
		}
		// 普通请求
		else {
			response.sendRedirect(request.getContextPath() + "/" + page);
		}
	}

}
