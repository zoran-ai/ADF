package org.adf.framework.web.exception;

import java.io.PrintWriter;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

@SuppressWarnings("all")
public class ApplicationException implements HandlerExceptionResolver {

	private Logger logger = Logger.getLogger(getClass());
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception e) {
		String reg = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;at ";
		
		// 将异常信息写入日志
		logger.error(e);
		
		StackTraceElement[] stackTrace = e.getStackTrace();
		
		String message = new String("");
		
		message += "<table style=\"width:100%;margin:0px;border:0px;line-height:25px;word-break:break-all; word-wrap:break-all;\">";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;width:50px;\">";
		message += "异常：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:800;\">";
		message += e.getClass().getName() + ":" + e.getLocalizedMessage();
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "类：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:800;\">";
		message += stackTrace[0].getClassName(); 
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "方法：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:800;\">";
		message += stackTrace[0].getMethodName(); 
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "行号：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:800;\">";
		message += stackTrace[0].getLineNumber(); 
		message += "</td>";
		message += "</tr>";
		
		message += "</table>";
		
		Map map = new HashMap();
		map.put("errorMessage", message);
		
		// 跳转到错误页面
		return new ModelAndView("modules/security/exception", map);
	}

}
