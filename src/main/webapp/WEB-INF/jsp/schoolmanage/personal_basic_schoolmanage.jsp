<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chinasofti.vo.SchoolManage"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>大学生贷款申请系统-学校教师端</title>
		<link rel="Bookmark" href="favicon.ico">
		<link rel="Shortcut Icon" href="favicon.ico" />

		<!--CSS文件引用 -->
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/static/h-ui/css/H-ui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/student.css" type="text/css" />

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
			
			#menu .item a:hover:not(.active) {
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
					<a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/login">大学生贷款申请系统</a>
					<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="${pageContext.request.contextPath}/index">贷款申请</a>
					<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
					<nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
						<ul class="cl">

						</ul>
					</nav>
					<nav class="navbar-userbar hidden-xs">
					</nav>
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
						<h4>公告<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/notice/showBankNotice_schoolmanage">银行公告</a>
							<br>
							<a href="${pageContext.request.contextPath}/notice/showSchoolNotice_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">学校公告</a>
						</div>
					</li>
					<li class="item">
						<h4>贷款<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">未审批</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllCompleteRequest_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">已审批</a>
						</div>
					</li>
					<li class="item">
						<h4>个人资料<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/schoolmanage/showSchoolManageDetail_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>" class="active">基本资料</a>
						</div>
					</li>
				</ul>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
				<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery.Huifold.js"></script>
				<script>
					$("#Huifold1").Huifold({
						titCell: '.item h4',
						mainCell: '.item .info',
						type: 1,
						trigger: 'click',
						className: "selected",
						speed: "first",
					});
				</script>
			</div>

			<!--页面主要内容  -->
			<div id="main" style="margin-left:16.67%;padding:1px 16px;height:1000px;">
				<!--面包屑导航  -->
				<nav class="breadcrumb">个人资料<span class="c-666 en">&gt;</span><span class="c-666">基本资料</span></nav>
				
				<!--返回按钮-->
				<br />
				<a href="#" class="btn btn-default radius" onClick="javascript :history.back(-1);"><i class="Hui-iconfont">&#xe6d4;</i>&nbsp;返回</a>

				<form action="${pageContext.request.contextPath}/schoolmanage/modifySchoolManage" method="post" class="form form-horizontal" id="demoform-2">
					<div class="panel panel-default mt-20">
						<div class="panel-header">用户资料</div>

						<div class="panel-body" style="height: 300px;">
							<!--ID-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">用户ID：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${schoolManage.sm_id}" class="input-text radius size-M" placeholder="id" name="smId" id="sm_id" datatype="*">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<!--密码-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">密码：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${schoolManage.sm_pwd}" class="input-text radius size-M" name="smPwd" id="sm_pwd" datatype="*">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<!--姓名-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">姓名：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${schoolManage.sm_name}" class="input-text radius size-M" name="smName" id="sm_name" datatype="*">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<div style="height: 8px;"></div>
							<!--电话-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">联系电话：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${schoolManage.sm_phone}" class="input-text radius size-M" name="smPhone" id="sm_phone" datatype="*">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
						</div>

					</div>
					<div class="row cl">
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit"
								   value="&nbsp;&nbsp;修改&nbsp;&nbsp;"
								   style="background-color: #68838B;">
						</div>
					</div>
					<!--调整布局  -->
					<div style="height: 150px;"></div>
				</form>
			</div>
			
			<!--返回顶部  -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script>
				$.Huitotop();
			</script>
			
			<!--表单验证插件-->
		<script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/messages_zh.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/Validform/5.3.2/Validform.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/Validform/5.3.2/passwordStrength-min.js"></script>
		<script type="text/javascript">
			$("#menu_3 dt").addClass("selected");
			$("#menu_3 dd").show();
			$(function() {
				$('.skin-minimal input').iCheck({
					checkboxClass: 'icheckbox-blue',
					radioClass: 'iradio-blue',
					increaseArea: '20%'
				});
				$("#tab-form").Huitab();
			});
		</script>
		</div>
</body>
</html>