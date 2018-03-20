<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%  
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();
	
	String flexCode = request.getParameter("flexCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>弹性域-编辑</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysFlexFieldDefine.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="defineEditForm" name="defineEditForm" class="my-form-content">
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:80px;">
					<label class="control-label" style="margin:5px;padding:0px;">弹性域编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="flex_code" name="flex_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;" readOnly>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">弹性域名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="flex_name" name="flex_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">数据库表</label>
				</td>
				<td class="my-form-table-td-content">
					<select id="table_name" name="table_name" class="form-control input-sm" style="width:180px;padding:5px;float:left;"></select>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">是否有效</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="enabled_flag" name="enabled_flag" type="checkbox">
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
var flexCode = "<%=flexCode%>";

var validator;

$(document).ready(function() {
	validator = $("#defineEditForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			flex_name: {
				required: true,
				maxlength: 100
			},
			table_name: {
				required: true
			},
			description: {
				maxlength: 200
			}
		},
		messages: {
			flex_name: {
				required: "[弹性域名称]不能为空！",
				maxlength: "[弹性域名称]最大长度为100！"
			},
			table_name: {
				required: "[数据库表]不能为空！"
			},
			description: {
				maxlength: "[说明]最大长度为200！"
			}
		}
	});
	
	initTableList();
	
	initFlexFieldDefineInfo();
});

// 初始化数据库表列表
function initTableList(){
	var url = "<%=context%>/app/sys/flexfield/getTableList";
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
			    $("#table_name").html("");
			    $.each(JSON.parse(json.result_info), function(index, d){
			        $("#table_name").append('<option value="' + d + '">' + d + '</option>')
			    });
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
		}
	});
}

function initFlexFieldDefineInfo() {
	var url = "<%=context%>/app/sys/flexfield/getFlexFieldDefineInfo";
	url += "?t=" + new Date();
	url += "&flexCode=" + flexCode;
	
	$.post(url, function(data) {
		var json = JSON.parse(data);
		
		if (json.result_code == "Y") {
			var ffd = JSON.parse(json.result_info);
			dwr.util.setValues(ffd);
			
			if (ffd.enabled_flag == "Y") {
				$("#enabled_flag").prop("checked", true)
			} else if (ffd.enabled_flag == "N") {
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
}

function doEditFlexFieldDefine() {
	var result = false;
	if (validator.form()) {
		var ffd = new SysFlexFieldDefine();
		
		dwr.util.getValues(ffd);
		
		if ($("#enabled_flag").prop("checked")) {
			ffd.enabled_flag = "Y";
		} else {
			ffd.enabled_flag = "N";
		}
		
		var json = JSON.stringify(ffd);
		
		var url = "<%=context%>/app/sys/flexfield/editFlexFieldDefine";
		url += "?t=" + new Date();
		
		var postData = "SysFlexFieldDefine=" + converSpecialCharOfUrl(encodeURI(json));

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