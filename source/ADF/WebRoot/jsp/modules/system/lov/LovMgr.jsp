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

	<title>值列表管理</title>

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
			<div class="col-md-12" style="margin:0px;padding:0px;">
            	<div id="lovToolbar">
            		<button id="refreshLovBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="queryLovList();">
			            <i class="glyphicon glyphicon-refresh"></i>&nbsp;刷新
			        </button>
					<button id="addLovBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addLov();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editLovBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editLov();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="lovTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#lovToolbar"
			           data-height="100%"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="10"
			           data-page-list="[10,15,20,25,30]"
			           data-striped="true"
			           data-search="true">
			        <thead>
			           	<tr>
			                <th data-field="lov_code" data-halign="center" data-align="left" data-sortable="true">值列表编码</th>
			                <th data-field="lov_name" data-halign="center" data-align="left" data-sortable="true">值列表名称</th>
			                <th data-field="view_name" data-halign="center" data-align="left" data-sortable="true">视图</th>
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
var currentLovCode;

$(document).ready(function() {
	$("#lovTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentLovCode = row.lov_code;
    });
	
	$("#lovTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentLovCode = row.lov_code;
        
        editLov();
    });
	
	queryLovList();
});

// 获取数据字典类型列表
function queryLovList() {
	$("#lovTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/lov/getLovDefineList";
    url += "?currentTime=" + new Date();
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#lovTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentLovCode = null;
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

// 新建值列表
function addLov() {
	var url = "<%=context%>/app/sys/lov/LovConfig?operationType=add";
	
	var lovAddFrame = '<iframe id="lovAddFrame" class="my-modal-iframe" width="100%" height="400px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "值列表-新建",
		message: lovAddFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lovAddFrame").contentWindow.doSaveLov();
	      			if (result) {
	      				queryLovList();
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

// 编辑值列表
function editLov() {
	if (!currentLovCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择值列表！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/lov/LovConfig?operationType=edit";
	url += "&lovCode=" + currentLovCode;
	
	var lovEditFrame = '<iframe id="lovEditFrame" class="my-modal-iframe" width="100%" height="400px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "值列表-编辑",
		message: lovEditFrame,
		size: "middle",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("lovEditFrame").contentWindow.doSaveLov();
	      			if (result) {
	      				queryLovList();
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