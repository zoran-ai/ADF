<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();
	
	String typeCode = request.getParameter("typeCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>参数类型-编辑</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysParameterType.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="typeEditForm" name="typeEditForm" class="my-form-content">
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">类型编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="type_code" name="type_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;" readOnly>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">类型名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="type_name" name="type_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
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
var typeCode = "<%=typeCode%>";

var validator;

$(document).ready(function() {
	validator = $("#typeEditForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			type_name: {
				required: true,
				maxlength: 100
			},
			'display_order':{
				required: true,
				maxlength: 5,
				number: true
			},
			description: {
				maxlength: 200
			}
		},
		messages: {
			type_name: {
				required: "[类型名称]不能为空！",
				maxlength: "[类型名称]最大长度为100！"
			},
			'display_order':{
				required: "[显示顺序]不能为空！",
				maxlength: "[显示顺序]最大值为99999！",
				number: "[显示顺序]必须是数字！"
			},
			description: {
				maxlength: "[说明]最大长度为200！"
			}
		}
	});
	
	var url = "<%=context%>/app/sys/parameter/getParameterTypeInfo";
	url += "?t=" + new Date();
	url += "&typeCode=" + typeCode;
	
	$.post(url, function(data) {
		var json = JSON.parse(data);
		
		if (json.result_code == "Y") {
			var pt = JSON.parse(json.result_info);
			dwr.util.setValues(pt);
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

function doEditParameterType() {
	var result = false;
	if (validator.form()) {
		var pt = new SysParameterType();
		dwr.util.getValues(pt);
		var json = JSON.stringify(pt);
		
		var url = "<%=context%>/app/sys/parameter/editParameterType";
		url += "?t=" + new Date();
		
		var postData = "SysParameterType=" + converSpecialCharOfUrl(encodeURI(json));

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