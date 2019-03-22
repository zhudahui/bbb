<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.chinasofti.vo.CreditRequest"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no" />
<title>管理员端查询贷款申请</title>
<meta name="keywords" content="管理员查询贷款申请">
<meta name="description" content="request_add_admin 管理员端查询贷款申请">
<link rel="Bookmark" href="favicon.ico">
<link rel="Shortcut Icon" href="favicon.ico" />

<!--CSS文件引用 -->
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/H-ui/static/h-ui/css/H-ui.css"
	rel="stylesheet" type="text/css" />
<link
	href="${pageContext.request.contextPath}/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/student.css"
	type="text/css" />

<!--CSS样式        -->
<style>
#menu {
	margin: 0;
}

#menu ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 16.67%;
	background-color: #f1f1f1;
	position: fixed;
	height: 100%;
	overflow: auto;
}

#menu .item a {
	display: block;
	color: #000;
	padding: 8px 16px;
	text-decoration: none;
}

#menu .item a.active {
	background-color: #68838B;
	color: white;
}

#menu .item a:hover:not (.active ) {
	background-color: #555;
	color: white;
}

#fenge {
	height: 45px;
}
</style>
</head>
<body>
	<!--头部导航栏        -->
	<header class="navbar-wrapper navbar-fixed-top">
	<div class="navbar navbar-black">
		<div class="container cl">
			<a class="logo navbar-logo f-l mr-10 hidden-xs"
				href="${pageContext.request.contextPath}/login">大学生贷款申请系统</a> <a
				class="logo navbar-logo-m f-l mr-10 visible-xs"
				href="${pageContext.request.contextPath}/index">贷款申请</a> <a
				aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs"
				href="javascript:;">&#xe667;</a>
			<nav class="nav navbar-nav nav-collapse" role="navigation"
				id="Hui-navbar">
			<ul class="cl">

			</ul>
			</nav>
			<nav class="navbar-userbar hidden-xs"> </nav>
		</div>
	</div>
	</header>

	<!--调整布局        -->
	<div id="fenge"></div>

	<div>
		<!--左侧菜单栏        -->
		<div id="menu">
			<ul id="Huifold1" class="Huifold">
				<li class="item">
					<h4>
						公告<b>+</b>
					</h4>
					<div class="info">
						<a href="${pageContext.request.contextPath}/notice_add_admin">添加公告</a>
						<br> <a
							href="${pageContext.request.contextPath}/notice/showAllNotice">查询公告</a>
					</div>
				</li>
				<li class="item">
					<h4>
						贷款<b>+</b>
					</h4>
					<div class="info">
						<a href="${pageContext.request.contextPath}/request_add_admin">添加申请</a>
						<br> <a
							href="${pageContext.request.contextPath}/creditrequest/showAllRequest"
							class="active">查询申请</a>
					</div>
				</li>
				<li class="item">
					<h4>
						用户<b>+</b>
					</h4>
					<div class="info">
						<a
							href="${pageContext.request.contextPath}/student/showAllStudent">学生用户</a>
						<br> <a
							href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">学校用户</a>
						<br> <a
							href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">银行用户</a>
					</div>
				</li>

				<li class="item">
					<h4>
						报表<b>+</b>
					</h4>
					<div class="info">
						<a href="${pageContext.request.contextPath}/creditrequest/showBaobiao">报表展示</a>
					</div>
				</li>
			</ul>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script type="text/javascript"
				src="${pageContext.request.contextPath}/js/jQuery.Huifold.js"></script>
			<script>
				$("#Huifold1").Huifold({
					titCell : '.item h4',
					mainCell : '.item .info',
					type : 1,
					trigger : 'click',
					className : "selected",
					speed : "first",
				});
			</script>
		</div>

		<!--页面主要内容  -->
		<div id="main" style="margin-left: 16.67%; padding: 1px 16px; height: 1000px;">
			<div id="chart1" style="width: 1300px;height:400px;"></div>
			<div id="chart2" style="width: 1300px;height:400px;"></div>
		</div>
	</div>

	<!--普通弹出层-->
		<div id="modal-demo-delete" class="modal fade middle" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content radius">
					<div class="modal-header">
						<h3 class="modal-title">删除申请</h3>
						<a class="close" data-dismiss="modal" aria-hidden="true"
							href="javascript:void();">×</a>
					</div>
					<div class="modal-body">
						<p>确定删除该申请吗</p>
					</div>
					<div class="modal-footer">
						<%-- <a class="btn btn-primary radius"
							href="${pageContext.request.contextPath}/notice/delete_schoolmanage?n_id=<%=id%>">确定</a> --%>
						<button id="delete" class="btn btn-primary radius" onClick="delete_yes()">确定</button>						
						<button class="btn radius" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>

		<script>
			var id = 0;
			function delete_check(r_id) {
				id = r_id;
				$("#modal-demo-delete").modal("show");
			}
			function delete_yes(){
				window.location.href = "${pageContext.request.contextPath}/creditrequest/delete_admin?r_id="+id;
			}
		</script>

	<!--返回顶部  -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/H-ui.js"></script>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
	<script type="text/javascript"
			src="${pageContext.request.contextPath}/js/baobiao.js"></script>
	<script>
		$.Huitotop();
	</script>
</body>
</html>