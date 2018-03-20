package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysFunction;
import org.adf.application.common.mybatis.entity.SysOperation;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.modules.system.service.FunctionService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/function/")
@SuppressWarnings("all")
public class FunctionController extends ApplicationController {
	
	@Resource
	private FunctionService functionService;
	
	/**
	 * 转向功能管理页面
	 */
	@RequestMapping(value = "FunctionMgr")
	public String toFunctionMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/function/FunctionMgr";
	}
	
	/**
	 * 获取功能列表
	 */
	@RequestMapping(value = "getFunctionList")
	public void getFunctionList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<SysFunction> functionList = functionService.getFunctionList();

			String json = JsonUtil.getJSONFromObjectList(functionList);
			
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
	
	/**
	 * 转向功能新建页面
	 */
	@RequestMapping(value = "FunctionAdd")
	public String toFunctionAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/function/FunctionAdd";
	}
	
	/**
	 * 检查功能编码是否存在
	 */
	@RequestMapping(value = "checkFunctionCode")
	public void checkFunctionCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String functionCode = request.getParameter("functionCode");
		
		SysFunction sf = functionService.getFunctionInfo(functionCode);
		
		String responseText = "false";
		
		if (sf == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建功能
	 */
	@RequestMapping(value = "addFunction")
	public void addFunction(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFunction"), "UTF-8");
			
			SysFunction sf = (SysFunction)JsonUtil.getObjectFromJSON(json, SysFunction.class);
			
			functionService.addFunction(sf);
			
			result.setResult_code("Y");
			result.setResult_info("");
		} catch (Exception e) {
			e.printStackTrace();
			
			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}
	
	/**
	 * 转向功能编辑页面
	 */
	@RequestMapping(value = "FunctionEdit")
	public String toFunctionEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/function/FunctionEdit";
	}
	
	/**
	 * 获取功能信息
	 */
	@RequestMapping(value = "getFunctionInfo")
	public void getFunctionInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String functionCode = request.getParameter("functionCode");
			
			SysFunction sf = functionService.getFunctionInfo(functionCode);
			
			String json = JsonUtil.getJSONFromObject(sf);
			
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
	
	/**
	 * 编辑功能
	 */
	@RequestMapping(value = "editFunction")
	public void editFunction(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFunction"), "UTF-8");
			
			SysFunction sf = (SysFunction)JsonUtil.getObjectFromJSON(json, SysFunction.class);
			
			functionService.editFunction(sf);
			
			result.setResult_code("Y");
			result.setResult_info("");
		} catch (Exception e) {
			e.printStackTrace();
			
			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}
	
	/**
	 * 获取操作列表
	 */
	@RequestMapping(value = "getOperationList")
	public void getOperationList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String functionCode = request.getParameter("functionCode");
			
			List<SysOperation> operationList = functionService.getOperationList(functionCode);
			
			String json = JsonUtil.getJSONFromObjectList(operationList);
			
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
	
	/**
	 * 转向操作新建页面
	 */
	@RequestMapping(value = "OperationAdd")
	public String toOperationAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/function/OperationAdd";
	}
	
	/**
	 * 检查操作编码是否存在
	 */
	@RequestMapping(value = "checkOperationCode")
	public void checkOperationCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String operationCode = request.getParameter("operationCode");
		
		SysOperation so = functionService.getOperationInfo(operationCode);
		
		String responseText = "false";
		
		if (so == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建操作
	 */
	@RequestMapping(value = "addOperation")
	public void addOperation(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysOperation"), "UTF-8");
			
			SysOperation so = (SysOperation)JsonUtil.getObjectFromJSON(json, SysOperation.class);
			
			functionService.addOperation(so);
			
			result.setResult_code("Y");
			result.setResult_info("");
		} catch (Exception e) {
			e.printStackTrace();
			
			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}
	
	/**
	 * 转向操作编辑页面
	 */
	@RequestMapping(value = "OperationEdit")
	public String toOperationEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/function/OperationEdit";
	}
	
	/**
	 * 获取功能信息
	 */
	@RequestMapping(value = "getOperationInfo")
	public void getOperationInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String operationCode = request.getParameter("operationCode");
			
			SysOperation so = functionService.getOperationInfo(operationCode);
			
			String json = JsonUtil.getJSONFromObject(so);
			
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
	
	/**
	 * 编辑操作
	 */
	@RequestMapping(value = "editOperation")
	public void editOperation(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysOperation"), "UTF-8");
			
			SysOperation so = (SysOperation)JsonUtil.getObjectFromJSON(json, SysOperation.class);
			
			functionService.editOperation(so);
			
			result.setResult_code("Y");
			result.setResult_info("");
		} catch (Exception e) {
			e.printStackTrace();
			
			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}
	
}
