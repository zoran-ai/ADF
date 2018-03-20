<%@ page contentType="text/html; chartset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="org.adf.application.common.mybatis.vo.SecurityContext"%>
<%
	SecurityContext securityContext = (SecurityContext)session.getAttribute("SecurityContext");
	String adminLTESkin = securityContext.getAdminLTESkin();
	String bootstrapSkin = securityContext.getBootstrapSkin();

	// 数据结构编码
	String structCode = request.getParameter("structCode") == null ? "" : request.getParameter("structCode");
	// 树列表类型[单选:single;多选:multi]
	String treeType = request.getParameter("treeType") == null ? "single" : request.getParameter("treeType");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

	<title>树列表</title>

	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	
	<script type='text/javascript' src='<%=context%>/js/json/model/Lot.js'></script>
	
	<!-- bootstrap-treeview -->
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-treeview/css/bootstrap-treeview.css">
	
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-treeview/js/bootstrap-treeview.js"></script>
</head>
<body>
	<div class="container-fluid" style="margin:0px;padding:0px;">
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-12" style="padding-left:5px;padding-right:5px;">
			    <div id="lotTree" style="font-size:12px;height:400px">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var structCode = "<%=structCode%>";
var treeType = "<%=treeType%>";

var LotData = null;

$(document).ready(function() {
	var url = "<%=context%>/app/common/lot/getTreeList";
	url += "?currentTime=" + new Date();
	url += "&structCode=" + structCode;
    
    $.ajax({
		type: "get",
		url: url,
		datatype: "jsonp",
		success: function(data) {
			var json = JSON.parse(data);
		
			if (json.result_code == "Y") {
				$('#lotTree').treeview({
					data: JSON.parse(json.result_info).nodes,
					onNodeSelected: onTreeNodeSelectedHandler,
					levels: 2,
				});
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

// 树节点单击事件
function onTreeNodeSelectedHandler(event, data) {
	LotData = data;
}

// 获取树列表数据
function getLotData() {
	if (treeType == "single") {
		var lot = new Lot();
		lot.lot_value = LotData.data.node_code;
		lot.lot_text = LotData.text;
		return lot;
	} else if (treeType == "multi") {
		var lotArr = new Array();
		return lovArr;
	}
}
</script>