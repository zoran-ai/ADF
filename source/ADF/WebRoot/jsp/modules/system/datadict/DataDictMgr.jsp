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

	<title>数据字典管理</title>

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
			<div class="col-md-6" style="padding-left:5px;padding-right:5px;">
            	<div id="typeToolbar">
            		<button id="refreshTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryDataDictTypeList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addDataDictType();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editTypeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editDataDictType();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			        <button id="configTypeAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="configTypeAttribute();">
			            <i class="glyphicon glyphicon-list-alt"></i>&nbsp;扩展属性
			        </button>
			    </div>
			    
			    <table id="typeTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#typeToolbar"
			           data-height="100%"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="10"
			           data-page-list="[10,15,20,25,30]"
			           data-striped="true"
			           data-search="true">
			        <thead>
			           	<tr>
			                <th data-field="type_code" data-halign="center" data-align="left" data-sortable="true">类型编码</th>
			                <th data-field="type_name" data-halign="center" data-align="left" data-sortable="true">类型名称</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			        </thead>
				</table>
			</div>
			
			<div class="col-md-6" style="padding-left:5px;padding-right:5px;">
				<div id="itemToolbar">
            		<button id="refreshItemBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryDataDictItemList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addItemBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addDataDictItem();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editItemBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editDataDictItem();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			        <button id="configItemAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="configItemAttribute();">
			            <i class="glyphicon glyphicon-list-alt"></i>&nbsp;扩展属性
			        </button>
			    </div>
			    
			    <table id="itemTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#itemToolbar"
			           data-height="100%"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="10"
			           data-page-list="[10,15,20,25,30]"
			           data-striped="true"
			           data-search="true">
			    	<thead>
			        	<tr>
			                <th data-field="item_code" data-halign="center" data-align="left" data-sortable="true">项编码</th>
			                <th data-field="item_name" data-halign="center" data-align="left" data-sortable="true">项名称</th>
			                <th data-field="display_order" data-halign="center" data-align="right" data-sortable="true">显示顺序</th>
			                <th data-field="enabled_flag" data-halign="center" data-align="center" data-sortable="true">状态</th>
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
var currentTypeName;
var currentItemCode;
var currentItemName;

$(document).ready(function() {
	$("#typeTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentTypeCode = row.type_code;
        currentTypeName = row.type_name;
        
        queryDataDictItemList();
    });
	
	$("#typeTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentTypeCode = row.type_code;
        currentTypeName = row.type_name;
        
        editDataDictType();
        
        queryDataDictItemList();
    });
	
	$("#itemTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentItemCode = row.item_code;
        currentItemName = row.item_name;
    });
	
	$("#itemTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
       
        editDataDictItem();
        
        currentItemCode = row.item_code;
        currentItemName = row.item_name;
    });
	
	queryDataDictTypeList();
});


// 获取数据字典类型列表
function queryDataDictTypeList() {
	$("#typeTable").bootstrapTable('removeAll');
	$("#itemTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/datadict/getDataDictTypeList";
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
				currentTypeName = null;
				currentItemCode = null;
				currentItemName = null;
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

// 获取数据字典项列表
function queryDataDictItemList() {
	$("#itemTable").bootstrapTable('removeAll');
	
    var url = "<%=context%>/app/sys/datadict/getDataDictItemList";
    url += "?currentTime=" + new Date();
    url += "&typeCode=" + converSpecialCharOfUrl(encodeURI(currentTypeCode));
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#itemTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentItemCode = null;
				currentItemName = null;
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

// 新建数据字典类型
function addDataDictType() {
	var url = "<%=context%>/app/sys/datadict/DataDictTypeAdd";
	
	var typeAddFrame = '<iframe id="typeAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据字典类型-新建",
		message: typeAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeAddFrame").contentWindow.doAddDataDictType();
	      			if (result) {
	      				queryDataDictTypeList();
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

// 编辑数据字典类型
function editDataDictType() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictTypeEdit";
	url += "?typeCode=" + currentTypeCode;
	
	var typeEditFrame = '<iframe id="typeEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典类型-编辑",
		message: typeEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeEditFrame").contentWindow.doEditDataDictType();
	      			if (result) {
	      				queryDataDictTypeList();
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

// 配置数据字典类型属性
function configTypeAttribute() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictTypeAttributeConfig";
	url += "?typeCode=" + currentTypeCode;
	
	var typeAttributeConfigFrame = '<iframe id="typeAttributeConfigFrame" class="my-modal-iframe" width="100%" height="375px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典类型-扩展属性",
		message: typeAttributeConfigFrame,
		size: "large"
	});
}

// 新建数据字典项
function addDataDictItem() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictItemAdd";
	url += "?typeCode=" + currentTypeCode;
	
	var itemAddFrame = '<iframe id="itemAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典项-新建",
		message: itemAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("itemAddFrame").contentWindow.doAddDataDictItem();
	      			if (result) {
	      				queryDataDictItemList();
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

// 编辑数据字典项
function editDataDictItem() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型！"
		});
		return;
	}
	
	if (!currentItemCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典项！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictItemEdit";
	url += "?typeCode=" + currentTypeCode;
	url += "&itemCode=" + currentItemCode;
	url += "&itemName=" + currentItemName;
	
	var itemEditFrame = '<iframe id="itemEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典项-编辑",
		message: itemEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("itemEditFrame").contentWindow.doEditDataDictItem();
	      			if (result) {
	      				queryDataDictItemList();
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

// 配置数据字典项属性
function configItemAttribute() {
	if (!currentTypeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型！"
		});
		return;
	}
	
	if (!currentItemCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典项！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictItemAttributeConfig";
	url += "?typeCode=" + currentTypeCode;
	url += "&itemCode=" + currentItemCode;
	
	var itemAttributeConfigFrame = '<iframe id="itemAttributeConfigFrame" class="my-modal-iframe" width="100%" height="300px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典项-扩展属性",
		message: itemAttributeConfigFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			return window.top.document.getElementById("itemAttributeConfigFrame").contentWindow.saveDataDictItemAttributes();
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