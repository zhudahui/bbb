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
							<br>
							<a href="${pageContext.request.contextPath}/notice/showBankNotice_schoolmanage">银行公告</a>
							<br>
							<a href="${pageContext.request.contextPath}/notice/showSchoolNotice_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">学校公告</a>
						</div>
					</li>
					<li class="item">
						<h4>贷款<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>" class="active">未审批</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllCompleteRequest_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">已审批</a>
						</div>
					</li>
					<li class="item">
						<h4>个人资料<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/schoolmanage/showSchoolManageDetail_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>">基本资料</a>
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
				<nav class="breadcrumb">贷款<span class="c-666 en">&gt;</span><span class="c-666">未审批</span></nav>
				
				<!--搜索框-->
			<br />
			<div class="clearfix">
				<form method="get" action="${pageContext.request.contextPath}/creditrequest/search_notcomplete_schoolmanage">
					<input type="text" placeholder="请输入关键词" class="input-text ac_input"
						name="keyword" value="" id="keyword" autocomplete="off"
						style="width: 300px">
					<button type="submit" class="btn btn-default" id="search_button">搜索</button>
				</form>
			</div>

			<!--显示所有贷款申请内容-->
			<br />
			<table class="table table-border table-bordered table-hover">
				<thead class="text-c">
					<tr>
						<th>申请书编号</th>
						<th>申请人</th>
						<th>贷款金额</th>
						<th>用途</th>
						<th>贷款日期</th>
						<th>申请日期</th>
						<th>查看</th>
					</tr>
				</thead>
				<%
					ArrayList<CreditRequest> all = (ArrayList<CreditRequest>) request.getAttribute("all");
					if (all != null) {
						//遍历
						for (int i = 0; i < all.size(); i++) {
							CreditRequest creditrequest = all.get(i);
							int r_id = creditrequest.getR_id();
							String s_id = creditrequest.getS_id();
							String requestdate = creditrequest.getRequestdate();
							int money = creditrequest.getMoney();
							String use = creditrequest.getUse_type();
							String starttime = creditrequest.getStarttime();
				%><tbody>
				<tr class="text-c">
					<td><%=r_id%></td>
					<td><%=s_id%></td>
					<td><%=money%></td>
					<td><%=use%></td>
					<td><%=starttime%></td>
					<td><%=requestdate%></td>
					<td><a
						href="${pageContext.request.contextPath}/creditrequest/showNotCompleteCreditRequestDetail_schoolmanage?r_id=<%=creditrequest.getR_id()%>&s_id=<%=creditrequest.getS_id()%>"
						class="btn btn-primary radius size-MINI">查看</a>&nbsp;&nbsp;<a
							href="${pageContext.request.contextPath}/score/showScore_school?s_id=<%=creditrequest.getS_id()%>"
							class="btn btn-primary radius size-MINI">查看成绩</a></td>
				</tr>
				</tbody>
				<%
					}
					}
				%>
			</table>
			</div>
			<!--返回顶部  -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script>
				$.Huitotop();
			</script>
		</div>
</body>
</html>