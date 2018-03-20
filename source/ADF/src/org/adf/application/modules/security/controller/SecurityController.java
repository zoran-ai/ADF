package org.adf.application.modules.security.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.common.mybatis.vo.SecurityContext;
import org.adf.application.modules.security.service.SecurityService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@SuppressWarnings("all")
public class SecurityController extends ApplicationController {

	@Resource
	private SecurityService securityService;
	
	/**
	 * 转向登录页面
	 */
	@RequestMapping(value = "/login")
	public String login(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/security/login";
	}
	
	/**
	 * 转向主页面
	 */
	@RequestMapping(value = "/app/main")
	public String main(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/security/main";
	}
	
	/**
	 * 获取菜单树
	 */
	@RequestMapping(value = "/app/getMenuTree")
	public void getMenuTree(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			HttpSession session = request.getSession();
			
			SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
			
			String userId = securityContext == null ? "" : securityContext.getUser_id();
			
			String json = securityService.getMenuTree(userId);

			result.setResult_code("Y");
			result.setResult_info(json);
		} catch (Exception e) {
			e.printStackTrace();

			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}
	
}
