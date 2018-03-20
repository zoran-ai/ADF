package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysFlexFieldColumn;
import org.adf.application.common.mybatis.entity.SysFlexFieldDefine;
import org.adf.application.common.mybatis.vo.FlexFieldColumnVO;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.common.property.JdbcProperty;
import org.adf.application.modules.system.service.FlexFieldService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/flexfield/")
@SuppressWarnings("all")
public class FlexFieldController extends ApplicationController {
	
	@Resource
	private JdbcProperty jdbcProperty;
	
	@Resource
	private FlexFieldService flexFieldService;
	
	/**
	 * 转向弹性域管理页面
	 */
	@RequestMapping(value = "FlexFieldMgr")
	public String toFlexFieldMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/flexfield/FlexFieldMgr";
	}
	
	/**
	 * 获取弹性域定义列表
	 */
	@RequestMapping(value = "getFlexFieldDefineList")
	public void getFlexFieldDefineList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<SysFlexFieldDefine> ffdList = flexFieldService.getFlexFieldDefineList();
			
			for (SysFlexFieldDefine ffd : ffdList) {
				if ("Y".equals(ffd.getEnabled_flag())) {
					ffd.setEnabled_flag("有效");
				} else if ("N".equals(ffd.getEnabled_flag())) {
					ffd.setEnabled_flag("失效");
				}
			}

			String json = JsonUtil.getJSONFromObjectList(ffdList);
			
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
	 * 转向弹性域定义新建页面
	 */
	@RequestMapping(value = "FlexFieldDefineAdd")
	public String toFlexFieldDefineAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/flexfield/FlexFieldDefineAdd";
	}
	
	/**
	 * 检查数据字典类型编码是否存在
	 */
	@RequestMapping(value = "checkFlexFieldCode")
	public void checkFlexFieldCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flexCode = request.getParameter("flexCode");
		
		SysFlexFieldDefine ddf = flexFieldService.getFlexFieldDefineInfo(flexCode);
		
		String responseText = "false";
		
		if (ddf == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建弹性域定义
	 */
	@RequestMapping(value = "addFlexFieldDefine")
	public void addFlexFieldDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFlexFieldDefine"), "UTF-8");
			
			SysFlexFieldDefine ddf = (SysFlexFieldDefine)JsonUtil.getObjectFromJSON(json, SysFlexFieldDefine.class);
			
			flexFieldService.addFlexFieldDefine(ddf);
			
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
	 * 转向弹性域定义编辑页面
	 */
	@RequestMapping(value = "FlexFieldDefineEdit")
	public String toFlexFieldDefineEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/flexfield/FlexFieldDefineEdit";
	}
	
	/**
	 * 获取弹性域定义信息
	 */
	@RequestMapping(value = "getFlexFieldDefineInfo")
	public void getFlexFieldDefineInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String flexCode = request.getParameter("flexCode");
			
			SysFlexFieldDefine ffd = flexFieldService.getFlexFieldDefineInfo(flexCode);
			
			String json = JsonUtil.getJSONFromObject(ffd);
			
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
	 * 编辑数据字典类型
	 */
	@RequestMapping(value = "editFlexFieldDefine")
	public void editFlexFieldDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFlexFieldDefine"), "UTF-8");
			
			SysFlexFieldDefine ffd = (SysFlexFieldDefine)JsonUtil.getObjectFromJSON(json, SysFlexFieldDefine.class);
			
			flexFieldService.editFlexFieldDefine(ffd);
			
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
	 * 获取弹性域字段列表
	 */
	@RequestMapping(value = "getFlexFieldColumnList")
	public void getFlexFieldColumnList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String flexCode = request.getParameter("flexCode");
			
			List<FlexFieldColumnVO> ffcList = flexFieldService.getFlexFieldColumnList(flexCode);

			String json = JsonUtil.getJSONFromObjectList(ffcList);
			
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
	 * 转向弹性域字段新建页面
	 */
	@RequestMapping(value = "FlexFieldColumnAdd")
	public String toFlexFieldColumnAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/flexfield/FlexFieldColumnAdd";
	}
	
	/**
	 * 检查弹性域字段名称是否存在
	 */
	@RequestMapping(value = "checkFlexFieldColumnName")
	public void checkDataDictTypeAttributeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String flexCode = request.getParameter("flexCode");
		String columnName = request.getParameter("columnName");
		
		FlexFieldColumnVO ffcVO = flexFieldService.getFlexFieldColumnInfo(flexCode, columnName);
		
		String responseText = "false";
		
		if (ffcVO == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建弹性域字段
	 */
	@RequestMapping(value = "addFlexFieldColumn")
	public void addFlexFieldColumn(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFlexFieldColumn"), "UTF-8");
			
			SysFlexFieldColumn ffc = (SysFlexFieldColumn)JsonUtil.getObjectFromJSON(json, SysFlexFieldColumn.class);
			
			flexFieldService.addFlexFieldColumn(ffc);
			
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
	 * 转向弹性域字段编辑页面
	 */
	@RequestMapping(value = "FlexFieldColumnEdit")
	public String toFlexFieldColumnEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/flexfield/FlexFieldColumnEdit";
	}
	
	/**
	 * 获取弹性域字段信息
	 */
	@RequestMapping(value = "getFlexFieldColumnInfo")
	public void getFlexFieldColumnInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String flexCode = request.getParameter("flexCode");
			String columnName = request.getParameter("columnName");
			
			FlexFieldColumnVO ffcVO = flexFieldService.getFlexFieldColumnInfo(flexCode, columnName);
			
			String json = JsonUtil.getJSONFromObject(ffcVO);
			
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
	 * 编辑弹性域字段
	 */
	@RequestMapping(value = "editFlexFieldColumn")
	public void editFlexFieldColumn(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysFlexFieldColumn"), "UTF-8");
			
			SysFlexFieldColumn ffc = (SysFlexFieldColumn)JsonUtil.getObjectFromJSON(json, SysFlexFieldColumn.class);
			
			flexFieldService.editFlexFieldColumn(ffc);
			
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
     * 根据表列表
     */
	@RequestMapping(value = "getTableList")
	public void getTableList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<String> list = flexFieldService.getTableList(jdbcProperty.getDatabase());
			
			String json = JsonUtil.getJSONFromObjectList(list);
			
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
     * 根据Attribute字段列表
     */
	@RequestMapping(value = "getAttributeColumnList")
	public void getAttributeColumnList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String tableName = request.getParameter("tableName");
			
			List<String> list = flexFieldService.getAttributeColumnList(jdbcProperty.getDatabase(), tableName);
			
			String json = JsonUtil.getJSONFromObjectList(list);
			
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
