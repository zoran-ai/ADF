<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();

	String structCode = request.getParameter("structCode");
	String attributeCode = request.getParameter("attributeCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>数据结构-扩展属性-编辑</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysDataStructAttribute.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="structAttributeEditForm" name="structAttributeEditForm" class="my-form-content">
		<input type="hidden" id="struct_code" name="struct_code" value="<%=structCode%>">
		
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:60px;">
					<label class="control-label" style="margin:5px;padding:0px;">属性编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:200px;">
					<input id="attribute_code" name="attribute_code" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;" readOnly>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">属性名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="attribute_name" name="attribute_name" type="text" class="form-control input-sm" style="width:180px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">元素类型</label>
				</td>
				<td class="my-form-table-td-content">
					<select id="element_type" name="element_type" class="form-control input-sm" style="width:180px;padding:5px;float:left;" onchange="elementTypeChange();"></select>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">数据字典</label>
				</td>
				<td class="my-form-table-td-content">
					<div class="input-group">
						<input type="hidden" id="ddt_code" name="ddt_code">
						<input type="text" id="ddt_text" name="ddt_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly>
						<span class="input-group-btn">
        					<button id="ddt_btn" class="btn btn-default" type="button" style="padding:4px 6px" onclick="openLovDataDict();">
        						<i class="glyphicon glyphicon-search"></i>
        					</button>
      					</span>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">数据结构</label>
				</td>
				<td class="my-form-table-td-content">
					<div class="input-group">
						<input type="hidden" id="ds_code" name="ds_code">
						<input type="text" id="ds_text" name="ds_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly>
						<span class="input-group-btn">
        					<button id="ds_btn" class="btn btn-default" type="button" style="padding:4px 6px" onclick="openLovDataStruct();">
        						<i class="glyphicon glyphicon-search"></i>
        					</button>
      					</span>
					</div>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">值列表</label>
				</td>
				<td class="my-form-table-td-content">
					<div class="input-group">
						<input type="hidden" id="lov_code" name="lov_code">
						<input type="text" id="lov_text" name="lov_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly>
						<span class="input-group-btn">
        					<button id="lov_btn" class="btn btn-default" type="button" style="padding:4px 6px" onclick="openLovLov();">
        						<i class="glyphicon glyphicon-search"></i>
        					</button>
      					</span>
					</div>
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
var attributeCode = "<%=attributeCode%>";

var validator;

$(document).ready(function() {
	validator = $("#structAttributeEditForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			attribute_name: {
				required: true,
				maxlength: 100
			},
			'description':{
				maxlength: 200
			}
		},
		messages: {
			attribute_name: {
				required: "[属性名称]不能为空！",
				maxlength: "[属性名称]最大长度为100！"
			},
			'description':{
				maxlength: "[说明]最大长度为200！"
			}
		}
	});
	
	initElementTypeList();
	
	initDataStructAttributeInfo();
});

// 初始化元素类型列表
function initElementTypeList(){
	var url = "<%=context%>/app/common/list/getSingleDataDictItemList";
    url += "?typeCode=element_type";
    url += "&enabledFlag=Y";
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
			    $("#element_type").html("");
			    $.each(JSON.parse(json.result_info), function(index, d){
			        $("#element_type").append('<option value="' + d.item_code + '">' + d.item_name + '</option>')
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

// 初始化数据结构属性信息
function initDataStructAttributeInfo() {
	var url = "<%=context%>/app/sys/datastruct/getDataStructAttributeInfo";
	url += "?t=" + new Date();
	url += "&structCode=" + structCode;
	url += "&attributeCode=" + attributeCode;
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
				var dsa = JSON.parse(json.result_info);
				dwr.util.setValues(dsa);
				
				elementTypeChange();
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

function elementTypeChange() {
	var elementType = $("#element_type").val();
	if (elementType == "text") {
		$("#ddt_text").attr("disabled", true);
		$("#ddt_btn").attr("disabled", true);
		$("#ddt_code").val("");
		$("#ddt_text").val("");
		
		$("#lov_text").attr("disabled", true);
		$("#lov_btn").attr("disabled", true);
		$("#lov_code").val("");
		$("#lov_text").val("");
		
		$("#ds_text").attr("disabled", true);
		$("#ds_btn").attr("disabled", true);
		$("#ds_code").val("");
		$("#ds_text").val("");
	} else if (elementType == "select" || elementType == "radio" || elementType == "checkbox") {
		$("#ddt_text").attr("disabled", false);
		$("#ddt_btn").attr("disabled", false);
		
		$("#lov_text").attr("disabled", true);
		$("#lov_btn").attr("disabled", true);
		$("#lov_code").val("");
		$("#lov_text").val("");
		
		$("#ds_text").attr("disabled", true);
		$("#ds_btn").attr("disabled", true);
		$("#ds_code").val("");
		$("#ds_text").val("");
	} else if (elementType == "lov") {
		$("#ddt_text").attr("disabled", true);
		$("#ddt_btn").attr("disabled", true);
		$("#ddt_code").val("");
		$("#ddt_text").val("");
		
		$("#lov_text").attr("disabled", false);
		$("#lov_btn").attr("disabled", false);
		
		$("#ds_text").attr("disabled", true);
		$("#ds_btn").attr("disabled", true);
		$("#ds_code").val("");
		$("#ds_text").val("");
	} else if (elementType == "tree") {
		$("#ddt_text").attr("disabled", true);
		$("#ddt_btn").attr("disabled", true);
		$("#ddt_code").val("");
		$("#ddt_text").val("");
		
		$("#lov_text").attr("disabled", true);
		$("#lov_btn").attr("disabled", true);
		$("#lov_code").val("");
		$("#lov_text").val("");
		
		$("#ds_text").attr("disabled", false);
		$("#ds_btn").attr("disabled", false);
	}
}

function openLovDataDict() {
	var url = "<%=context%>/app/common/lov/Lov";
	url += "?lovCode=lov_data_dict";
	url += "&lovType=single";
	
	var dataDictLovFrame = '<iframe id="dataDictLovFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据字典",
		message: dataDictLovFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "确定",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("dataDictLovFrame").contentWindow.getLovData();
	      			$("#ddt_code").val(result.lov_value);
	      			$("#ddt_text").val(result.lov_text);
	      			return result;
	      		}
			},
			cancelType: {
	      		label: "取消",
	      		className: "btn-default",
	      		callback: function() {
	      			return true;
	      		}
			}
		}
	});
}

function openLovLov() {
	var url = "<%=context%>/app/common/lov/Lov";
	url += "?lovCode=lov_list_of_value";
	url += "&lovType=single";
	
	var lovLovFrame = '<iframe id="lovLovFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "值列表",
		message: lovLovFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "确定",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lovLovFrame").contentWindow.getLovData();
	      			$("#lov_code").val(result.lov_value);
	      			$("#lov_text").val(result.lov_text);
	      			return result;
	      		}
			},
			cancelType: {
	      		label: "取消",
	      		className: "btn-default",
	      		callback: function() {
	      			return true;
	      		}
			}
		}
	});
}

function openLovDataStruct() {
	var url = "<%=context%>/app/common/lov/Lov";
	url += "?lovCode=lov_data_struct";
	url += "&lovType=single";
	
	var lovLovFrame = '<iframe id="lovLovFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "值列表",
		message: lovLovFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "确定",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lovLovFrame").contentWindow.getLovData();
	      			$("#ds_code").val(result.lov_value);
	      			$("#ds_text").val(result.lov_text);
	      			return result;
	      		}
			},
			cancelType: {
	      		label: "取消",
	      		className: "btn-default",
	      		callback: function() {
	      			return true;
	      		}
			}
		}
	});
}

function doEditDataStructAttribute() {
	var result = false;
	if (validator.form()) {
		var dsa = new SysDataStructAttribute();
		
		dwr.util.getValues(dsa);
		
		var json = JSON.stringify(dsa);
		
		var url = "<%=context%>/app/sys/datastruct/editDataStructAttribute";
		url += "?t=" + new Date();
		
		var postData = "SysDataStructAttribute=" + converSpecialCharOfUrl(encodeURI(json));

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