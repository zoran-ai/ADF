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

	<title>数据结构-新建</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/SysDataStructDefine.js'></script>
	
	<!-- jquery-validator -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.min.js"></script>
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-validate/jquery.validate.plu.js"></script>
</head>
<body class="my-body-content">
	<form id="structDefineAddForm" name="structDefineAddForm" class="my-form-content">
		<table class="my-form-table-content">
			<tr>
				<td class="my-form-table-td-label" style="width:85px;">
					<label class="control-label" style="margin:5px;padding:0px;">数据结构编码</label>
				</td>
				<td class="my-form-table-td-content" style="width:175px;">
					<input id="struct_code" name="struct_code" type="text" class="form-control input-sm" style="width:155px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">数据结构名称</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="struct_name" name="struct_name" type="text" class="form-control input-sm" style="width:155px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">节点编码规则</label>
				</td>
				<td class="my-form-table-td-content">
					<select id="node_code_rule" name="node_code_rule" class="form-control input-sm" style="width:155px;padding:5px;float:left;" onchange="nodeCodeRuleChange();"></select>
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">节点编码前缀</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="rule_prefix" name="rule_prefix" type="text" class="form-control input-sm" style="width:155px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">节点编码长度</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="rule_length" name="rule_length" type="text" class="form-control input-sm" style="width:155px;padding:5px;float:left;">
				</td>
			</tr>
			
			<tr>
				<td class="my-form-table-td-label">
					<label class="control-label" style="margin:5px;padding:0px;">说明</label>
				</td>
				<td class="my-form-table-td-content">
					<input id="description" name="description" type="text" class="form-control input-sm" style="width:155px;padding:5px;float:left;">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>

<script type="text/javascript">
var validator;

$(document).ready(function() {
	validator = $("#structDefineAddForm").validate({
		debug: true,
		showErrors: showErrors,
		rules: {
			struct_code: {
				required: true,
				maxlength: 50,
				isCode: true,
				remote: {
					url:"<%=context%>/app/sys/datastruct/checkDataStructCode?t=" + new Date(),
					type: "post",
					dataType: "json",
					data: {
						structCode: function(){return $('#struct_code').val()}
					}
				}
			},
			struct_name: {
				required: true,
				maxlength: 100
			},
			'rule_prefix':{
				maxlength: 10,
				isCode: true
			},
			'rule_length':{
				maxlength: 10,
				number: true
			},
			'description':{
				maxlength: 200
			}
		},
		messages: {
			struct_code: {
				required: "[数据结构编码]不能为空！",
				maxlength: "[数据结构编码]最大长度为50！",
				remote: "当前数据结构编码已经存在！"
			},
			struct_name: {
				required: "[数据结构名称]不能为空！",
				maxlength: "[数据结构名称]最大长度为100！"
			},
			'rule_prefix':{
				maxlength: "[节点编码前缀]最大长度为10！",
				isCode: "[节点编码前缀]只能包括字母、数字、点、下划线、横线！"
			},
			'rule_length':{
				maxlength: "[节点编码长度]最大长度为100！",
				number: "[显示顺序]必须是数字！"
			},
			'description':{
				maxlength: "[说明]最大值为200！"
			}
		}
	});
	
	initNodeCodeRuleList();
});

// 初始化节点编码规则数据字典类型
function initNodeCodeRuleList(){
	var url = "<%=context%>/app/common/list/getSingleDataDictItemList";
    url += "?typeCode=code_rule";
    url += "&enabledFlag=Y";
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
			    $("#node_code_rule").html("");
			    $.each(JSON.parse(json.result_info), function(index, d){
			        $("#node_code_rule").append('<option value="' + d.item_code + '">' + d.item_name + '</option>')
			    });
			    nodeCodeRuleChange();
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

function nodeCodeRuleChange() {
	var nodeCodeRule = $("#node_code_rule").val();
	if (nodeCodeRule == "auto") {
		$("#rule_prefix").attr("disabled", false);
		$("#rule_length").attr("disabled", false);
	} else if (nodeCodeRule == "manual") {
		$("#rule_prefix").attr("disabled", true);
		$("#rule_length").attr("disabled", true);
		$("#rule_prefix").val("");
		$("#rule_length").val("");
	}
}

function doAddDataStructDefine() {
	var result = false;
	if (validator.form()) {
		var dsd = new SysDataStructDefine();
		
		dwr.util.getValues(dsd);
		
		var json = JSON.stringify(dsd);
		
		var url = "<%=context%>/app/sys/datastruct/addDataStructDefine";
		url += "?t=" + new Date();
		
		var postData = "SysDataStructDefine=" + converSpecialCharOfUrl(encodeURI(json));

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