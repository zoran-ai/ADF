package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysParameterDefine;
import org.adf.application.common.mybatis.entity.SysParameterType;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.common.mybatis.vo.SysParameterDefineVO;
import org.adf.application.modules.system.service.ParameterService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/parameter/")
@SuppressWarnings("all")
public class ParameterController extends ApplicationController {
	
	@Resource
	private ParameterService parameterService;
	
	/**
	 * 转向系统参数管理页面
	 */
	@RequestMapping(value = "ParameterMgr")
	public String toParameterMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/parameter/ParameterMgr";
	}
	
	/**
	 * 获取参数类型列表
	 */
	@RequestMapping(value = "getParameterTypeList")
	public void getParameterTypeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<SysParameterType> ptList = parameterService.getParameterTypeList();

			String json = JsonUtil.getJSONFromObjectList(ptList);
			
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
	 * 转向参数类型新建页面
	 */
	@RequestMapping(value = "ParameterTypeAdd")
	public String toParameterTypeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/parameter/ParameterTypeAdd";
	}
	
	/**
	 * 检查参数类型编码是否存在
	 */
	@RequestMapping(value = "checkParameterTypeCode")
	public void checkParameterTypeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String typeCode = request.getParameter("typeCode");
		
		SysParameterType pt = parameterService.getParameterTypeInfo(typeCode);
		
		String responseText = "false";
		
		if (pt == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建参数类型
	 */
	@RequestMapping(value = "addParameterType")
	public void addParameterType(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysParameterType"), "UTF-8");
			
			SysParameterType pt = (SysParameterType)JsonUtil.getObjectFromJSON(json, SysParameterType.class);
			
			parameterService.addParameterType(pt);
			
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
	 * 转向参数类型编辑页面
	 */
	@RequestMapping(value = "ParameterTypeEdit")
	public String toParameterTypeEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/parameter/ParameterTypeEdit";
	}
	
	/**
	 * 获取参数类型信息
	 */
	@RequestMapping(value = "getParameterTypeInfo")
	public void getParameterTypeInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			
			SysParameterType pt = parameterService.getParameterTypeInfo(typeCode);
			
			String json = JsonUtil.getJSONFromObject(pt);
			
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
	 * 编辑参数类型
	 */
	@RequestMapping(value = "editParameterType")
	public void editParameterType(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysParameterType"), "UTF-8");
			
			SysParameterType ddt = (SysParameterType)JsonUtil.getObjectFromJSON(json, SysParameterType.class);
			
			parameterService.editParameterType(ddt);
			
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
	 * 获取参数列表
	 */
	@RequestMapping(value = "getParameterDefineList")
	public void getParameterDefineList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			
			List<SysParameterDefineVO> pdVOList = parameterService.getParameterDefineList(typeCode);

			String json = JsonUtil.getJSONFromObjectList(pdVOList);
			
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
	 * 转向参数新建页面
	 */
	@RequestMapping(value = "ParameterDefineAdd")
	public String toDataDictTypeAttributeConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/parameter/ParameterDefineAdd";
	}
	
	/**
	 * 检查参数编码是否存在
	 */
	@RequestMapping(value = "checkParameterCode")
	public void checkParameterCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String parameterCode = request.getParameter("parameterCode");
		
		SysParameterDefineVO pdVO = parameterService.getParameterDefineInfo(parameterCode);
		
		String responseText = "false";
		
		if (pdVO == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建参数
	 */
	@RequestMapping(value = "addParameterDefine")
	public void addParameterDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysParameterDefine"), "UTF-8");
			
			SysParameterDefine pd = (SysParameterDefine)JsonUtil.getObjectFromJSON(json, SysParameterDefine.class);
			
			parameterService.addParameterDefine(pd);
			
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
	 * 转向参数编辑页面
	 */
	@RequestMapping(value = "ParameterDefineEdit")
	public String toParameterDefineEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/parameter/ParameterDefineEdit";
	}
	
	/**
	 * 获取参数信息
	 */
	@RequestMapping(value = "getParameterDefineInfo")
	public void getParameterDefineInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String parameterCode = request.getParameter("parameterCode");
			
			SysParameterDefineVO pdVO = parameterService.getParameterDefineInfo(parameterCode);
			
			String json = JsonUtil.getJSONFromObject(pdVO);
			
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
	 * 编辑参数
	 */
	@RequestMapping(value = "editParameterDefine")
	public void editParameterDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysParameterDefine"), "UTF-8");
			
			SysParameterDefine pd = (SysParameterDefine)JsonUtil.getObjectFromJSON(json, SysParameterDefine.class);
			
			parameterService.editParameterDefine(pd);
			
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
	 * 转向系统设置页面
	 */
	@RequestMapping(value = "ParameterConfig")
	public String toParameterConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/parameter/ParameterConfig";
	}
	
	/**
	 * 转向系统设置明细页面
	 */
	@RequestMapping(value = "ParameterConfigDetail")
	public String toParameterConfigDetail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/parameter/ParameterConfigDetail";
	}
	
	/**
	 * 获取参数配置列表
	 */
	@RequestMapping(value = "getParameterConfigList")
	public void getParameterConfigList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			
			List<SysParameterDefineVO> pdVOList = parameterService.getParameterConfigList(typeCode);

			String json = JsonUtil.getJSONFromObjectList(pdVOList);
			
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
	 * 保存参数设置
	 */
	@RequestMapping(value = "saveParameterConfig")
	public void saveParameterConfig(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("pdVO"), "UTF-8");
			
			List<SysParameterDefineVO> pdVOList = JsonUtil.getListFromJSON(json, SysParameterDefineVO.class);
			
			parameterService.saveParameterConfig(pdVOList);
			
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
