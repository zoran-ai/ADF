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

	<title>数据结构节点-扩展属性</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>

	<!-- bootstrap-table -->
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-table/css/bootstrap-table.css">
		
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/js/bootstrap-table.js"></script>
	
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-table/local/bootstrap-table-zh-CN.js"></script>
</head>
<body>
	<div class="container-fluid" style="margin:0px;padding:0px;">
	    <table id="DataStructNodeAttributeTable" class="my-form-table-content">
	    
	    </table>
	</div>
</body>
</html>

<script type="text/javascript">
var structCode = "<%=structCode%>";
var nodeCode = "<%=nodeCode%>";

var dsnaVO = null;

$(document).ready(function() {
	var url = "<%=context%>/app/sys/datastruct/getDataStructNodeAttributeList";
	url += "?t=" + new Date();
	url += "&structCode=" + structCode;
	url += "&nodeCode=" + nodeCode;
	
	$.post(url, function(data) {
		var json = JSON.parse(data);
		
		if (json.result_code == "Y") {
			dsnaVO = JSON.parse(json.result_info);
			
			var html = '';
			
			$.each(dsnaVO, function(index, d){
				html += '<tr>';
				html += '	<td class="my-form-table-td-label" style="width:85px;">';
				html += '		<label class="control-label" style="margin:5px;padding:0px;">' + d.attribute_name + '</label>';
				html += '	</td>';
				html += '	<td class="my-form-table-td-content">';
				
				if (d.element_type == 'text') {
					html += '<input id="' + d.attribute_code + '" name="' + d.attribute_code + '" type="text" value="' + d.attribute_value + '" class="form-control input-sm" style="width:155px;padding:5px;float:left;">';
				} else if (d.element_type == 'select') {
					html += '<select id="' + d.attribute_code + '" name="' + d.attribute_code + '" class="form-control input-sm" style="width:155px;padding:5px;float:left;">';
					
					var data = getDataDictTypeList(d.ddt_code);
					$.each(data, function(i, d1){
						if (d.attribute_value == d1.item_code) {
							html += '	<option value="' + d1.item_code + '" selected="selected">' + d1.item_name + '</option>';
						} else {
							html += '	<option value="' + d1.item_code + '">' + d1.item_name + '</option>';
						}
					});
					
					html += '</select>';
				} else if (d.element_type == 'radio') {
					var data = getDataDictTypeList(d.ddt_code);
					$.each(data, function(i, d1){
						if (d.attribute_value == d1.item_code) {
							html += '<input type="radio" name="' + d.attribute_code + '" value="' + d1.item_code + '" checked="checked">' + d1.item_name;
						} else {
							html += '<input type="radio" name="' + d.attribute_code + '" value="' + d1.item_code + '">' + d1.item_name;
						}
						
						html += '&nbsp;&nbsp;&nbsp;&nbsp;';
					});
				} else if (d.element_type == 'checkbox') {
					if (d.ddt_code) {
						var data = getDataDictTypeList(d.ddt_code);
						$.each(data, function(i, d1){
							if (d.attribute_value == d1.item_code) {
								html += '<input type="checkbox" name="' + d.attribute_code + '" value="' + d1.item_code + '" checked="checked">' + d1.item_name;
							} else {
								html += '<input type="checkbox" name="' + d.attribute_code + '" value="' + d1.item_code + '">' + d1.item_name;
							}
							
							html += '&nbsp;&nbsp;&nbsp;&nbsp;';
						});
					} else {
						if (d.attribute_value == "Y") {
							html += '<input type="checkbox" id="' + d.attribute_code + '" checked="checked">';
						} else if (d.attribute_value == "N") {
							html += '<input type="checkbox" id="' + d.attribute_code + '">';
						}
					}
				} else if (d.element_type == 'lov') {
					html += '<div class="input-group">';
					
					if (d.attribute_value) {
						var lovText = getLovDisplayText(d.lov_code, d.attribute_value);
						
						html += '	<input type="hidden" id="' + d.attribute_code + '" name="' + d.attribute_code + '" value="' + d.attribute_value + '">';
						html += '	<input type="text" id="' + d.attribute_code + '_text" name="' + d.attribute_code + '_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly value="' + lovText + '">';
					} else {
						html += '	<input type="hidden" id="' + d.attribute_code + '" name="' + d.attribute_code + '">';
						html += '	<input type="text" id="' + d.attribute_code + '_text" name="' + d.attribute_code + '_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly>';
					}
					
					html += '	<span class="input-group-btn">';
					html += '		<button id="' + d.attribute_code + '_btn" class="btn btn-default" type="button" style="padding:4px 6px" onclick="openLov(\'' + d.lov_code + '\',\'' + d.attribute_code + '\');">';
					html += '			<i class="glyphicon glyphicon-search"></i>';
					html += '		</button>';
					html += '	</span>';
					html += '</div>';
				} else if (d.element_type == 'tree') {
					html += '<div class="input-group">';
					
					if (d.attribute_value) {
						var lotText = getTreeDisplayText(d.ds_code, d.attribute_value);
						
						html += '	<input type="hidden" id="' + d.attribute_code + '" name="' + d.attribute_code + '" value="' + d.attribute_value + '">';
						html += '	<input type="text" id="' + d.attribute_code + '_text" name="' + d.attribute_code + '_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly value="' + lotText + '">';
					} else {
						html += '	<input type="hidden" id="' + d.attribute_code + '" name="' + d.attribute_code + '">';
						html += '	<input type="text" id="' + d.attribute_code + '_text" name="' + d.attribute_code + '_text" class="form-control input-sm" style="width:155px;padding:5px;float:left;background-color:#fff" readOnly>';
					}
					
					html += '	<span class="input-group-btn">';
					html += '		<button id="' + d.attribute_code + '_btn" class="btn btn-default" type="button" style="padding:4px 6px" onclick="openTree(\'' + d.ds_code + '\',\'' + d.attribute_code + '\');">';
					html += '			<i class="glyphicon glyphicon-search"></i>';
					html += '		</button>';
					html += '	</span>';
					html += '</div>';
				}
				
				html += '	</td>';
				html += '</tr>';
			});
			
			$("#DataStructNodeAttributeTable").append(html);
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

// 初始化下拉列表
function getDataDictTypeList(typeCode){
	var ddi;
	
	var url = "<%=context%>/app/common/list/getSingleDataDictItemList";
    url += "?typeCode=" + typeCode;
    url += "&enabledFlag=Y";
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
				ddi = JSON.parse(json.result_info);
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
	
	return ddi;
}

function openLov(lovCode, lovId) {
	var url = "<%=context%>/app/common/lov/Lov";
	url += "?lovCode=" + lovCode;
	url += "&lovType=single";
	
	var lovFrame = '<iframe id="lovFrame" class="my-modal-iframe" width="100%" height="400px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "&nbsp;&nbsp;",
		message: lovFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "确定",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lovFrame").contentWindow.getLovData();
	      			$("#" + lovId).val(result.lov_value);
	      			$("#" + lovId + "_text").val(result.lov_text);
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

// 获取值列表某一项项显示文本
function getLovDisplayText(lovCode, lovValue){
	var lovText;
	
	var url = "<%=context%>/app/common/lov/getLovDisplayText";
    url += "?lovCode=" + lovCode;
    url += "&lovValue=" + lovValue;
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
				lovText = json.result_info;
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
	
	return lovText;
}

function openTree(structCode, lotId) {
	var url = "<%=context%>/app/common/lot/Lot";
	url += "?structCode=" + structCode;
	url += "&treeType=single";
	
	var lotFrame = '<iframe id="lotFrame" class="my-modal-iframe" width="100%" height="450px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "&nbsp;&nbsp;",
		message: lotFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "确定",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lotFrame").contentWindow.getLotData();
	      			$("#" + lotId).val(result.lot_value);
	      			$("#" + lotId + "_text").val(result.lot_text);
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

// 获取树列表显示文本
function getTreeDisplayText(structCode, nodeCode){
	var lotText;
	
	var url = "<%=context%>/app/common/lot/getTreeDisplayText";
    url += "?structCode=" + structCode;
    url += "&nodeCode=" + nodeCode;
	
	$.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		async: false,
		success: function(data) {
			var json = JSON.parse(data);
			if (json.result_code == "Y") {
				lotText = json.result_info;
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
	
	return lotText;
}

function saveDataStrucNodeAttributes() {
	$.each(dsnaVO, function(index, d){
		if (dsnaVO[index].element_type == 'text'
				|| dsnaVO[index].element_type == 'select'
				|| dsnaVO[index].element_type == 'lov'
				|| dsnaVO[index].element_type == 'tree') {
			dsnaVO[index].attribute_value = $('#' + d.attribute_code).val();
		} else if (dsnaVO[index].element_type == 'radio') {
			dsnaVO[index].attribute_value = $("input[name='" + dsnaVO[index].attribute_code + "']:checked").val();
		} else if (dsnaVO[index].element_type == 'checkbox') {
			if (dsnaVO[index].ddt_code) {
				dsnaVO[index].attribute_value = $("input[name='" + dsnaVO[index].attribute_code + "']:checked").val();
			} else {
				if ($('#' + dsnaVO[index].attribute_code).is(':checked')) {
					dsnaVO[index].attribute_value = 'Y';
				} else {
					dsnaVO[index].attribute_value = 'N';
				}
			}
			
		}
	});
	
	var json = JSON.stringify(dsnaVO);
	
	var url = "<%=context%>/app/sys/datastruct/saveDataStructNodeAttributes";
	url += "?t=" + new Date();
	
	var postData = "dsnaVO=" + converSpecialCharOfUrl(encodeURI(json));

	$.ajax({
		type: "post",
	    url: url,
	    dataType: "text",
	    data: postData,
	    async: false,
	    success: function(text, status){
			var json = JSON.parse(text);
			
			if (json.result_code == "Y") {
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
</script>