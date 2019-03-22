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
		<title>大学生贷款申请系统-银行管理员端</title>
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
					<li class="item">
						<h4>公告<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/notice/showBankNotice_bankmanage?bm_id=<%=session.getAttribute("bm_id")%>">银行公告</a>
						</div>
					</li>
					<li class="item">
						<h4>贷款<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/creditrequest/showNotCompleteCreditRequest_bankmanage?bm_id=<%=session.getAttribute("bm_id")%>">未审批</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllCompleteRequest_bankmanage?bm_id=<%=session.getAttribute("bm_id")%>">已审批</a>
						</div>
					</li>
					<li class="item">
						<h4>个人资料<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/bankmanage/showBankManageDetail_bankmanage?bm_id=<%=session.getAttribute("bm_id")%>">基本资料</a>
							<br>
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
				
				<!--返回按钮-->
				<br />
				<a href="#" class="btn btn-default radius" onClick="javascript :history.back(-1);"><i class="Hui-iconfont">&#xe6d4;</i>&nbsp;返回</a>
				
				<!--基本资料   -->
				<!--除了关于个人信征方面的都不可更改。个人信征还没加入。04.10-->
				<form action="" method="post" class="form form-horizontal"
					id="demoform-2">
				<div class="panel panel-default mt-20">
					<div class="panel-header">贷款申请表-基本资料</div>

					<div class="panel-body" style="height: 485px;">
						<!--左半边   -->
						<div class="col-sm-12 col-md-6">
							<!--姓名   -->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" class="input-text radius size-M"
										placeholder="姓名" name="s_name" id="s_name" datatype="*"
										disabled="disabled" nullmsg="请输入姓名" value="${student.s_name}">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--出生日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="date" value="${student.s_birth}"
										class="input-text radius size-M" name="s_birth" id="s_birth"
										disabled="disabled" datatype="*" nullmsg="请输入出生日期">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--身份证号 -->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">身份证号：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_IDcard}"
										placeholder="身份证号" class="input-text radius size-M"
										name="s_IDcard" id="s_IDcard" datatype="*18-18"
										disabled="disabled" nullmsg="请输入18位身份证号">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--学校     -->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_school}" placeholder="学校"
										class="input-text radius size-M" name="s_school" id="s_school"
										disabled="disabled" datatype="*" nullmsg="请输入学校">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--班级-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_class}" placeholder="班级"
										class="input-text radius size-M" name="s_class" id="s_class"
										disabled="disabled" datatype="*" nullmsg="请输入班级">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--政治面貌-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">政治面貌：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_politicalStatus}"
										placeholder="群众/共青团员/预备党员/党员" class="input-text radius size-M"
										name="s_politicalStatus" id="s_politicalStatus" datatype="*"
										disabled="disabled" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--家庭住址-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">家庭住址：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_address}"
										placeholder="家庭住址" class="input-text radius size-M"
										disabled="disabled" name="s_address" id="s_address" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--电话号码-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">电话号码：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_phone}"
										placeholder="电话号码" class="input-text radius size-M"
										disabled="disabled" name="s_phone" id="s_phone" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--QQ号码-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">Q&nbsp;Q号码：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_qq}" placeholder="QQ号码："
										class="input-text radius size-M" name="s_qq" id="s_qq"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--邮箱-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_email}" placeholder="@"
										class="input-text radius size-M" name="s_email" id="s_email"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
						</div>
						<!--右半边  -->
						<div class="col-sm-12 col-md-6">
							<!--性别    -->
							<div class="row clearfix">
								<label class="form-label col-xs-3">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
								<div class="formControls col-xs-8">
									<div class="row clearfix" style="margin-top: 0">
										<div class="col-xs-6">
											<span class="select-box radius"> <select
												class="select" disabled="disabled" size="1" name="s_gender" id="s_gender">
													<c:choose>
														<c:when test="${student.s_gender  eq '女'}">
															<option value="女" selected>女</option>
															<option value="男">男</option>
														</c:when>
														<c:otherwise>
															<c:if test="${student.s_gender  eq '男'}">
																<option value="女">女</option>
																<option value="男" selected>男</option>
															</c:if>
														</c:otherwise>
													</c:choose>
											</select>
											</span>
										</div>
									</div>
								</div>
							</div>
							<!--年龄-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_age}" placeholder="年龄"
										class="input-text radius size-M" name="s_age" id="s_age"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--民族-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_nation}" placeholder="民族"
										class="input-text radius size-M" name="s_nation" id="s_nation"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--专业-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_major}" placeholder="专业"
										class="input-text radius size-M" name="s_major" id="s_major"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
							</div>
							<!--学号-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
								<div class="formControls col-xs-8 col-sm-9 ">
									<input type="text" value="${student.s_id}" placeholder="学号"
										class="input-text radius size-M" name="s_id" id="s_id"
										disabled="disabled" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--籍贯-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_nativePlace}"
										placeholder="籍贯" class="input-text radius size-M"
										name="s_nativePlace" id="s_nativePlace" datatype="*"
										disabled="disabled" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--邮政编码-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">邮政编码：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_postalCode}"
										placeholder="邮政编码" class="input-text radius size-M"
										disabled="disabled" name="s_postalCode" id="s_postalCode" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!--调整布局  -->
				<div style="height: 20px;"></div>
				
				<!--按钮  -->
				<!-- <div class="row cl">
					<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						<input class="btn btn-primary radius" type="submit"
							value="&nbsp;&nbsp;修改&nbsp;&nbsp;">
					</div>
				</div> -->
				<!--调整布局  -->
				<div style="height: 150px;"></div>
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