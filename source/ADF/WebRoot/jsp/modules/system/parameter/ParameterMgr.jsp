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

	<title>系统参数</title>

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
            	<div id="typeToolbar">
            		<button id="refreshTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryParameterTypeList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addParameterType();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editParameterType();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="typeTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#typeToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true">
			        <thead>
			           	<tr>
			                <th data-field="type_code" data-halign="center" data-align="left" data-sortable="true">参数类型编码</th>
			                <th data-field="type_name" data-halign="center" data-align="left" data-sortable="true">参数类型名称</th>
			                <th data-field="display_order" data-halign="center" data-align="right" data-sortable="true">显示顺序</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			        </thead>
				</table>
			</div>
		</div>
		
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding:5px;">
				<div id="parameterToolbar">
            		<button id="refreshParameterBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryParameterDefineList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addParameterBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addParameterDefine();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editParameterBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editParameterDefine();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="parameterTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#parameterToolbar"
			           data-height="248"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="5"
			           data-page-list="[5,10,15,20,25]"
			           data-striped="true"
			           data-search="true">
			    	<thead>
			        	<tr>
			                <th data-field="parameter_code" data-halign="center" data-align="left" data-sortable="true">参数编码</th>
			                <th data-field="parameter_name" data-halign="center" data-align="left" data-sortable="true">参数名称</th>
			                <th data-field="element_type_name" data-halign="center" data-align="left" data-sortable="true">元素类型</th>
			                <th data-field="ddt_text" data-halign="center" data-align="left" data-sortable="true">数据字典</th>
			                <th data-field="ds_text" data-halign="center" data-align="left" data-sortable="true">数据结构</th>
			                <th data-field="lov_text" data-halign="center" data-align="left" data-sortable="true">值列表</th>
			                <th data-field="display_order" data-halign="center" data-align="right" data-sortable="true">显示顺序</th>
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
var currentTypeCode;
var currentParameterCode;

$(document).ready(function() {
	$("#typeTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentTypeCode = row.type_code;
        
        queryParameterDefineList();
    });
	
	$("#typeTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentTypeCode = row.type_code;
        
        editParameterType();
        
        queryParameterDefineList();
    });
	
	$("#parameterTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentParameterCode = row.parameter_code;
    });
	
	$("#parameterTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
       
        editParameterDefine();
        
        currentParameterCode = row.parameter_code;
    });
	
	queryParameterTypeList();
});

// 获取参数类型列表
function queryParameterTypeList() {
	$("#typeTable").bootstrapTable('removeAll');
	$("#parameterTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/parameter/getParameterTypeList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#typeTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentTypeCode = null;
				currentParameterCode = null;
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

// 获取参数列表
function queryParameterDefineList() {
	$("#parameterTable").bootstrapTable('removeAll');
	
    var url = "<%=context%>/app/sys/parameter/getParameterDefineList";
    url += "?currentTime=" + new Date();
    url += "&typeCode=" + currentTypeCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#parameterTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentParameterCode = null;
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

// 新建参数类型
function addParameterType() {
	var url = "<%=context%>/app/sys/parameter/ParameterTypeAdd";
	
	var typeAddFrame = '<iframe id="typeAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "参数类型-新建",
		message: typeAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeAddFrame").contentWindow.doAddParameterType();
	      			if (result) {
	      				queryParameterTypeList();
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

// 编辑参数类型
function editParameterType() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择参数类型！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/parameter/ParameterTypeEdit";
	url += "?typeCode=" + currentTypeCode;
	
	var typeEditFrame = '<iframe id="typeEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "参数类型-编辑",
		message: typeEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeEditFrame").contentWindow.doEditParameterType();
	      			if (result) {
	      				queryParameterTypeList();
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

// 新建参数
function addParameterDefine() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择参数类型！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/parameter/ParameterDefineAdd";
	url += "?typeCode=" + currentTypeCode;
	
	var parameterAddFrame = '<iframe id="parameterAddFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "参数-新建",
		message: parameterAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("parameterAddFrame").contentWindow.doAddParameterDefine();
	      			if (result) {
	      				queryParameterDefineList();
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

// 编辑参数
function editParameterDefine() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择参数类型！"
		});
		return;
	}
	
	if (!currentParameterCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择参数！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/parameter/ParameterDefineEdit";
	url += "?parameterCode=" + currentParameterCode;
	
	var parameterEditFrame = '<iframe id="parameterEditFrame" class="my-modal-iframe" width="100%" height="350px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "参数-编辑",
		message: parameterEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("parameterEditFrame").contentWindow.doEditParameterDefine();
	      			if (result) {
	      				queryParameterDefineList();
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