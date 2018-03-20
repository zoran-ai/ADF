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
	<title>ADF</title>
	<%@ include file="/jsp/common/include/common.jsp"%>
	<%@ include file="/jsp/common/include/jquery.jsp"%>
	<%@ include file="/jsp/common/include/json.jsp"%>
	<%@ include file="/jsp/common/include/fonts.jsp"%>
	<%@ include file="/jsp/common/include/bootstrap.jsp"%>
	<%@ include file="/jsp/common/include/adminlte.jsp"%>
	
	<!-- bootstrap-addtabs -->
	<link type="text/css" rel="stylesheet"
		href="<%=context%>/js/plugins/bootstrap-addtabs/css/bootstrap-addtabs.css">
	
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-addtabs/js/bootstrap-addtabs.js"></script>
	
	<!-- bootstrap-box -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/bootstrap-box/js/bootbox.js"></script>
			
	<!-- jquery scroll -->
	<script type="text/javascript"
		src="<%=context%>/js/plugins/jquery-slimscroll/jquery.slimscroll.min.js"></script>
		
	<style type="text/css">
		html {
			overflow-x:hidden;
			overflow-y:hidden;
		}
		
		body {
			overflow-x:hidden;
			overflow-y:hidden;
		}
	</style>
</head>
<body class="hold-transition skin-<%=adminLTESkin%> fixed sidebar-mini">
	<header class="main-header">
		<!-- Logo -->
		<a href="#" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>ADF</b></span>
			
			<!-- logo for regular state and mobile devices -->
			<span class="logo-lg">App Develop Frame</span>
		</a>
		
		<!-- Header Navbar: style can be found in header.less -->
		<nav class="navbar navbar-static-top">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
				<span class="sr-only">Toggle navigation</span>
			</a>

			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">
					<!-- Notifications -->
					<li class="dropdown notifications-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-commenting"></i>
							<span class="label label-info">10</span>
						</a>
						
						<ul class="dropdown-menu">
							<li class="header">您有 10 条通知</li>
							<li>
								<!-- inner menu: contains the actual data -->
								<ul class="menu">
									<li>
										<a href="#">
											<i class="fa fa-users text-aqua"></i>
											欢迎使用ADF
										</a>
									</li>
								</ul>
							</li>
							<li class="footer">
								<a href="#">更多</a>
							</li>
						</ul>
					</li>
					
					<!-- User Account: style can be found in dropdown.less -->
					<li class="dropdown user user-menu">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img src="<%=context%>/js/adminlte/img/user2-160x160.jpg" class="user-image" alt="User Image">
							<span class="hidden-xs">sysadmin</span>
						</a>
						
						<ul class="dropdown-menu">
							<!-- User image -->
							<li class="user-header">
								<img src="<%=context%>/js/adminlte/img/user2-160x160.jpg" class="img-circle" alt="User Image">
								<p>
									超级管理员
								</p>
							</li>
							<!-- Menu Body -->
							<%--<li class="user-body">
								<div class="row">
									<div class="col-xs-4 text-center">
										<a href="#">Followers</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Sales</a>
									</div>
									<div class="col-xs-4 text-center">
										<a href="#">Friends</a>
									</div>
								</div>
								<!-- /.row -->
							</li>
							--%><!-- Menu Footer-->
							<li class="user-footer">
								<div class="pull-left">
									<a href="#" class="btn btn-default btn-flat">个人信息</a>
								</div>
								<div class="pull-right">
									<a href="#" class="btn btn-default btn-flat">安全退出</a>
								</div>
							</li>
						</ul>
					</li>
					
					<!-- Control Sidebar Toggle Button -->
					<li>
						<a href="#" data-toggle="control-sidebar">
							<i class="fa fa-gears"></i>
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</header>

	<!-- Left side column. contains the sidebar -->
  	<aside class="main-sidebar">
    	<!-- sidebar -->
    	<section class="sidebar">
    		<!-- sidebar menu -->
			<ul id="sidebarMenu" class="sidebar-menu">
				
			</ul>
		</section>
    </aside>

	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<!-- Main content -->
		<section class="content" style="padding:5px;">
			<div id="tabs" class="nav-tabs-custom" style="margin-bottom:0px">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist" style="font-size:13px;font-weight:600;color:#666;">
					<li id="tab_home" role="presentation" class="active">
						<a href="#home" aria-controls="home" role="tab" data-toggle="tab">
							<i class="fa fa-home"></i>&nbsp;主页&nbsp;
						 </a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content" style="padding:5px">
					<div role="tabpanel" class="tab-pane active" id="home">
						<iframe id="homeFrame" name="homeFrame" class="iframeClass" onload="this.height=$(document).height() - 112"></iframe>
					</div>
				</div>
			</div>
		</section>
		<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li class="active">
				<a href="#control-sidebar-skin-tab" data-toggle="tab">
					<i class="fa fa-desktop"></i>&nbsp;&nbsp;皮肤
				</a>
			</li>
			<li>
				<a href="#control-sidebar-settings-tab" data-toggle="tab">
					<i class="fa fa-gears"></i>&nbsp;&nbsp;设置
				</a>
			</li>
		</ul>
		
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Skin tab content -->
			<div class="tab-pane active" id="control-sidebar-skin-tab">
				<ul class="list-unstyled clearfix">
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-blue" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-blue-active"></span>
								<span class="bg-blue" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">蓝色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-blue-light" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-blue-active"></span>
								<span class="bg-blue" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">浅蓝色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-red" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-red-active"></span>
								<span class="bg-red" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">红色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-red-light" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-red-active"></span>
								<span class="bg-red" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">浅红色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-yellow" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-yellow-active"></span>
								<span class="bg-yellow" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">黄色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-yellow-light" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-yellow-active"></span>
								<span class="bg-yellow" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">浅黄色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-green" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-green-active"></span>
								<span class="bg-green" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #222d32;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">绿色</p>
					</li>
					
					<li style="float:left; width: 80%; padding: 5px;">
						<a href="javascript:void(0);" data-skin="skin-green-light" style="display: block; box-shadow: 0 0 3px rgba(0,0,0,0.4)" class="clearfix full-opacity-hover">
							<div>
								<span style="display:block; width: 20%; float: left; height: 7px;" class="bg-green-active"></span>
								<span class="bg-green" style="display:block; width: 80%; float: left; height: 7px;"></span>
							</div>
							<div>
								<span style="display:block; width: 20%; float: left; height: 20px; background: #f9fafc;"></span>
								<span style="display:block; width: 80%; float: left; height: 20px; background: #f4f5f7;"></span>
							</div>
						</a>
						<p class="text-center no-margin">浅绿色</p>
					</li>
				</ul>
			</div>
			<!-- /.tab-pane -->
			
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">一般设置</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading">
							是否显示通知
							<input type="checkbox" class="pull-right" checked>
						</label>

						<p>是：接收系统通知；否：不接收系统通知</p>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->

	<!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
</body>
</html>
<script type="text/javascript">
var menuTreeHtml = '';

$(document).ready(function() {
	// 初始化菜单
	initTreeMenu();
	// 初始化标签页
	$('#tabs').addtabs();
});

// 初始化树菜单
function initTreeMenu() {
	var url = "<%=context%>/app/getMenuTree";
	url += "?t=" + new Date();	
	
	$.ajax({
		type: "post",
	    url: url,
	    dataType: "text",
	    success: function(text, status){
			var json = JSON.parse(text);
			
			if (json.result_code == "Y") {
				var menuTreeJson = JSON.parse(json.result_info);
				
				$.each(menuTreeJson, function(index, data){
					if (data.data.is_leaf_node == "Y") {
						menuTreeHtml += '<li>';
						menuTreeHtml += '<a href="javascript:addMenuTab(\'' + data.data.node_code + '\',\'' + data.data.node_name + '\',\'' + data.data.node_url + '\',\'' + data.data.function_code + '\')">';
						if (data.data.node_icon) {
							menuTreeHtml += '		<i class="fa ' + data.data.node_icon + '"></i>';
						} else {
							menuTreeHtml += '		<i class="fa fa-sticky-note"></i>';
						}
						menuTreeHtml += data.data.node_name;
						menuTreeHtml += '	</a>';
						menuTreeHtml += '</li>';
					} else if (data.data.is_leaf_node == "N") {
						menuTreeHtml += '<li class="treeview">';
						menuTreeHtml += '<a href="#">';
						if (data.data.node_icon) {
							menuTreeHtml += '<i class="fa ' + data.data.node_icon + '"></i>';
						} else {
							menuTreeHtml += '<i class="fa fa-folder-open"></i>';
						}
						menuTreeHtml += '<span>' + data.data.node_name + '</span>';
						menuTreeHtml += '<span class="pull-right-container">';
						menuTreeHtml += '<i class="fa fa-angle-left pull-right"></i>';
						menuTreeHtml += '</span>';
						menuTreeHtml += '</a>';
						
						menuTreeHtml += '<ul class="treeview-menu according">';
						
						generateMenuTree(data);
						
						menuTreeHtml += '</ul>';
						
						menuTreeHtml += '</li>';
					}
			    });
				
				$("#sidebarMenu").html(menuTreeHtml);
			}
	    }
	});
}

// 递归生成子菜单树
function generateMenuTree(treeData) {
	$.each(treeData.nodes, function(index, data){
		if (data.data.is_leaf_node == "Y") {
			menuTreeHtml += '<li>';
			menuTreeHtml += '<a href="javascript:addMenuTab(\'' + data.data.node_code + '\',\'' + data.data.node_name + '\',\'' + data.data.node_url + '\',\'' + data.data.function_code + '\')">';
			if (data.data.node_icon) {
				menuTreeHtml += '<i class="fa ' + data.data.node_icon + '"></i>';
			} else {
				menuTreeHtml += '<i class="fa fa-sticky-note"></i>';
			}
			menuTreeHtml += data.data.node_name;
			menuTreeHtml += '</a>';
			menuTreeHtml += '</li>';
		} else if (data.data.is_leaf_node == "N") {
			menuTreeHtml += '<li class="treeview">';
			menuTreeHtml += '<a href="#">';
			if (data.data.node_icon) {
				menuTreeHtml += '<i class="fa ' + data.data.node_icon + '"></i>';
			} else {
				menuTreeHtml += '<i class="fa fa-folder-open"></i>';
			}
			menuTreeHtml += '<span>' + data.data.node_name + '</span>';
			menuTreeHtml += '<span class="pull-right-container">';
			menuTreeHtml += '<i class="fa fa-angle-left pull-right"></i>';
			menuTreeHtml += '</span>';
			menuTreeHtml += '</a>';
			
			menuTreeHtml += '<ul class="treeview-menu">';
			
			generateMenuTree(data);
			
			menuTreeHtml += '</ul>';
			
			menuTreeHtml += '</li>';
		}
    });
}

// 创建标签页
function addMenuTab(menuCode, menuName, menuUrl, functionCode) {
	if (menuUrl) {
		var iframeUrl = context + menuUrl;
		iframeUrl += "?menuCode=" + menuCode;
		iframeUrl += "&functionCode=" + functionCode;
		
		Addtabs.add({
			id : menuCode,
			title : menuName,
			url : iframeUrl
		});
	}
}
</script>