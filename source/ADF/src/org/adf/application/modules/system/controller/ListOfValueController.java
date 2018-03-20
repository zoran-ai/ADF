package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.entity.SysLovDefine;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.common.property.JdbcProperty;
import org.adf.application.modules.system.service.ListOfValueService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/lov/")
@SuppressWarnings("all")
public class ListOfValueController extends ApplicationController {

	@Resource
	private JdbcProperty jdbcProperty;
	
	@Resource
	private ListOfValueService listOfValueService;
	
	/**
	 * 转向值列表管理页面
	 */
	@RequestMapping(value = "LovMgr")
	public String toLovMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/lov/LovMgr";
	}
	
	/**
	 * 获取值列表定义列表
	 */
	@RequestMapping(value = "getLovDefineList")
	public void getLovDefineList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<SysLovDefine> lovList = listOfValueService.getLovDefineList();

			String json = JsonUtil.getJSONFromObjectList(lovList);
			
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
	 * 转向值列表配置页面
	 */
	@RequestMapping(value = "LovConfig")
	public String toLovConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/lov/LovConfig";
	}
	
	/**
	 * 获取值列表视图列表
	 */
	@RequestMapping(value = "getLovViewList")
	public void getLovViewList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<String> lovList = listOfValueService.getLovViewList(jdbcProperty.getDatabase());

			String json = JsonUtil.getJSONFromObjectList(lovList);
			
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
	 * 获取值列表定义信息
	 */
	@RequestMapping(value = "getLovDefineInfo")
	public void getLovDefineInfo(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String lovCode = request.getParameter("lovCode");
			
			SysLovDefine sld = listOfValueService.getLovDefineInfo(lovCode);

			String json = JsonUtil.getJSONFromObject(sld);
			
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
	 * 获取值列表字段信息
	 */
	@RequestMapping(value = "getLovColumnList")
	public void getLovColumnList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String viewName = request.getParameter("viewName");
			String lovCode = request.getParameter("lovCode");
			
			List<SysLovColumn> slcList = null;
			
			if (lovCode != null && !"".equals(lovCode)) {
				slcList = listOfValueService.getLovColumnList(jdbcProperty.getDatabase(), viewName, lovCode);
			} else {
				slcList = listOfValueService.getViewColumnList(jdbcProperty.getDatabase(), viewName);
			}

			String json = JsonUtil.getJSONFromObjectList(slcList);
			
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
	 * 检查数据字典类型编码是否存在
	 */
	@RequestMapping(value = "checkLovCode")
	public void checkLovCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String lovCode = request.getParameter("lovCode");
		String operationType = request.getParameter("operationType");
		
		String responseText = "true";
		
		if ("add".equals(operationType)) {
			SysLovDefine sld = listOfValueService.getLovDefineInfo(lovCode);
			
			if (sld == null) {
				responseText = "true";
			} else {
				responseText = "false";
			}
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 保存值列表信息
	 */
	@RequestMapping(value = "saveLovInfo")
	public void saveLovInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String sldJson = URLDecoder.decode(request.getParameter("SysLovDefine"), "UTF-8");
			String slcJson = URLDecoder.decode(request.getParameter("SysLovColumn"), "UTF-8");
			
			SysLovDefine sld = (SysLovDefine)JsonUtil.getObjectFromJSON(sldJson, SysLovDefine.class);
			
			List<SysLovColumn> slcList = JsonUtil.getListFromJSON(slcJson, SysLovColumn.class);
			
			listOfValueService.saveLovInfo(sld, slcList);
			
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
