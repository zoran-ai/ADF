<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%@ page import="org.adf.application.common.mybatis.entity.SysLovDefine"%>
<%@ page import="org.adf.application.common.mybatis.entity.SysLovColumn"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();

	// 值列表编码
	String lovCode = request.getParameter("lovCode") == null ? "" : request.getParameter("lovCode");
	// 值列表类型[单选:single;多选:multi]
	String lovType = request.getParameter("lovType") == null ? "single" : request.getParameter("lovType");
	// 值列表字段信息
	List<SysLovColumn> slcList = (List<SysLovColumn>) request.getAttribute("LovColumnList");
	// 返回值列
	String returnValueColumn = (String) request.getAttribute("returnValueColumn");
	// 返回文本列
	String returnTextColumn = (String) request.getAttribute("returnTextColumn");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>值列表</title>

	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	<%@ include file="/jsp/common/include/fonts.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/Lov.js'></script>
	
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
			    <table id="lovTable"
			    	   class="table table-condensed"
			           data-toggle="table"
			           data-height="387"
			           data-icon-size="sm"
			           data-pagination="true"
			           data-page-size="10"
			           data-page-list="[10,15,20,25,30]"
			           data-striped="true"
			           data-search="true">
			    	<thead>
			           	<tr>
			           		<%
			           			if ("multi".equals(lovType)) {
			           		%>
			           				<th data-field="state" data-checkbox="true" data-halign="center" data-align="center"></th>
			           		<%
			           			}
			           		%>
			           	
			           		<%
			           			for (SysLovColumn column : slcList) {
			           				if ("Y".equals(column.getDisplay_flag())) {
			           		%>
			           					<th data-field="<%=column.getColumn_name()%>" data-halign="center" data-align="left" data-sortable="true"><%=column.getColumn_title()%></th>			
			           		<%		
			           				}
			           			}
			           		%>
			            </tr>
			    	</thead>
				</table>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var lovCode = "<%=lovCode%>";
var lovType = "<%=lovType%>";
var returnValueColumn = "<%=returnValueColumn%>";
var returnTextColumn = "<%=returnTextColumn%>";

var LovRow = null;

$(document).ready(function() {
	$("#lovTable").on('click-row.bs.table', function (e, row, $element) {
        $('.warning').removeClass('warning');
        $($element).addClass('warning');
        
        LovRow = row;
    });
	
	var url = "<%=context%>/app/common/lov/getLovDataList";
    url += "?currentTime=" + new Date();
    url += "&lovCode=" + lovCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
			
			if (json.result_code == "Y") {
				$("#lovTable").bootstrapTable("load", JSON.parse(json.result_info));
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
});

function getLovData() {
	if (lovType == "single") {
		var lov = new Lov();
		lov.lov_value = LovRow[returnValueColumn];
		lov.lov_text = LovRow[returnTextColumn];
		return lov;
	} else if (lovType == "multi") {
		var lovArr = new Array();
		var rows = $("#lovTable").bootstrapTable("getSelections");
		for(var i=0; i <rows.length; i++) {
			var lov = new Lov();
			lov.lov_value = rows[i][returnValueColumn];
			lov.lov_text = rows[i][returnTextColumn];
			lovArr.push(lov);
		}
		return lovArr;
	}
}
</script>