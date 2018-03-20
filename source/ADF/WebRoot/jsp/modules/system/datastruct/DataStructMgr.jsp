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

	<title>数据结构管理</title>

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
		
	<!-- bootstrap-treeview -->
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-treeview/css/bootstrap-treeview.css">
	
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-treeview/js/bootstrap-treeview.js"></script>
</head>
<body>
	<div class="container-fluid" style="margin:0px;padding:0px;">
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-8" style="padding-left:5px;padding-right:5px;">
            	<div id="dsdToolbar">
            		<button id="refreshDSDBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryDSDList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addDSDBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addDSD();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editDSDBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editDSD();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			        <button id="configStructAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="configStructAttribute();">
			            <i class="glyphicon glyphicon-list-alt"></i>&nbsp;扩展属性
			        </button>
			    </div>
			    
			    <table id="dsdTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#dsdToolbar"
			           data-height="100%"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="10"
			           data-page-list="[10,15,20,25,30]"
			           data-striped="true"
			           data-search="true"
			           data-unique-id="struct_code">
			        <thead>
			           	<tr>
			                <th data-field="struct_code" data-halign="center" data-align="left" data-sortable="true">数据结构编码</th>
			                <th data-field="struct_name" data-halign="center" data-align="left" data-sortable="true">数据结构名称</th>
			                <th data-field="node_code_rule_name" data-halign="center" data-align="center" data-sortable="true">节点编码规则</th>
			                <th data-field="rule_prefix" data-halign="center" data-align="left" data-sortable="true">节点编码前缀</th>
			                <th data-field="rule_length" data-halign="center" data-align="right">节点编码长度</th>
			                <th data-field="description" data-halign="center" data-align="left">说明</th>
			            </tr>
			        </thead>
				</table>
  			</div>
  			
  			<div class="col-md-4" style="padding-left:5px;padding-right:5px;">
  				<div class="bootstrap-table">
					<div class="fixed-table-toolbar">
						<div class="bars pull-left">
							<div id="dsdToolbar">
								<button id="refreshDSNBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="initDSNTree();">
						            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
						        </button>
								<button id="addDSNBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addDSN();">
						            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
						        </button>
						        <button id="editDSNBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editDSN();">
						            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
						        </button>
						        <button id="configNodeAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="configNodeAttribute();">
						            <i class="glyphicon glyphicon-list-alt"></i>&nbsp;扩展属性
						        </button>
							</div>
						</div>
					</div>
					<div class="fixed-table-container" style="padding-top:5px;padding-bottom:0px;border:0px;">
						<div class="fixed-table-body">
							<div id="dsnTree" style="font-size:12px;height:450px">
								
							</div>
						</div>
					</div>
				</div>
  			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var currentDSDCode;
var currentDSDRule;
var currentDSNCode;
var currentNodeId;
var currentExpandNodeArr;

$(document).ready(function() {
	$("#dsdTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentDSDCode = row.struct_code;
        currentDSDRule = row.node_code_rule;
        
        currentDSNCode = '';
        currentNodeId = '';
        currentExpandNodeArr = null;
        
        initDSNTree();
    });
	
	$("#dsdTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentDSDCode = row.struct_code;
        currentDSDRule = row.node_code_rule;
        
        editDSD();
    });
	
	queryDSDList();
});


// 获取数据结构类型列表
function queryDSDList() {
	$("#dsdTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/datastruct/getDataStructDefineList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#dsdTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentDSDCode = null;
				currentDSDRule = null;
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

// 新建数据结构
function addDSD() {
	var url = "<%=context%>/app/sys/datastruct/DataStructDefineAdd";
	
	var structDefineAddFrame = '<iframe id="structDefineAddFrame" class="my-modal-iframe" width="100%" height="250px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据结构-新建",
		message: structDefineAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("structDefineAddFrame").contentWindow.doAddDataStructDefine();
	      			if (result) {
	      				queryDSDList();
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

// 编辑数据结构
function editDSD() {
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/DataStructDefineEdit";
	url += "?structCode=" + currentDSDCode;
	
	var structDefineEditFrame = '<iframe id="structDefineEditFrame" class="my-modal-iframe" width="100%" height="250px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据结构-编辑",
		message: structDefineEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("structDefineEditFrame").contentWindow.doEditDataStructDefine();
	      			if (result) {
	      				queryDSDList();
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

// 配置数据结构属性
function configStructAttribute() {
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/DataStructAttributeConfig";
	url += "?structCode=" + currentDSDCode;
	
	var structAttributeConfigFrame = '<iframe id="structAttributeConfigFrame" class="my-modal-iframe" width="100%" height="375px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据结构-扩展属性",
		message: structAttributeConfigFrame,
		size: "large"
	});
}

// 获取数据结构节点树
function initDSNTree(){
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/getDataStructNodeTree";
	url += "?currentTime=" + new Date();
	url += "&structCode=" + currentDSDCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
		
			if (json.result_code == "Y") {
				$('#dsnTree').treeview({
					data: JSON.parse(json.result_info).nodes,
					onNodeSelected: onTreeNodeSelectedHandler,
					levels: 2,
				});
				
				if (currentNodeId) {
					$('#dsnTree').treeview('selectNode', [currentNodeId, {silent: true}]);
				}
				
				if (currentExpandNodeArr) {
					$.each(currentExpandNodeArr, function(index, d){
						$('#dsnTree').treeview('expandNode', [d.nodeId, {silent: true}]);
					});
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
		}
	});
}

// 树节点单击事件
function onTreeNodeSelectedHandler(event, data) {
	currentDSNCode = data.data.node_code;
	currentNodeId = data.nodeId;
}

function expandAllParentNode(nodeId) {
	if (nodeId) {
		$('#dsnTree').treeview('expandNode', [nodeId, {silent: true}]);
		
		var parentNode = $('#dsnTree').treeview('getParent', nodeId);
		if (parentNode) {
			expandAllParentNode(parentNode.nodeId);
		}
	}
}

// 新建数据结构节点
function addDSN() {
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	if (!currentDSNCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构节点！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/DataStructNodeAdd";
	url += "?structCode=" + currentDSDCode;
	url += "&parentNodeCode=" + currentDSNCode;
	url += "&nodeCodeRule=" + currentDSDRule;
	
	var structNodeAddFrame = '<iframe id="structNodeAddFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据结构节点-新建",
		message: structNodeAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("structNodeAddFrame").contentWindow.doAddDataStructNode();
	      			if (result) {
	      				currentExpandNodeArr = $('#dsnTree').treeview('getExpanded');
	      				initDSNTree();
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

// 编辑数据结构节点
function editDSN() {
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	if (!currentDSNCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构节点！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/DataStructNodeEdit";
	url += "?structCode=" + currentDSDCode;
	url += "&nodeCode=" + currentDSNCode;
	
	var structNodeEditFrame = '<iframe id="structNodeEditFrame" class="my-modal-iframe" width="100%" height="200px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据结构节点-编辑",
		message: structNodeEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("structNodeEditFrame").contentWindow.doEditDataStructNode();
	      			if (result) {
	      				currentExpandNodeArr = $('#dsnTree').treeview('getExpanded');
	      				initDSNTree();
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

// 配置数据结构节点属性
function configNodeAttribute() {
	if (!currentDSDCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构！"
		});
		return;
	}
	
	if (!currentDSNCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据结构节点！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datastruct/DataStructNodeAttributeConfig";
	url += "?structCode=" + currentDSDCode;
	url += "&nodeCode=" + currentDSNCode;
	
	var nodeAttributeConfigFrame = '<iframe id="nodeAttributeConfigFrame" class="my-modal-iframe" width="100%" height="300px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据结构节点-扩展属性",
		message: nodeAttributeConfigFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			return window.top.document.getElementById("nodeAttributeConfigFrame").contentWindow.saveDataStrucNodeAttributes();
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