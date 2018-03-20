package org.adf.application.common.list.controller;

import java.net.URLDecoder;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.list.service.ListService;
import org.adf.application.common.mybatis.entity.SysDataDictItem;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/common/list/")
@SuppressWarnings("all")
public class ListController extends ApplicationController {

	@Resource
	private ListService listService;
	
	/**
     * 根据一个数据字典类型获取数据字典项列表
     */
	@RequestMapping(value = "getSingleDataDictItemList")
	public void getSingleDataDictItemList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCode = request.getParameter("typeCode") == null ? "" : request.getParameter("typeCode");
			
			String enabledFlag = request.getParameter("enabledFlag") == null ? "" : request.getParameter("enabledFlag");
			
			List<SysDataDictItem> list = listService.getSingleDataDictItemList(typeCode, enabledFlag);
			
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
     * 根据多个数据字典类型获取数据字典条目列表
     */
	@RequestMapping(value = "getMultiDataDictItemList")
	public void getMultiDataDictItemList(HttpServletRequest request, HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String typeCodes = request.getParameter("typeCodes") == null ? "" : request.getParameter("typeCodes");
			typeCodes = URLDecoder.decode(typeCodes, "UTF-8");
			
			String enabledFlag = request.getParameter("enabledFlag") == null ? "" : request.getParameter("enabledFlag");
			
			List<SysDataDictItem> list = listService.getMultiDataDictItemList(typeCodes, enabledFlag);
			
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
