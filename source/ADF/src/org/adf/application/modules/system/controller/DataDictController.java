package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.entity.SysDataDictType;
import org.adf.application.common.mybatis.entity.SysDataDictTypeAttribute;
import org.adf.application.common.mybatis.vo.DataDictItemAttributeVO;
import org.adf.application.common.mybatis.vo.DataDictTypeAttributeVO;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.modules.system.service.DataDictService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/datadict/")
@SuppressWarnings("all")
public class DataDictController extends ApplicationController {

	@Resource
	private DataDictService dataDictService;
	
	/**
	 * 转向数据字典管理页面
	 */
	@RequestMapping(value = "DataDictMgr")
	public String toDataDictMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datadict/DataDictMgr";
	}
	
	/**
	 * 获取数据字典类型列表
	 */
	@RequestMapping(value = "getDataDictTypeList")
	public void getDataDictTypeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<SysDataDictType> ddtList = dataDictService.getDataDictTypeList();

			String json = JsonUtil.getJSONFromObjectList(ddtList);
			
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
	 * 转向数据字典类型新建页面
	 */
	@RequestMapping(value = "DataDictTypeAdd")
	public String toDataDictTypeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictTypeAdd";
	}
	
	/**
	 * 检查数据字典类型编码是否存在
	 */
	@RequestMapping(value = "checkDataDictTypeCode")
	public void checkDataDictTypeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String typeCode = request.getParameter("typeCode");
		
		SysDataDictType ddt = dataDictService.getDataDictTypeInfo(typeCode);
		
		String responseText = "false";
		
		if (ddt == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据字典类型
	 */
	@RequestMapping(value = "addDataDictType")
	public void addDataDictType(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictType"), "UTF-8");
			
			SysDataDictType ddt = (SysDataDictType)JsonUtil.getObjectFromJSON(json, SysDataDictType.class);
			
			dataDictService.addDataDictType(ddt);
			
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
	 * 转向数据字典类型编辑页面
	 */
	@RequestMapping(value = "DataDictTypeEdit")
	public String toDataDictTypeEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictTypeEdit";
	}
	
	/**
	 * 获取数据字典类型信息
	 */
	@RequestMapping(value = "getDataDictTypeInfo")
	public void getDataDictTypeInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			
			SysDataDictType ddt = dataDictService.getDataDictTypeInfo(typeCode);
			
			String json = JsonUtil.getJSONFromObject(ddt);
			
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
	@RequestMapping(value = "editDataDictType")
	public void editDataDictType(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictType"), "UTF-8");
			
			SysDataDictType ddt = (SysDataDictType)JsonUtil.getObjectFromJSON(json, SysDataDictType.class);
			
			dataDictService.editDataDictType(ddt);
			
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
	 * 获取数据字典项列表
	 */
	@RequestMapping(value = "getDataDictItemList")
	public void getDataDictItemList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode") == null ? "" : request.getParameter("typeCode");
			
			typeCode = URLDecoder.decode(typeCode, "UTF-8");
			
			List<SysDataDictItem> ddiList = dataDictService.getDataDictItemList(typeCode);
			
			for (SysDataDictItem ddi : ddiList) {
				if ("Y".equals(ddi.getEnabled_flag())) {
					ddi.setEnabled_flag("有效");
				} else if ("N".equals(ddi.getEnabled_flag())) {
					ddi.setEnabled_flag("失效");
				}
			}
			
			String json = JsonUtil.getJSONFromObjectList(ddiList);
			
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
	 * 转向数据字典项新建页面
	 */
	@RequestMapping(value = "DataDictItemAdd")
	public String toDataDictItemAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictItemAdd";
	}
	
	/**
	 * 检查数据字典项编码是否存在
	 */
	@RequestMapping(value = "checkDataDictItemCode")
	public void checkDataDictItemCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String typeCode = request.getParameter("typeCode");
		String itemCode = request.getParameter("itemCode");
		
		SysDataDictItem ddi = dataDictService.getDataDictItemInfo(typeCode, itemCode);
		
		String responseText = "false";
		
		if (ddi == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据字典条目
	 */
	@RequestMapping(value = "addDataDictItem")
	public void addDataDictItem(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictItem"), "UTF-8");
			SysDataDictItem ddi = (SysDataDictItem)JsonUtil.getObjectFromJSON(json, SysDataDictItem.class);
			dataDictService.addDataDictItem(ddi);
			
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
	 * 转向数据字典项编辑页面
	 */
	@RequestMapping(value = "DataDictItemEdit")
	public String toDataDictItemEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictItemEdit";
	}
	
	/**
	 * 获取数据字典项信息
	 */
	@RequestMapping(value = "getDataDictItemInfo")
	public void getDataDictItemInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			String itemCode = request.getParameter("itemCode");
			
			SysDataDictItem ddi = dataDictService.getDataDictItemInfo(typeCode, itemCode);
			String json = JsonUtil.getJSONFromObject(ddi);
			
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
	 * 编辑数据字典项
	 */
	@RequestMapping(value = "editDataDictItem")
	public void editDataDictItem(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictItem"), "UTF-8");
			SysDataDictItem ddi = (SysDataDictItem)JsonUtil.getObjectFromJSON(json, SysDataDictItem.class);
			dataDictService.editDataDictItem(ddi);
			
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
	 * 转向数据字典类型扩展属性页面
	 */
	@RequestMapping(value = "DataDictTypeAttributeConfig")
	public String toDataDictTypeAttributeConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datadict/DataDictTypeAttributeConfig";
	}
	
	/**
	 * 获取数据字典类型属性列表
	 */
	@RequestMapping(value = "getDataDictTypeAttributeList")
	public void getDataDictTypeAttributeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			
			List<DataDictTypeAttributeVO> ddtaList = dataDictService.getDataDictTypeAttributeList(typeCode);

			String json = JsonUtil.getJSONFromObjectList(ddtaList);
			
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
	 * 转向数据字典类型属性新建页面
	 */
	@RequestMapping(value = "DataDictTypeAttributeAdd")
	public String toDataDictTypeAttributeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictTypeAttributeAdd";
	}
	
	/**
	 * 检查数据字典类型属性编码是否存在
	 */
	@RequestMapping(value = "checkDataDictTypeAttributeCode")
	public void checkDataDictTypeAttributeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String typeCode = request.getParameter("typeCode");
		String attributeCode = request.getParameter("attributeCode");
		
		DataDictTypeAttributeVO ddtaVO = dataDictService.getDataDictTypeAttributeInfo(typeCode, attributeCode);
		
		String responseText = "false";
		
		if (ddtaVO == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据字典类型属性
	 */
	@RequestMapping(value = "addDataDictTypeAttribute")
	public void addDataDictTypeAttribute(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictTypeAttribute"), "UTF-8");
			
			SysDataDictTypeAttribute ddta = (SysDataDictTypeAttribute)JsonUtil.getObjectFromJSON(json, SysDataDictTypeAttribute.class);
			
			dataDictService.addDataDictTypeAttribute(ddta);
			
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
	 * 转向数据字典类型属性编辑页面
	 */
	@RequestMapping(value = "DataDictTypeAttributeEdit")
	public String toDataDictTypeAttributeEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datadict/DataDictTypeAttributeEdit";
	}
	
	/**
	 * 获取数据字典类型属性信息
	 */
	@RequestMapping(value = "getDataDictTypeAttributeInfo")
	public void getDataDictTypeAttributeInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			String attributeCode = request.getParameter("attributeCode");
			
			DataDictTypeAttributeVO ddtaVO = dataDictService.getDataDictTypeAttributeInfo(typeCode, attributeCode);
			
			String json = JsonUtil.getJSONFromObject(ddtaVO);
			
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
	 * 编辑数据字典类型属性
	 */
	@RequestMapping(value = "editDataDictTypeAttribute")
	public void editDataDictTypeAttribute(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataDictTypeAttribute"), "UTF-8");
			
			SysDataDictTypeAttribute ddta = (SysDataDictTypeAttribute)JsonUtil.getObjectFromJSON(json, SysDataDictTypeAttribute.class);
			
			dataDictService.editDataDictTypeAttribute(ddta);
			
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
	 * 转向数据字典项扩展属性页面
	 */
	@RequestMapping(value = "DataDictItemAttributeConfig")
	public String DataDictItemAttributeConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datadict/DataDictItemAttributeConfig";
	}
	
	/**
	 * 获取数据字典项扩展列表
	 */
	@RequestMapping(value = "getDataDictItemAttributeList")
	public void getDataDictItemAttributeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode");
			String itemCode = request.getParameter("itemCode");
			
			List<DataDictItemAttributeVO> ddiaList = dataDictService.getDataDictItemAttributeList(typeCode, itemCode);

			String json = JsonUtil.getJSONFromObjectList(ddiaList);
			
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
	 * 保存数据字典项扩展属性信息
	 */
	@RequestMapping(value = "saveDataDictItemAttributes")
	public void saveDataDictItemAttributes(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("ddiaVO"), "UTF-8");
			
			List<DataDictItemAttributeVO> ddiaVOList = JsonUtil.getListFromJSON(json, DataDictItemAttributeVO.class);
			
			dataDictService.saveDataDictItemAttributes(ddiaVOList);
			
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
