package org.adf.application.modules.system.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.mybatis.entity.SysDataStructAttribute;
import org.adf.application.common.mybatis.entity.SysDataStructDefine;
import org.adf.application.common.mybatis.entity.SysDataStructNode;
import org.adf.application.common.mybatis.vo.DataStructAttributeVO;
import org.adf.application.common.mybatis.vo.DataStructDefineVO;
import org.adf.application.common.mybatis.vo.DataStructNodeAttributeVO;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.modules.system.service.DataStructService;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/sys/datastruct/")
@SuppressWarnings("all")
public class DataStructController extends ApplicationController {

	@Resource
	private DataStructService dataStructService;
	
	/**
	 * 转向数据结构管理页面
	 */
	@RequestMapping(value = "DataStructMgr")
	public String toDataStructMgr(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datastruct/DataStructMgr";
	}
	
	/**
	 * 获取数据结构定义列表
	 */
	@RequestMapping(value = "getDataStructDefineList")
	public void getDataStructDefineList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			List<DataStructDefineVO> ddtList = dataStructService.getDataStructDefineList();

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
	 * 转向数据结构定义新建页面
	 */
	@RequestMapping(value = "DataStructDefineAdd")
	public String toDataStructDefineAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructDefineAdd";
	}
	
	/**
	 * 检查数据结构编码是否存在
	 */
	@RequestMapping(value = "checkDataStructCode")
	public void checkDataStructCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String structCode = request.getParameter("structCode");
		
		SysDataStructDefine dsd = dataStructService.getDataStructDefineInfo(structCode);
		
		String responseText = "false";
		
		if (dsd == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据结构
	 */
	@RequestMapping(value = "addDataStructDefine")
	public void addDataStructDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructDefine"), "UTF-8");
			
			SysDataStructDefine dsd = (SysDataStructDefine)JsonUtil.getObjectFromJSON(json, SysDataStructDefine.class);
			
			dataStructService.addDataStructDefine(dsd);
			
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
	 * 转向数据结构定义编辑页面
	 */
	@RequestMapping(value = "DataStructDefineEdit")
	public String toDataStructDefineEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructDefineEdit";
	}
	
	/**
	 * 获取数据结构定义信息
	 */
	@RequestMapping(value = "getDataStructDefineInfo")
	public void getDataStructDefineInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			
			SysDataStructDefine dsd = dataStructService.getDataStructDefineInfo(structCode);
			
			String json = JsonUtil.getJSONFromObject(dsd);
			
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
	 * 编辑数据结构
	 */
	@RequestMapping(value = "editDataStructDefine")
	public void editDataStructDefine(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructDefine"), "UTF-8");
			
			SysDataStructDefine dsd = (SysDataStructDefine)JsonUtil.getObjectFromJSON(json, SysDataStructDefine.class);
			
			dataStructService.editDataStructDefine(dsd);
			
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
	 * 转向数据结构扩展属性页面
	 */
	@RequestMapping(value = "DataStructAttributeConfig")
	public String toDataDictTypeAttributeConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datastruct/DataStructAttributeConfig";
	}
	
	/**
	 * 获取数据结构属性列表
	 */
	@RequestMapping(value = "getDataStructAttributeList")
	public void getDataStructAttributeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			
			List<DataStructAttributeVO> ddtaList = dataStructService.getDataStructAttributeList(structCode);

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
	 * 转向数据结构属性新建页面
	 */
	@RequestMapping(value = "DataStructAttributeAdd")
	public String toDataStructAttributeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructAttributeAdd";
	}
	
	/**
	 * 检查数据结构属性编码是否存在
	 */
	@RequestMapping(value = "checkDataStructAttributeCode")
	public void checkDataStructAttributeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String structCode = request.getParameter("structCode");
		String attributeCode = request.getParameter("attributeCode");
		
		DataStructAttributeVO dsaVO = dataStructService.getDataStructAttributeInfo(structCode, attributeCode);
		
		String responseText = "false";
		
		if (dsaVO == null) {
			responseText = "true";
		} else {
			responseText = "false";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据结构属性
	 */
	@RequestMapping(value = "addDataStructAttribute")
	public void addDataStructAttribute(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructAttribute"), "UTF-8");
			
			SysDataStructAttribute dsa = (SysDataStructAttribute)JsonUtil.getObjectFromJSON(json, SysDataStructAttribute.class);
			
			dataStructService.addDataStructAttribute(dsa);
			
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
	 * 转向数据结构属性编辑页面
	 */
	@RequestMapping(value = "DataStructAttributeEdit")
	public String toDataStructAttributeEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructAttributeEdit";
	}
	
	/**
	 * 获取数据结构属性信息
	 */
	@RequestMapping(value = "getDataStructAttributeInfo")
	public void getDataStructAttributeInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			String attributeCode = request.getParameter("attributeCode");
			
			DataStructAttributeVO dsaVO = dataStructService.getDataStructAttributeInfo(structCode, attributeCode);
			
			String json = JsonUtil.getJSONFromObject(dsaVO);
			
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
	 * 编辑数据结构属性
	 */
	@RequestMapping(value = "editDataStructAttribute")
	public void editDataStructAttribute(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructAttribute"), "UTF-8");
			
			SysDataStructAttribute dsa = (SysDataStructAttribute)JsonUtil.getObjectFromJSON(json, SysDataStructAttribute.class);
			
			dataStructService.editDataStructAttribute(dsa);
			
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
	 * 获取数据结构节点树
	 */
	@RequestMapping(value = "getDataStructNodeTree")
	public void getDataStructNodeTree(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			
			String json = dataStructService.getDataStructNodeTree(structCode);

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
	 * 转向数据结构节点新建页面
	 */
	@RequestMapping(value = "DataStructNodeAdd")
	public String toDataStructNodeAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructNodeAdd";
	}
	
	/**
	 * 检查数据结构节点编码是否存在
	 */
	@RequestMapping(value = "checkDataStructNodeCode")
	public void checkDataStructNodeCode(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String structCode = request.getParameter("structCode");
		String nodeCode = request.getParameter("nodeCode");
		String nodeCodeRule = request.getParameter("nodeCodeRule");
		
		String responseText = "false";
		
		if ("manual".equals(nodeCodeRule)) {
			SysDataStructNode dsn = dataStructService.getDataStructNodeInfo(structCode, nodeCode);
			
			if (dsn == null) {
				responseText = "true";
			} else {
				responseText = "false";
			}
		} else if ("auto".equals(nodeCodeRule)) {
			responseText = "true";
		}
		
		this.outputResponseData(response, EnumContentType.TEXT.toString(), responseText);
	}
	
	/**
	 * 新建数据结构节点
	 */
	@RequestMapping(value = "addDataStructNode")
	public void addDataStructNode(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructNode"), "UTF-8");
			
			SysDataStructNode dsn = (SysDataStructNode)JsonUtil.getObjectFromJSON(json, SysDataStructNode.class);
			
			dataStructService.addDataStructNode(dsn);
			
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
	 * 转向数据结构节点编辑页面
	 */
	@RequestMapping(value = "DataStructNodeEdit")
	public String toDataStructNodeEdit(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "modules/system/datastruct/DataStructNodeEdit";
	}
	
	/**
	 * 获取数据结构节点信息
	 */
	@RequestMapping(value = "getDataStructNodeInfo")
	public void getDataStructNodeInfo(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			String nodeCode = request.getParameter("nodeCode");
			
			SysDataStructNode dsn = dataStructService.getDataStructNodeInfo(structCode, nodeCode);
			
			String json = JsonUtil.getJSONFromObject(dsn);
			
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
	 * 编辑数据结构节点
	 */
	@RequestMapping(value = "editDataStructNode")
	public void editDataStructNode(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("SysDataStructNode"), "UTF-8");
			
			SysDataStructNode dsn = (SysDataStructNode)JsonUtil.getObjectFromJSON(json, SysDataStructNode.class);
			
			dataStructService.editDataStructNode(dsn);
			
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
	 * 转向数据结构节点扩展属性页面
	 */
	@RequestMapping(value = "DataStructNodeAttributeConfig")
	public String toDataStructNodeAttributeConfig(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "/modules/system/datastruct/DataStructNodeAttributeConfig";
	}
	
	/**
	 * 获取数据结构节点扩展列表
	 */
	@RequestMapping(value = "getDataStructNodeAttributeList")
	public void getDataStructNodeAttributeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			String nodeCode = request.getParameter("nodeCode");
			
			List<DataStructNodeAttributeVO> dsnaList = dataStructService.getDataStructNodeAttributeList(structCode, nodeCode);

			String json = JsonUtil.getJSONFromObjectList(dsnaList);
			
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
	 * 保存数据结构节点扩展属性信息
	 */
	@RequestMapping(value = "saveDataStructNodeAttributes")
	public void saveDataStructNodeAttributes(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String json = URLDecoder.decode(request.getParameter("dsnaVO"), "UTF-8");
			
			List<DataStructNodeAttributeVO> dsnaVOList = JsonUtil.getListFromJSON(json, DataStructNodeAttributeVO.class);
			
			dataStructService.saveDataStructNodeAttributes(dsnaVOList);
			
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
