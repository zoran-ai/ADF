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

	<title>弹性域</title>

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
            	<div id="defineToolbar">
            		<button id="refreshDefineBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryFlexFieldDefineList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addDefineBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addFlexFieldDefine();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editDefineBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editFlexFieldDefine();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="defineTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#defineToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true"
			           data-unique-id="flex_code">
			        <thead>
			           	<tr>
			                <th data-field="flex_code" data-halign="center" data-align="left" data-sortable="true">弹性域编码</th>
			                <th data-field="flex_name" data-halign="center" data-align="left" data-sortable="true">弹性域名称</th>
			                <th data-field="table_name" data-halign="center" data-align="left" data-sortable="true">表名</th>
			                <th data-field="enabled_flag" data-halign="center" data-align="center">状态</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			        </thead>
				</table>
			</div>
		</div>
		
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding:5px;">
				<div id="columnToolbar">
            		<button id="refreshColumnBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryFlexFieldColumnList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addColumnBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addFlexFieldColumn();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editColumnBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editFlexFieldColumn();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="columnTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#columnToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true">
			    	<thead>
			        	<tr>
			                <th data-field="column_name" data-halign="center" data-align="left" data-sortable="true">字段码</th>
			                <th data-field="column_title" data-halign="center" data-align="left" data-sortable="true">字段标题</th>
			                <th data-field="element_type_name" data-halign="center" data-align="left" data-sortable="true">元素类型</th>
			                <th data-field="ddt_text" data-halign="center" data-align="left" data-sortable="true">数据字典</th>
			                <th data-field="ds_text" data-halign="center" data-align="left" data-sortable="true">数据结构</th>
			                <th data-field="lov_text" data-halign="center" data-align="left" data-sortable="true">值列表</th>
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
var currentFlexCode;
var currentColumnName;

$(document).ready(function() {
	$("#defineTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentFlexCode = row.flex_code;
        
        queryFlexFieldColumnList();
    });
	
	$("#defineTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentFlexCode = row.flex_code;
        
        editFlexFieldDefine();
        
        queryFlexFieldColumnList();
    });
	
	$("#columnTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentColumnName = row.column_name;
    });
	
	$("#columnTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
       
        editFlexFieldColumn();
        
        currentColumnName = row.column_name;
    });
	
	queryFlexFieldDefineList();
});

// 获取弹性域定义列表
function queryFlexFieldDefineList() {
	$("#defineTable").bootstrapTable('removeAll');
	$("#columnTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/flexfield/getFlexFieldDefineList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#defineTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentFlexCode = null;
				currentColumnName = null;
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

// 获取弹性域字段列表
function queryFlexFieldColumnList() {
	$("#columnTable").bootstrapTable('removeAll');
	
    var url = "<%=context%>/app/sys/flexfield/getFlexFieldColumnList";
    url += "?currentTime=" + new Date();
    url += "&flexCode=" + currentFlexCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#columnTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentColumnName = null;
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

// 新建弹性域定义
function addFlexFieldDefine() {
	var url = "<%=context%>/app/sys/flexfield/FlexFieldDefineAdd";
	
	var defineAddFrame = '<iframe id="defineAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "弹性域-新建",
		message: defineAddFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("defineAddFrame").contentWindow.doAddFlexFieldDefine();
	      			if (result) {
	      				queryFlexFieldDefineList();
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

// 编辑弹性域定义
function editFlexFieldDefine() {
	if (!currentFlexCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择弹性域！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/flexfield/FlexFieldDefineEdit";
	url += "?flexCode=" + currentFlexCode;
	
	var defineEditFrame = '<iframe id="defineEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "弹性域-编辑",
		message: defineEditFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("defineEditFrame").contentWindow.doEditFlexFieldDefine();
	      			if (result) {
	      				queryFlexFieldDefineList();
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

// 新建弹性域字段
function addFlexFieldColumn() {
	if (!currentFlexCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择弹性域！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/flexfield/FlexFieldColumnAdd";
	url += "?flexCode=" + currentFlexCode;
	url += "&tableName=" + $("#defineTable").bootstrapTable('getRowByUniqueId', currentFlexCode).table_name;
	
	var columnAddFrame = '<iframe id="columnAddFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "弹性域字段-新建",
		message: columnAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("columnAddFrame").contentWindow.doAddFlexFieldColumn();
	      			if (result) {
	      				queryFlexFieldColumnList();
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

// 编辑弹性域字段
function editFlexFieldColumn() {
	if (!currentFlexCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择弹性域！"
		});
		return;
	}
	
	if (!currentColumnName) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择弹性域字段！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/flexfield/FlexFieldColumnEdit";
	url += "?flexCode=" + currentFlexCode;
	url += "&tableName=" + $("#defineTable").bootstrapTable('getRowByUniqueId', currentFlexCode).table_name;
	url += "&columnName=" + currentColumnName;
	
	var columnEditFrame = '<iframe id="columnEditFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "弹性域字段-编辑",
		message: columnEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("columnEditFrame").contentWindow.doEditFlexFieldColumn();
	      			if (result) {
	      				queryFlexFieldColumnList();
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