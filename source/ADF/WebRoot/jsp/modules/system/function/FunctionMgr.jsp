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

	<title>功能管理</title>

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
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding:5px;">
            	<div id="functionToolbar">
            		<button id="refreshFunctionBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryFunctionList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addFunctionBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addFunction();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editFunctionBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editFunction();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="functionTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#functionToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true">
			        <thead>
			           	<tr>
			                <th data-field="function_code" data-halign="center" data-align="left" data-sortable="true">功能编码</th>
			                <th data-field="function_name" data-halign="center" data-align="left" data-sortable="true">功能名称</th>
			                <th data-field="function_url" data-halign="center" data-align="left" data-sortable="true">功能URL</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			        </thead>
				</table>
			</div>
		</div>
		
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding:5px;">
				<div id="operationToolbar">
            		<button id="refreshOperationBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryOperationList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addOperationBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addOperation();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editOperationBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editOperation();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="operationTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#operationToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true">
			    	<thead>
			        	<tr>
			                <th data-field="operation_code" data-halign="center" data-align="left" data-sortable="true">操作编码</th>
			                <th data-field="operation_name" data-halign="center" data-align="left" data-sortable="true">操作名称</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			    	</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var currentFunctionCode;
var currentOperationCode;

$(document).ready(function() {
	$("#functionTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentFunctionCode = row.function_code;
        
        queryOperationList();
    });
	
	$("#functionTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentFunctionCode = row.function_code;
        
        editFunction();
        
        queryOperationList();
    });
	
	$("#operationTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentOperationCode = row.operation_code;
    });
	
	$("#operationTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
       
        editOperation();
        
        currentOperationCode = row.operation_code;
    });
	
	queryFunctionList();
});

// 获取功能列表
function queryFunctionList() {
	$("#functionTable").bootstrapTable('removeAll');
	$("#operationTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/function/getFunctionList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#functionTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentFunctionCode = null;
				currentOperationCode = null;
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

// 获取操作列表
function queryOperationList() {
	$("#operationTable").bootstrapTable('removeAll');
	
    var url = "<%=context%>/app/sys/function/getOperationList";
    url += "?currentTime=" + new Date();
    url += "&functionCode=" + currentFunctionCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#operationTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentOperationCode = null;
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

// 新建功能
function addFunction() {
	var url = "<%=context%>/app/sys/function/FunctionAdd";
	
	var functionAddFrame = '<iframe id="functionAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "功能-新建",
		message: functionAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("functionAddFrame").contentWindow.doAddFunction();
	      			if (result) {
	      				queryFunctionList();
	      			}
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

// 编辑功能
function editFunction() {
	if (!currentFunctionCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择功能！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/function/FunctionEdit";
	url += "?functionCode=" + currentFunctionCode;
	
	var functionEditFrame = '<iframe id="functionEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "功能-编辑",
		message: functionEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("functionEditFrame").contentWindow.doEditFunction();
	      			if (result) {
	      				queryFunctionList();
	      			}
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

// 新建操作
function addOperation() {
	if (!currentFunctionCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择功能！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/function/OperationAdd";
	url += "?functionCode=" + currentFunctionCode;
	
	var operationAddFrame = '<iframe id="operationAddFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "操作-新建",
		message: operationAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("operationAddFrame").contentWindow.doAddOperation();
	      			if (result) {
	      				queryOperationList();
	      			}
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

// 编辑操作
function editOperation() {
	if (!currentFunctionCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择功能！"
		});
		return;
	}
	
	if (!currentOperationCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择参数！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/function/OperationEdit";
	url += "?operationCode=" + currentOperationCode;
	
	var operationEditFrame = '<iframe id="operationEditFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "操作-编辑",
		message: operationEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("operationEditFrame").contentWindow.doEditOperation();
	      			if (result) {
	      				queryOperationList();
	      			}
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
</script>