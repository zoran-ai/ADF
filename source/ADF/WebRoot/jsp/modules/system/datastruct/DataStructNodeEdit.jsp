<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();
	
	String structCode = request.getParameter("structCode");
	String nodeCode = request.getParameter("nodeCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>数据结构节点-编辑</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysDataStructNode.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="structNodeEditForm" name="structNodeEditForm" class="my-form-content">
		<input type="hidden" id="struct_code" name="struct_code">
		<input type="hidden" id="parent_node_code" name="parent_node_code">
		
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">节点编码</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="node_code" name="node_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;" readOnly>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">节点名称</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="node_name" name="node_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">显示顺序</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="display_order" name="display_order" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">是否有效</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="enabled_flag" name="enabled_flag" type="checkbox" checked>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">说明</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="description" name="description" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

<script type="text/javascript">
var structCode = "<%=structCode%>";
var nodeCode = "<%=nodeCode%>";

var validator;

$(document).ready(function() {
	validator = $("#structNodeEditForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			node_name: {
				required: true,
				maxlength: 100
			},
			'display_order':{
				maxlength: 5,
				number: true
			},
			'description':{
				maxlength: 200
			}
		},
		messages: {
			node_name: {
				required: "[节点名称]不能为空！",
				maxlength: "[节点名称]最大长度为100！"
			},
			'display_order':{
				maxlength: "[显示顺序]最大值为99999！",
				number: "[显示顺序]必须是数字！"
			},
			'description':{
				maxlength: "[说明]最大长度为200！"
			}
		}
	});
	
	var url = "<%=context%>/app/sys/datastruct/getDataStructNodeInfo";
	url += "?t=" + new Date();
	url += "&structCode=" + structCode;
	url += "&nodeCode=" + nodeCode;
	
	$.post(url, function(data) {
		var json = JSON.parse(data);
		
		if (json.result_code == "Y") {
			var dsn = JSON.parse(json.result_info);
			
			dwr.util.setValues(dsn);
			
			if (dsn.enabled_flag == "Y") {
				$("#enabled_flag").prop("checked", true)
			} else if (dsn.enabled_flag == "N") {
				$("#enabled_flag").prop("checked", false)
			}
		} else if (json.result_code == "N") {
			window.top.bootbox.dialog({
				title: "错误信息",
				message: "数据加载失败！" + "<br><br>" + json.result_info,
				size: "middle",
				buttons: {
					cancelType: {
			      		label: "确定",
			      		className: "btn-<%=bootstrapSkin%>",
			      		callback: function() {
			      			return true;
			      		}
					}
				}
			});
		}
	});
});

function doEditDataStructNode() {
	var result = false;
	if (validator.form()) {
		var dsn = new SysDataStructNode();
		
		dwr.util.getValues(dsn);
		
		if ($("#enabled_flag").prop("checked")) {
			dsn.enabled_flag = "Y";
		} else {
			dsn.enabled_flag = "N";
		}
		
		var json = JSON.stringify(dsn);
		
		var url = "<%=context%>/app/sys/datastruct/editDataStructNode";
		url += "?t=" + new Date();
		
		var postData = "SysDataStructNode=" + converSpecialCharOfUrl(encodeURI(json));

		$.ajax({
			type: "post",
		    url: url,
		    dataType: "text",
		    data: postData,
		    async: false,
		    success: function(text, status){
				var json = JSON.parse(text);
				
				if (json.result_code == "Y") {
					result = true;
					window.top.bootbox.dialog({
						title: "提示信息",
						message: "保存成功！",
						size: "small",
						buttons: {
							cancelType: {
					      		label: "确定",
					      		className: "btn-<%=bootstrapSkin%>",
					      		callback: function() {
					      			return true;
					      		}
							}
						}
					});
				} else if (json.result_code == "N") {
					result = false;
					
					window.top.bootbox.dialog({
						title: "错误信息",
						message: "保存失败！" + "<br><br>" + json.result_info,
						size: "middle",
						buttons: {
							cancelType: {
					      		label: "确定",
					      		className: "btn-<%=bootstrapSkin%>",
					      		callback: function() {
					      			return true;
					      		}
							}
						}
					});
				}
		    }
		});
	}
	return result;
}
</script>