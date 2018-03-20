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

	<title>系统设置</title>

	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
</head>
<body>
	<div class="container-fluid" style="margin:0px;padding:0px;">
		<div class="row" style="margin:0px;padding:0px;">
			<div class="col-md-2" style="padding:5px;">
				<ul id="parameterTypeList" class="nav nav-pills nav-stacked" role="tablist">
					
				</ul>
			</div>
			
			<div class="col-md-10" style="padding:5px;">
				<iframe id="parameterFrame" name="parameterFrame" style="display:block;width:100%;border:1px solid #dddddd;margin:0px;padding:0px;" onload="this.height=$(document).height()-10"></iframe>
			</div>
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
var ptList;

$(document).ready(function() {
	initParameterTypeList();
});

function initParameterTypeList() {
	var url = "<%=context%>/app/sys/parameter/getParameterTypeList";
	url += "?t=" + new Date();
	
	$.post(url, function(data) {
		var json = JSON.parse(data);
		
		if (json.result_code == "Y") {
			ptList = JSON.parse(json.result_info);
			
			var html = '';
			$.each(ptList, function(index, d){
				html += '<li role="presentation"';
				if (index == 0) {
					html += ' class="active"'
				}
				html += '>';
				html += '<a id="' + d.type_code + '" href="#" onclick="initParameterConfig(\'' + d.type_code + '\')">';
				html += d.type_name;
				html += '</a>';
				html += '</li>';
		    });
			
			$("#parameterTypeList").append(html);
			
			initParameterConfig(ptList[0].type_code);
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
}

function initParameterConfig(typeCode) {
	$('ul.nav-pills li.active').removeClass('active');
	$("#" + typeCode).parent('li').addClass('active');
	$("#parameterFrame").attr("src", "<%=context%>/app/sys/parameter/ParameterConfigDetail?typeCode=" + typeCode);
}
</script>