<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chinasofti.vo.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>大学生贷款申请系统-管理员端</title>
		<meta name="keywords" content="管理员首页">
		<meta name="description" content="home_admin 管理员首页">
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
			.report-file {
				display: block;
				position: relative;
				width: 120px;
				height: 28px;
				overflow: hidden;
				border: 1px solid #428bca;
				background: none repeat scroll 0 0 #428bca;
				color: #fff;
				cursor: pointer;
				text-align: center;
				float: right;
				margin-right:10px;
			}
			.report-file span {
				cursor: pointer;
				display: block;
				line-height: 28px;
			}
			.file-prew {
				position: absolute;
				top: 0;
				left:0;
				width: 120px;
				height: 30px;
				font-size: 100px;
				opacity: 0;
				filter: alpha(opacity=0);
				cursor: pointer;
			}
		</style>
		
		<script language="javascript" type="text/javascript">
			//网页一加载就调用showTime()函数；
			window.onload = function() {
					showTime(); 
				}
			//js获取日期
			function showTime() {
				var now = new Date();
				var year = now.getFullYear();
				var month = now.getMonth();
				var date = now.getDate();
				//获取相应ID
				document.getElementById("datetime").innerHTML = "今天是：" + year + "年" + (month + 1) + "月" + date + "日";
			}
		</script>
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
					<!--<li class="li1"><a class="active" href="hui_demo2.html">新闻</a></li>-->
					<li class="item">
						<h4>公告<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/notice_add_admin"">添加公告</a>
							<br>
							<a href="${pageContext.request.contextPath}/notice/showAllNotice">查询公告</a>
						</div>
					</li>
					<li class="item">
						<h4>贷款<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/request_add_admin">添加申请</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest">查询申请</a>
						</div>
					</li>
					<li class="item">
						<h4>用户<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/showAllStudent" class="active">学生用户</a>
							<br>
							<a href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">学校用户</a>
							<br>
							<a href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">银行用户</a>
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
				<nav class="breadcrumb">用户<span class="c-666 en">&gt;</span><span class="c-666">学生用户</span></nav>

				<!--搜索框-->
				<br />
				<div class="clearfix">
					<form method="get" action="${pageContext.request.contextPath}/student/search_admin">
						<input type="text" placeholder="请输入关键词" class="input-text ac_input" name="keyword" value="" id="keyword" autocomplete="off" style="width:300px">
						<button type="submit" class="btn btn-primary radius" id="search_button">搜索</button>
						<!--添加用户按钮-->
						<a class="btn btn-primary radius" href="${pageContext.request.contextPath}/admin/user_student_add_admin">添加用户</a>
						<a class="btn btn-primary radius" href="${pageContext.request.contextPath}/student/download">下载excel模板</a>
						<div class="report-file">
							<span onclick="document.getElementById('x').click()">上传文件</span>
						</div>
						<div class="report-file">
							<span>提交</span><input tabindex="3" size="3" name="report" class="file-prew" type="button" onclick="document.getElementById('f1').submit()">
						</div>
					</form>
					<form id="f1" action="${pageContext.request.contextPath}/student/upload" style="display: none" method="post" enctype="multipart/form-data">
						<input id="x" name="file" type="file">
					</form>
				</div>

				<!--显示所有用户-->
				<br />
				<br />
				<table id="student" class="table table-border table-bordered table-hover">
					<thead class="text-c">
						<tr>
							<th>学号</th>
							<th>姓名</th>
							<th>学校</th>
							<th>贷款次数</th>
							<th>查看</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${all}" var="student" begin="0" step="1">
						<tr class="text-c">
							<td>${student.getS_id() }</td>
							<td>${student.getS_name() }</td>
							<td>${student.getS_school() }</td>
							<td>${student.getS_creditFlag() }</td>
							<td><a class="btn btn-primary radius size-MINI" href="${pageContext.request.contextPath}/student/showStudentDetail_admin?s_id=${student.getS_id() }">查看</a></td>
							<td><a class="btn btn-primary radius size-MINI" href="${pageContext.request.contextPath}/student/showStudentDetail_admin?s_id=${student.getS_id() }">修改</a></td>
							<td><input class="btn btn-danger radius size-MINI"
							type="button" onClick="delete_check('${student.getS_id() }')" value="删除"></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<!--普通弹出层-->
		<div id="modal-demo-delete" class="modal fade middle" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content radius">
					<div class="modal-header">
						<h3 class="modal-title">删除用户</h3>
						<a class="close" data-dismiss="modal" aria-hidden="true"
							href="javascript:void();">×</a>
					</div>
					<div class="modal-body">
						<p>确定删除该用户吗</p>
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
			var id = new String();
			function delete_check(s_id) {
				id = s_id;
				$("#modal-demo-delete").modal("show");
			}
			function delete_yes(){
				window.location.href = "${pageContext.request.contextPath}/student/delete_admin?s_id="+id;
			}
		</script>
			
			<!--返回顶部  -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script>
				$.Huitotop();
			</script>
		</div>
</body>
</html>