<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>社区医养中心管理系统-联系我们</title>
		<meta name="keywords" content="联系我们">
		<meta name="description" content="联系我们">
		<link rel="Bookmark" href="favicon.ico">
		<link rel="Shortcut Icon" href="favicon.ico" />
		
		<!--CSS文件引用 -->
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/static/h-ui/css/H-ui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/student.css" type="text/css" />
		
		<style>
			#main{
				margin-top: 100px;
			}
			
			.iframe_footer {
				width: 100%;
				height: 130px;
				border: 0;
				margin: 0 auto;
				margin-top: 0px;
			}
			
			#buju{
				float: left;
				margin-top: 100px;
				margin-left: 220px;
			}
			
			.grayfont{
				color: #999988;
			}
		</style>
</head>
<body>
		<!--头部导航栏 -->
		<header class="navbar-wrapper navbar-fixed-top">
			<div class="navbar navbar-black">
				<div class="container cl">
					<a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/login">大学生贷款申请系统</a>
					<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="${pageContext.request.contextPath}/index">贷款申请</a>
					<!--<span class="logo navbar-slogan f-l mr-10 hidden-xs">安全 &middot; 便捷 &middot; 专为大学生设计</span>-->
					<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
					<nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
						<ul class="cl">
							<li><a href="${pageContext.request.contextPath}/login">登录</a></li>
							<li class="current"><a href="javascript:">联系我们</a></li>
						</ul>
					</nav>
					<nav class="navbar-userbar hidden-xs">
					</nav>
				</div>
			</div>
		</header>
		
		<!--正文 -->
		<div id="main">
			<div id="buju">
				<div>
					<span style="font-size:30px;">联系我们&nbsp;&nbsp;&nbsp;</span>
					<span class="grayfont" style="font-size:10px;">Contact us</span>
				</div>
				<div>
					<span class="grayfont" style="font-size:20px;"><br/>您好！<br/></span>
					<span class="grayfont" style="font-size:15px;"><br/>感谢您使用</span>
					<span class="grayfont" style="font-size:15px;font-weight: bold;">社区医养中心管理系统</span>
					<span class="grayfont" style="font-size:15px;">
						,如果您在使用过程中遇到任何问题，或对我们的网站<br/>
						有更好的建议、意见，欢迎联系我们。以下是我们的联系方式：
					</span>
				</div>
				<br />
				<br />
				<div>
					<span class="grayfont" style="font-size:15px;">电话:17602265025<br /></span>
					<span class="grayfont" style="font-size:15px;">邮箱:17602265025@163.com<br /></span>
					<span class="grayfont" style="font-size:15px;">QQ:<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=1783389518&site=qq&menu=yes">
						<img border="0" src="http://wpa.qq.com/pa?p=2:1783389518:51" alt="点击这里给我发消息" title="点击这里给我发消息"/>
					</a><br /></span>
					<span class="grayfont" style="font-size:15px;">地址:天津市西青区宾水西道399号<br /></span>
					<span class="grayfont" style="font-size:15px;">
						<img src="img/wechat.jpg"/>
						扫一扫，关注我们
					</span>
				</div>
			</div>
			<!-- phone：<br />
			QQ:<a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=595747116&site=qq&menu=yes"><img border="0" src="http://wpa.qq.com/pa?p=2:270863798:51" alt="点击这里给我发消息" title="点击这里给我发消息"/></a> -->
		</div>
		
		<!--页脚  -->
		<div id="footer">
			<iframe class="iframe_footer" src="${pageContext.request.contextPath}/footer"></iframe>
		</div>
</body>
</html>