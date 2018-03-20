package org.adf.framework.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;

import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("all")
public class ApplicationController {

	/**
	 * 输出 响应数据
	 */
	public void outputResponseData(HttpServletResponse response, String contentType, String data) {
		/********** support cross domain begin **********/
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setHeader("Cache-Control", "no-cache");
		/********** support cross domain end **********/
		
		response.setContentType(contentType);
		
		try {
			response.getWriter().print(data);
			response.getWriter().flush();
			response.getWriter().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 获取异常信息
	 */
	public String getExceptionMessage(Exception e) {
		StackTraceElement[] stackTrace = e.getStackTrace();
		
		String message = new String("");
		
		message += "<table style=\"width:100%;margin:0px;border:0px;line-height:25px;word-break:break-all; word-wrap:break-all;\">";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;width:50px;\">";
		message += "异常：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:500;\">";
		message += e.getClass().getName() + ":" + e.getLocalizedMessage();
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "类：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:500;\">";
		message += stackTrace[0].getClassName(); 
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "方法：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:500;\">";
		message += stackTrace[0].getMethodName(); 
		message += "</td>";
		message += "</tr>";
		
		message += "<tr>";
		message += "<td style=\"text-align:right;\">";
		message += "行号：";
		message += "</td>";
		message += "<td style=\"text-align:left;font-weight:500;\">";
		message += stackTrace[0].getLineNumber(); 
		message += "</td>";
		message += "</tr>";
		
		message += "</table>";
		
		return message;
	}
	
}
