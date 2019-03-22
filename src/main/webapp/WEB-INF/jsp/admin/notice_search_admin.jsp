<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.chinasofti.vo.Notice"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="org.springframework.util.StringUtils" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>大学生贷款申请系统-管理员端</title>
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
							<a href="${pageContext.request.contextPath}/notice_add_admin">添加公告</a>
							<br>
							<a href="${pageContext.request.contextPath}/notice/showAllNotice"  class="active">查询公告</a>
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
						<h4>人员管理<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/showAllStudent">用户管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">医生管理</a>
						</div>
					</li>
					<li class="item">
						<h4>部门<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/showAllStudent">耳鼻咽喉科管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">护理科管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">儿科</a>
							<br>
							<a href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">普通外科</a>
							<br>
							<a href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">内科</a>
						</div>
					</li>
					<li class="item">
						<h4>预约管理<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/showAllStudent">预约管理</a>
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
				<nav class="breadcrumb">公告<span class="c-666 en">&gt;</span><span class="c-666">查询公告</span></nav>
			
			
				<!--搜索框-->
				<br />
				<div class="clearfix">
					<form method="get" action="${pageContext.request.contextPath}/notice/search">
						<input type="text" id="keyword" name="keyword" placeholder="请输入关键词" class="input-text ac_input" name="search_text" value="" autocomplete="off" style="width:300px">
						<button type="submit" class="btn btn-default" id="search_button" >搜索</button>
					</form>
				</div>

				<!--显示所有公告内容-->
				<br />
				<table class="table table-border table-bordered table-hover">
					<thead class="text-c">
						<tr>
							<th>公告编号</th>
							<th>标题</th>
							<th>类型</th><!--是学校还是银行-->
							<th>发布方</th>
							<th>发布日期</th>
							<th>查看</th>
							<th>修改</th>
							<th>删除</th>
						</tr>
					</thead>
					<%-- <tbody>
						<c:forEach items="${all}" var="notice" begin="0" step="1">
						<tr class="text-c">
							<td>${notice.getN_id() }</td>
							<td>${notice.getN_title() }</td>
							<c:choose>
							<c:when test="${notice.getN_type()  eq 's'}">
								<td>学校</td>
							</c:when>
							<c:otherwise>
							<c:if test="${notice.getN_type()  eq 'b'}">
								<td>银行</td>
							</c:if>
							</c:otherwise>
							</c:choose>
							<td>${notice.getN_author() }</td>
							<td>${notice.getN_date() }</td>
							<td><a href="${pageContext.request.contextPath}/notice/showNoticeDetail?n_id=${notice.getN_id() }" class="btn btn-primary radius size-MINI">查看</a></td>
							<!-- <td><input class="btn btn-primary radius size-MINI" type="button" onclick="" value="查看"></td> -->
							<td><input class="btn btn-primary radius size-MINI" type="button" onclick="" value="修改"></td>
							<td><input class="btn btn-danger radius size-MINI" type="button" onclick="" value="删除"></td>
						</tr>
						</c:forEach>
					</tbody> --%>
					 
						<%
							ArrayList<Notice> all = (ArrayList<Notice>) request.getAttribute("all");
							if (all != null) {
								//遍历
								for (int i = 0; i < all.size(); i++) {
									Notice notice = all.get(i);
									int n_id = notice.getN_id();
									String n_title = notice.getN_title();
									String n_author = notice.getN_author();
									String n_date = notice.getN_date();
									String n_type = notice.getN_type();
									if("s".equals(n_type)) {
									    n_type = "学校";
									} else {
										n_type = "银行";
									}
						%><tbody>
						<tr class="text-c">
						<td><%=n_id%></td>
						<td><%=n_title%></td>
						<td><%=n_type%></td>
						<td><%=n_author%></td>
						<td><%=n_date%></td>
						<td><a href="${pageContext.request.contextPath}/notice/showNoticeDetail?n_id=<%=notice.getN_id()%>" class="btn btn-primary radius size-MINI">查看</a></td>
						<td><a href="${pageContext.request.contextPath}/notice/showNoticeDetail?n_id=<%=notice.getN_id()%>" class="btn btn-primary radius size-MINI">修改</a></td>
						<td><input class="btn btn-danger radius size-MINI"
							type="button" onClick="delete_check(<%=notice.getN_id()%>)" value="删除"></td>
						</tr>
						</tbody> 
						<%
									}
							}
						%>
					
				</table>
				
				<!--普通弹出层-->
		<div id="modal-demo-delete" class="modal fade middle" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content radius">
					<div class="modal-header">
						<h3 class="modal-title">删除公告</h3>
						<a class="close" data-dismiss="modal" aria-hidden="true"
							href="javascript:void();">×</a>
					</div>
					<div class="modal-body">
						<p>确定删除该公告吗</p>
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
			function delete_check(n_id) {
				id = n_id;
				$("#modal-demo-delete").modal("show");
			}
			function delete_yes(){
				window.location.href = "${pageContext.request.contextPath}/notice/delete_admin?n_id="+id;
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