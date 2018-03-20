<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();

	String operationType = request.getParameter("operationType");
	
	String lovCode = request.getParameter("lovCode") == null ? "" : request.getParameter("lovCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>值列表</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>

	<script type='text/javascript' src='<%=context%>/js/json/model/SysLovDefine.js'></script>
	<script type='text/javascript' src='<%=context%>/js/json/model/SysLovColumn.js'></script>
	
	<!-- bootstrap-table -->
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-table/css/bootstrap-table.css">
		
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/js/bootstrap-table.js"></script>
	
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/local/bootstrap-table-zh-CN.js"></script>
		
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/extensions/editable/bootstrap-table-editable.js"></script>
	
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-table/extensions/editable/bootstrap-editable.css">
		
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/extensions/editable/bootstrap-editable.js"></script>
		
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="lovConfigForm" name="lovConfigForm" class="my-form-content">
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:80px;">
					<label class="control-label" style="margin:5px;padding:0px;">值列表编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="lov_code" name="lov_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
				
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">视图</label>
				</td>
				<td class="my-form-table-td-content">
					<select id="view_name" name="view_name" class="form-control input-sm" style="width:180px;padding:5px;float:left;" onchange="getLovColumnList();"></select>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label" style="width:80px;">
					<label class="control-label" style="margin:5px;padding:0px;">值列表名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="lov_name" name="lov_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
				
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">说明</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="description" name="description" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
		</table>
	</form>

	<div class="container-fluid" style="margin:0px;padding:0px;">
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding-left:5px;padding-right:5px;">
			    <table id="lovColumnTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-striped="true"
			           data-height="315">
			        <thead>
			           	<tr>
			                <th data-field="column_name" data-halign="center" data-align="left">列名称</th>
			                <th data-field="column_title" data-halign="center" data-align="left" data-editable="true">列标题</th>
			                <th data-field="display_flag" data-halign="center" data-align="center">是否显示</th>
			                <th data-field="return_value_flag" data-halign="center" data-align="center">返回值列</th>
			                <th data-field="return_text_flag" data-halign="center" data-align="center">返回文本列</th>
			            </tr>
			        </thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var operationType = "<%=operationType%>";
var lovCode = "<%=lovCode%>";

var validator;

$(document).ready(function() {
	validator = $("#lovConfigForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			lov_code: {
				required: true,
				maxlength: 50,
				isCode: true,
				remote: {
					url:"<%=context%>/app/sys/lov/checkLovCode?t=" + new Date(),
					type: "post",
					dataType: "json",
					data: {
						lovCode: function(){return $('#lov_code').val()},
						operationType: operationType
					}
				}
			},
			lov_name: {
				required: true,
				maxlength: 100
			},
			'description':{
				maxlength: 200
			}
		},
		messages: {
			lov_code: {
				required: "[值列表编码]不能为空！",
				maxlength: "[值列表编码]最大长度为50！",
				remote: "当前值列表编码已经存在！"
			},
			lov_name: {
				required: "[值列表名称]不能为空！",
				maxlength: "[值列表名称]最大长度为100！"
			},
			'description':{
				maxlength: "[说明]最大值为200！"
			}
		}
	});
	
	$("#lovColumnTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
    });
	
	if (operationType == "edit") {
		$("#lov_code").attr("readonly","readonly");
		$("#view_name").attr("disabled",true);
	}
	
	getLovViewList();
	
	getLovDefineInfo();
	
	getLovColumnList();
});


// 获取值列表视图列表
function getLovViewList() {
	$("#lovColumnTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/lov/getLovViewList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#view_name").html("");
			    $.each(JSON.parse(json.result_info), function(index, d){
			        $("#view_name").append('<option value="' + d + '">' + d + '</option>')
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

function getLovDefineInfo() {
	if (lovCode) {
		var url = "<%=context%>/app/sys/lov/getLovDefineInfo";
	    url += "?currentTime=" + new Date();
	    url += "&lovCode=" + lovCode;
	    
	    $.ajax({
			type: "get",
			url: url,
			datatype: "jsonp",
			async: false,
			success: function(data) {
				var json = JSON.parse(data);
				
				if (json.result_code == "Y") {
					var sld = JSON.parse(json.result_info);
					dwr.util.setValues(sld);
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
}

function getLovColumnList() {
	$("#lovColumnTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/lov/getLovColumnList";
    url += "?currentTime=" + new Date();
    url += "&lovCode=" + lovCode;
    url += "&viewName=" + $("#view_name").val();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				var lovData = JSON.parse(json.result_info);
				
				$.each(lovData, function(index, d){
					if (d.display_flag == 'Y') {
						d.display_flag = '<input type="checkbox" id="display_flag_checkbox_' + index + '" checked="checked">';
					} else if (d.display_flag == 'N') {
						d.display_flag = '<input type="checkbox" id="display_flag_checkbox_' + index + '">';
					}
					
					if (d.return_value_flag == 'Y') {
						d.return_value_flag = '<input type="radio" name="return_value_flag_radio" value="' + index + '" checked="checked">';
					} else if (d.return_value_flag == 'N') {
						d.return_value_flag = '<input type="radio" name="return_value_flag_radio" value="' + index + '">';
					}
					
					if (d.return_text_flag == 'Y') {
						d.return_text_flag = '<input type="radio" name="return_text_flag_radio" value="' + index + '" checked="checked">';
					} else if (d.return_text_flag == 'N') {
						d.return_text_flag = '<input type="radio" name="return_text_flag_radio" value="' + index + '">';
					}
			    });
				
				$("#lovColumnTable").bootstrapTable("load", lovData);
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

function doSaveLov() {
	var result = false;
	if (validator.form()) {
		var sld = new SysLovDefine();
		sld.lov_code = $("#lov_code").val();
		sld.lov_name = $("#lov_name").val();
		sld.view_name = $("#view_name").val();
		sld.description = $("#description").val();
		
		var sldJson = JSON.stringify(sld);
		
		var slc = $("#lovColumnTable").bootstrapTable("getData");
		
		var selectedReturnValueIndex = $("input[name='return_value_flag_radio']:checked").val();
		var selectedReturnTextIndex = $("input[name='return_text_flag_radio']:checked").val();
		
		$.each(slc, function(index, d){
			slc[index].lov_code = sld.lov_code;
			
			if ($('#display_flag_checkbox_' + index).is(':checked')) {
				slc[index].display_flag = "Y";
			} else {
				slc[index].display_flag = "N";
			}
			
			if (index == selectedReturnValueIndex) {
				slc[index].return_value_flag = "Y";
			} else {
				slc[index].return_value_flag = "N";
			}
			
			if (index == selectedReturnTextIndex) {
				slc[index].return_text_flag = "Y";
			} else {
				slc[index].return_text_flag = "N";
			}
		});
		
		var slcJson = JSON.stringify(slc);
		
		var url = "<%=context%>/app/sys/lov/saveLovInfo";
		url += "?t=" + new Date();
		
		var postData = "SysLovDefine=" + converSpecialCharOfUrl(encodeURI(sldJson));
		postData += "&SysLovColumn=" + converSpecialCharOfUrl(encodeURI(slcJson));
		
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