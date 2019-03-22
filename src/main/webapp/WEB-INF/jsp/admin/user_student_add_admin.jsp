<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ page import="com.chinasofti.entity.School"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport"
		  content="width=device-width,initial-scale=1,user-scalable=no" />
	<title>大学生贷款申请系统-管理员端</title>
	<meta name="keywords" content="管理员首页">
	<meta name="description" content="home_admin 管理员首页">
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

		#menu



		.item



		a


		:hover


		:not



(
.active



)
		{
			background-color


			:



					#555


		;
			color


			:



					white


		;
		}
		#fenge {
			height: 45px;
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
            document.getElementById("datetime").innerHTML = "今天是：" + year + "年"
                + (month + 1) + "月" + date + "日";
        }
	</script>
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
			<!--<li class="li1"><a class="active" href="hui_demo2.html">新闻</a></li>-->
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
						href="${pageContext.request.contextPath}/creditrequest/showAllRequest">查询申请</a>
				</div>
			</li>
			<li class="item">
				<h4>
					人员管理<b>+</b>
				</h4>
				<div class="info">
					<a
							class="active"	href="${pageContext.request.contextPath}/student/showAllStudent">用户管理</a>
					<br> <a
						href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage"
						>医生管理</a> <br> <a
						href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">老人管理</a>
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
	<div id="main"
		 style="margin-left: 16.67%; padding: 1px 16px; height: 1000px;">
		<!--面包屑导航  -->
		<nav class="breadcrumb"> 用户 <span class="c-666 en">&gt;</span>
			<span class="c-666">学校用户</span> <span class="c-666 en">&gt;</span> <span
					class="c-666">添加用户</span> </nav>

		<!--返回按钮-->
		<br /> <a href="#" class="btn btn-default radius"
				  onClick="javascript :history.back(-1);"><i class="Hui-iconfont">&#xe6d4;</i>&nbsp;返回</a>

		<!--基本资料-->
		<form
				action="${pageContext.request.contextPath}/student/addStudent"
				method="post" class="form form-horizontal" id="demoform-2"
				name="demoform-2">
			<div class="panel panel-default mt-20">
				<div class="panel-header">学生基本信息</div>
				<div class="panel-body">
					<!--ID-->
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">ID：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" placeholder="ID"
								   class="input-text radius size-M" name="sId" id="sId"
								   required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>
					<!--密码-->
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">密码：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="password" class="input-text radius size-M"
								   name="sPwd" id="sPwd" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>
					<!--姓名-->
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">姓名：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sName" id="sName" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>
					<!--性别-->
					<div class="row clearfix">
						<label class="form-label col-xs-3">性别：</label>
						<div class="formControls col-xs-8">
							<div class="row clearfix" style="margin-top: 0">
								<div class="col-xs-6">
										<span class="select-box">
										<select class="select" size="1" name="sGender" id="sGender" required>
												<option value="男" selected>男</option>
												<option value="女">女</option>
										</select>
										</span>
								</div>
							</div>
						</div>
					</div>
					<!--学校ID-->
					<div class="row clearfix">
						<label class="form-label col-xs-3">学校ID：</label>
						<div class="formControls col-xs-8">
							<div class="row clearfix" style="margin-top: 0">
								<div class="col-xs-6">
										<span class="select-box">
										<select class="select" size="1" name="sSchool" id="sSchool" required>
												<option value="" selected>选择学校</option>
												<%
													ArrayList<School> school = (ArrayList<School>) request.getAttribute("all");
													if (school != null) {
														//遍历
														for (int i = 0; i < school.size(); i++) {
															School sch = school.get(i);
															String sch_id = sch.getSchId();
															String sch_name = sch.getSchName();
												%>
													<option value="<%=sch_id%>"><%=sch_name%></option>
												<%
														}
													}
												%>
												<%-- <c:forEach items="${all}" var="school" begin="0" step="1">
													<option value="${school.getSch_id() }">${school.getSch_name() }</option>
												</c:forEach> --%>
										</select>
										</span>
								</div>
							</div>
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">专业：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sMajor" id="sMajor" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">班级：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sClass" id="sClass" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">年龄：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sAge" id="sAge" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">生日：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="date" class="input-text radius size-M"
								   name="sBirth" id="sBirth" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">政治面貌：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sPoliticalstatus" id="sPoliticalstatus" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">籍贯：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sNativeplace" id="sNativeplace" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">家庭住址：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sAddress" id="sAddress" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<!--电话-->
					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">电话：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sPhone" id="sPhone" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">邮箱：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="email" class="input-text radius size-M"
								   name="sEmail" id="sEmail" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">身份证号：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sIdcard" id="sIdcard" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">民族：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sNation" id="sNation" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">邮编：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sPostalcode" id="sPostalcode" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row cl">
						<label class="form-label col-xs-4 col-sm-3">QQ：</label>
						<div class="formControls col-xs-8 col-sm-9">
							<input type="text" class="input-text radius size-M"
								   name="sQq" id="sQq" required>
						</div>
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						</div>
					</div>

					<div class="row clearfix">
						<label class="form-label col-xs-3">登录状态：</label>
						<div class="formControls col-xs-8">
							<div class="row clearfix" style="margin-top: 0">
								<div class="col-xs-6">
										<span class="select-box">
										<select class="select" size="1" name="sLoginflag" id="sLoginflag" required>
												<option value="0" >注销用户</option>
												<option value="1" selected>可登录</option>
												<option value="2">不可登录</option>
										</select>
										</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--调整布局  -->
			<div style="height: 20px;"></div>
			<!--按钮  -->
			<div class="row cl">
				<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
					<!-- <input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;"> -->
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
				</div>
			</div>
			<!--调整布局  -->
			<div style="height: 150px;"></div>
		</form>
	</div>
</div>

<!--返回顶部  -->
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/H-ui.js"></script>
<script>
    $.Huitotop();
</script>

<!--表单验证插件-->
<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
		src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery-ui/1.9.1/jquery-ui.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/static/h-ui/js/H-ui.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
		src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>

<!-- 表单验证插件-->
<script type="text/javascript"
		src="http://lib.h-ui.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
<script type="text/javascript"
		src="http://lib.h-ui.net/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript"
		src="http://lib.h-ui.net/jquery.validation/1.14.0/messages_zh.min.js"></script>
<script type="text/javascript"
		src="http://lib.h-ui.net/Validform/5.3.2/Validform.min.js"></script>
<script type="text/javascript"
		src="http://lib.h-ui.net/Validform/5.3.2/passwordStrength-min.js"></script>
<script type="text/javascript">
    $("#menu_3 dt").addClass("selected");
    $("#menu_3 dd").show();
    $(function() {
        $('.skin-minimal input').iCheck({
            checkboxClass : 'icheckbox-blue',
            radioClass : 'iradio-blue',
            increaseArea : '20%'
        });
        $("#tab-form").Huitab();
        $("#demoform-2").validate({
            rules : {
                sm_id : {
                    required : true,
                },
                sm_pwd : {
                    required : true,
                    minlength : 6,
                },
                sm_name : {
                    required : true,
                },
                sm_school : {
                    required : true,
                },
                sm_phone : {
                    required : true,
                },
                flag:{
                    required:true,
                },
            },
            onkeyup : false,
            focusCleanup : true,
            success : "valid",
            submitHandler : function(form) {
                hui.loading(msg);
                $(form).submit();
            }
        });
    });
</script>
</body>
</html>