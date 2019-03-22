<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
							<a href="${pageContext.request.contextPath}/notice_add_admin" class="active">添加公告</a>
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
						<h4>人员管理<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/showAllStudent">用户管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">医生管理</a>
						</div>
					</li>
					<li class="item">
						<h4>部门管理<b>+</b></h4>
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
				<nav class="breadcrumb">公告<span class="c-666 en">&gt;</span><span class="c-666">添加公告</span></nav>
				<br/>
				<!--公告内容-->
				<form action="${pageContext.request.contextPath}/notice/add" method="post" class="form form-horizontal" id="demoform-2">
					<div class="panel panel-default mt-20">
						<div class="panel-header">公告内容</div>

						<div class="panel-body" style="height: 650px;">
							<!--标题-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;题：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" class="input-text radius size-M" placeholder="标题" name="n_title" id="n_title" datatype="*" nullmsg="标题">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<!--内容-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">内&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;容：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<textarea value="22" class="textarea radius"  placeholder="公告内容" name="n_body" id="n_body" style="height: 300px;"> </textarea>
								</div>
							</div>
							<!--作者-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">作&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;者：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" class="input-text radius size-M" placeholder="作者" name="n_author" id="n_author" datatype="*" nullmsg="标题">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<!--发布日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">发布日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="date" class="input-text radius size-M" placeholder="发布日期" name="n_date" id="n_date" datatype="*" nullmsg="标题">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<div style="height: 8px;"></div>
							<!--公告类型-->
							<div class="row clearfix">
								<label class="form-label col-xs-3">公告类型：</label>
								<div class="formControls col-xs-8">
									<div class="row clearfix" style="margin-top:0">
										<div class="col-xs-6">
											<span class="select-box radius">
											<select class="select" size="1" name="n_type" id="n_type">
													<option value="s" selected>学校</option>
													<option value="b">银行</option>
											</select>
										</span>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!--按钮  -->
					<div class="row cl">
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;发布&nbsp;&nbsp;">
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
		</div>
</body>
</html>