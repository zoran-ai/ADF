package org.adf.application.common.lot.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.adf.application.common.enumeration.EnumContentType;
import org.adf.application.common.lot.service.LotService;
import org.adf.application.common.mybatis.vo.OperationResult;
import org.adf.framework.util.json.JsonUtil;
import org.adf.framework.util.tree.TreeNode;
import org.adf.framework.web.controller.ApplicationController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/app/common/lot/")
@SuppressWarnings("all")
public class LotController extends ApplicationController {

	@Resource
	private LotService lotService;
	
	/**
	 * 转向树列表页面
	 */
	@RequestMapping(value = "Lot")
	public String toLOT(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return "common/lot/lot";
	}
	
	/**
	 * 获取树列表
	 */
	@RequestMapping(value = "getTreeList")
	public void getTreeList(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			
			TreeNode node = lotService.getTreeList(structCode);

			String json = JsonUtil.getJSONFromObject(node);
			
			json = json.replaceAll("\"nodes\":\\[\\],", "");
			
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
	 * 获取树列表节点显示文本
	 */
	@RequestMapping(value = "getTreeDisplayText")
	public void getTreeDisplayText(HttpServletRequest request,HttpServletResponse response) {
		OperationResult result = new OperationResult();
		try {
			String structCode = request.getParameter("structCode");
			String nodeCode = request.getParameter("nodeCode");
			
			String nodeName = lotService.getTreeDisplayText(structCode, nodeCode);
			
			result.setResult_code("Y");
			result.setResult_info(nodeName);
		} catch (Exception e) {
			e.printStackTrace();

			result.setResult_code("N");
			result.setResult_info(this.getExceptionMessage(e));
		} finally {
			this.outputResponseData(response, EnumContentType.TEXT.toString(), JsonUtil.getJSONFromObject(result));
		}
	}

}
