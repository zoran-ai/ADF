package org.adf.application.common.lov.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.lov.service.LovService;
import org.adf.application.common.mybatis.entity.SysLovColumn;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.application.common.property.JdbcProperty;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/common/lov/")
@SuppressWarnings("all")
public class LovController extends ApplicationController {

	@Resource
	private JdbcProperty jdbcProperty;
	
	@Resource
	private LovService lovService;
	
	/**
	 * 转向值列表通用页面
	 */
	@RequestMapping(value = "Lov")
	public String toLov(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String lovCode = request.getParameter("lovCode");
		
		List<SysLovColumn> slcList = lovService.getLovColumnList(jdbcProperty.getDatabase(), lovCode);
		
		String returnValueColumn = "";
		String returnTextColumn = "";
		
		for (SysLovColumn slc : slcList) {
			if ("Y".equals(slc.getReturn_value_flag())) {
				returnValueColumn = slc.getColumn_name();
			}
			
			if ("Y".equals(slc.getReturn_text_flag())) {
				returnTextColumn = slc.getColumn_name();
			}
		}
		
		request.setAttribute("LovColumnList", slcList);
		request.setAttribute("returnValueColumn", returnValueColumn);
		request.setAttribute("returnTextColumn", returnTextColumn);
		
		return "common/lov/lov";
	}
	
	/**
	 * 获取值列表数据列表
	 */
	@RequestMapping(value = "getLovDataList")
	public void getLovDataList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String lovCode = request.getParameter("lovCode");
			
			String sql = lovService.getLovViewSQL(jdbcProperty.getDatabase(), lovCode);
			
			List<Map<String, Object>> dataList = lovService.getLovDataList(sql);
			
			String json = JsonUtil.getJSONFromObjectList(dataList);
			
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
	 * 获取值列表某一项项显示文本
	 */
	@RequestMapping(value = "getLovDisplayText")
	public void getLovDisplayText(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String text = "";
			
			String lovCode = request.getParameter("lovCode");
			String lovValue = request.getParameter("lovValue");
			
			String returnValueColumn = "";
			String returnTextColumn = "";
			
			List<SysLovColumn> slcList = lovService.getLovColumnList(jdbcProperty.getDatabase(), lovCode);
			
			for (SysLovColumn slc : slcList) {
				if ("Y".equals(slc.getReturn_value_flag())) {
					returnValueColumn = slc.getColumn_name();
				}
				
				if ("Y".equals(slc.getReturn_text_flag())) {
					returnTextColumn = slc.getColumn_name();
				}
			}
			
			String sql = lovService.getLovViewSQL(jdbcProperty.getDatabase(), lovCode);
			
			List<Map<String, Object>> dataList = lovService.getLovDataList(sql);
			
			for (Map<String, Object> map : dataList) {
				String value = String.valueOf(map.get(returnValueColumn));
				
				if (lovValue.equals(value)) {
					text = String.valueOf(map.get(returnTextColumn));
					break;
				}
			}
			
			result.setResult_code("Y");
			result.setResult_info(text);
		} catch (Exception e) {
			e.printStackTrace();

			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}

}
