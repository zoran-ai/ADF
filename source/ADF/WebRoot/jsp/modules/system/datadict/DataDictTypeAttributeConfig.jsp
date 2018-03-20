<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();

	String typeCode = request.getParameter("typeCode");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>数据字典类型-扩展属性</title>

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
			<div class="col-md-12" style="padding-left:5px;padding-right:5px;">
				<div id="typeAttributeToolbar">
					<button id="addTypeAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="addTypeAttribute();">
			            <i class="glyphicon glyphicon-plus"></i>&nbsp;新建
			        </button>
			        <button id="editTypeAttributeBtn" class="btn btn-<%=bootstrapSkin%> btn-sm" onclick="editTypeAttribute();">
			            <i class="glyphicon glyphicon-pencil"></i>&nbsp;编辑
			        </button>
			    </div>
			    
			    <table id="typeAttributeTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-toolbar="#typeAttributeToolbar"
			           data-height="349"
			           data-icon-size="sm"
			           data-striped="true"
			           data-search="true">
			        <thead>
			           	<tr>
			                <th data-field="attribute_code" data-halign="center" data-align="left" data-sortable="true">属性编码</th>
			                <th data-field="attribute_name" data-halign="center" data-align="left" data-sortable="true">属性名称</th>
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
var typeCode = "<%=typeCode%>";

var currentAttributeCode;

$(document).ready(function() {
	$("#typeAttributeTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentAttributeCode = row.attribute_code;
    });
	
	$("#typeAttributeTable").on('dbl-click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        currentAttributeCode = row.attribute_code;
        
        editTypeAttribute();
    });
	
	queryTypeAttributeList();
});


// 获取数据字典类型属性列表
function queryTypeAttributeList() {
	$("#typeAttributeTable").bootstrapTable('removeAll');
	
	var url = "<%=context%>/app/sys/datadict/getDataDictTypeAttributeList";
    url += "?currentTime=" + new Date();
    url += "&typeCode=" + typeCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#typeAttributeTable").bootstrapTable("load", JSON.parse(json.result_info));
				
				currentAttributeCode = null;
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

// 新建数据字典类型属性
function addTypeAttribute() {
	var url = "<%=context%>/app/sys/datadict/DataDictTypeAttributeAdd";
	url += "?typeCode=" + typeCode;
	
	var typeAttributeAddFrame = '<iframe id="typeAttributeAddFrame" class="my-modal-iframe" width="100%" height="300px" src="' + url + '"></iframe>';
	window.top.bootbox.dialog({
		title: "数据字典类型-扩展属性-新建",
		message: typeAttributeAddFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeAttributeAddFrame").contentWindow.doAddDataDictTypeAttribute();
	      			if (result) {
	      				queryTypeAttributeList();
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

// 编辑数据字典类型属性
function editTypeAttribute() {
	if (!currentAttributeCode) {
		window.top.bootbox.alert({ 
		    size: 'small',
		    message: "请先选择数据字典类型属性！"
		});
		return;
	}
	
	var url = "<%=context%>/app/sys/datadict/DataDictTypeAttributeEdit";
	url += "?typeCode=" + typeCode;
	url += "&attributeCode=" + currentAttributeCode;
	
	var typeAttributeEditFrame = '<iframe id="typeAttributeEditFrame" class="my-modal-iframe" width="100%" height="300px" src="' + url + '"></iframe>';
	
	window.top.bootbox.dialog({
		title: "数据字典类型-扩展属性-编辑",
		message: typeAttributeEditFrame,
		size: "small",
		buttons: {
			saveType: {
	      		label: "保存",
	      		className: "btn-<%=bootstrapSkin%>",
	      		callback: function() {
	      			var result = window.top.document.getElementById("typeAttributeEditFrame").contentWindow.doEditDataDictTypeAttribute();
	      			if (result) {
	      				queryTypeAttributeList();
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