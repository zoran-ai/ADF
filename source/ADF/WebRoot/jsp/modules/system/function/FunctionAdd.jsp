<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%  
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>功能-新建</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysFunction.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="functionAddForm" name="functionAddForm" class="my-form-content">
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">功能编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="function_code" name="function_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">功能名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="function_name" name="function_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">功能URL</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="function_url" name="function_url" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
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
var validator;

$(document).ready(function() {
	validator = $("#functionAddForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			function_code: {
				required: true,
				maxlength: 50,
				isCode: true,
				remote: {
					url:"<%=context%>/app/sys/function/checkFunctionCode?t=" + new Date(),
					type: "post",
					dataType: "json",
					data: {
						functionCode: function(){return $('#function_code').val()}
					}
				}
			},
			function_name: {
				required: true,
				maxlength: 100
			},
			'function_url':{
				required: true,
				maxlength: 500
			},
			description: {
				maxlength: 200
			}
		},
		messages: {
			function_code: {
				required: "[功能编码]不能为空！",
				maxlength: "[功能编码]最大长度为50！",
				remote: "当前功能编码已经存在！"
			},
			function_name: {
				required: "[功能名称]不能为空！",
				maxlength: "[功能名称]最大长度为100！"
			},
			'function_url':{
				required: "[显示顺序]不能为空！",
				maxlength: "[显示顺序]最大长度为500！"
			},
			description: {
				maxlength: "[说明]最大长度为200！"
			}
		}
	});
});

function doAddFunction() {
	var result = false;
	if (validator.form()) {
		var sf = new SysFunction();
		dwr.util.getValues(sf);
		var json = JSON.stringify(sf);
		
		var url = "<%=context%>/app/sys/function/addFunction";
		url += "?t=" + new Date();
		
		var postData = "SysFunction=" + converSpecialCharOfUrl(encodeURI(json));

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