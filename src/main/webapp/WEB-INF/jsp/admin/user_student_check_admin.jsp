<%@ page import="com.chinasofti.entity.School" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.chinasofti.vo.Student" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>大学生贷款申请系统-管理员端</title>
		<meta name="keywords" content="管理员查看学生详情">
		<meta name="description" content="user_student_check_admin 管理员查看学生详情">
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
							<a href="${pageContext.request.contextPath}/student/showAllStudent" class="active">用户管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/schoolmanage/showAllSchoolManage">医生管理</a>
							<br>
							<a href="${pageContext.request.contextPath}/bankmanage/showAllBankManage">老人管理</a>
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

				<!--返回按钮-->
				<br />
				<a href="#" class="btn btn-default radius" onClick="javascript :history.back(-1);"><i class="Hui-iconfont">&#xe6d4;</i>&nbsp;返回</a>

			<!--基本资料   -->
			<form action="${pageContext.request.contextPath}/student/modifyStudent" method="post" class="form form-horizontal"
				id="demoform-2">
				<div class="panel panel-default mt-20">
					<div class="panel-header">基本资料</div>

					<div class="panel-body" style="height: 485px;">
						<!--左半边   -->
						<div class="col-sm-12 col-md-6">
							<!--姓名   -->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" class="input-text radius size-M"
										placeholder="姓名" name="sName" id="sName" datatype="*"
										nullmsg="请输入姓名" value="${student.s_name}">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--出生日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="date" value="${student.s_birth}"
										class="input-text radius size-M" name="sBirth" id="sBirth"
										datatype="*" nullmsg="请输入出生日期">
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
										name="sIdcard" id="sIdcard" datatype="*18-18"
										nullmsg="请输入18位身份证号">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--学校     -->
							<%--<div class="row cl">--%>
								<%--<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</label>--%>
								<%--<div class="formControls col-xs-8 col-sm-9">--%>
									<%--<input type="text" value="${student.s_school}" placeholder="学校"--%>
										<%--class="input-text radius size-M" name="s_school" id="s_school"--%>
										<%--datatype="*" nullmsg="请输入学校">--%>
								<%--</div>--%>
								<%--<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">--%>
								<%--</div>--%>
							<%--</div>--%>
							<div class="row clearfix">
								<label class="form-label col-xs-3">学校ID：</label>
								<div class="formControls col-xs-8">
									<div class="row clearfix" style="margin-top: 0">
										<div class="col-xs-6">
										<span class="select-box">
										<select class="select" size="1" name="sSchool" id="sSchool" value="${student.s_school}" required>
												<option value="">选择学校</option>
												<%
													ArrayList<School> school = (ArrayList<School>) request.getAttribute("all");
													Student student = (Student) request.getAttribute("student");
													if (school != null) {
														//遍历
														for (int i = 0; i < school.size(); i++) {
															School sch = school.get(i);
															String sch_id = sch.getSchId();
															String sch_name = sch.getSchName();
															if(student.getS_school().equals(sch_id)) {
												%>
													<option value="<%=sch_id%>" selected><%=sch_name%></option>
												<%
															} else {
												%>
													<option value="<%=sch_id%>"><%=sch_name%></option>
												<%
															}

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
							<!--班级-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_class}" placeholder="班级"
										class="input-text radius size-M" name="sClass" id="sClass"
										datatype="*" nullmsg="请输入班级">
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
										name="sPoliticalstatus" id="sPoliticalstatus" datatype="*"
										nullmsg="">
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
										name="sAddress" id="sAddress" datatype="*" nullmsg="">
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
										name="sPhone" id="sPhone" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--QQ号码-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">Q&nbsp;Q号码：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_qq}" placeholder="QQ号码："
										class="input-text radius size-M" name="sQq" id="sQq"
										datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--邮箱-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_email}" placeholder="@"
										class="input-text radius size-M" name="sEmail" id="sEmail"
										datatype="*" nullmsg="">
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
												class="select" size="1" name="sGender" id="sGender">
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
										class="input-text radius size-M" name="sAge" id="sAge"
										datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--民族-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_nation}" placeholder="民族"
										class="input-text radius size-M" name="sNation" id="sNation"
										datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--专业-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${student.s_major}" placeholder="专业"
										class="input-text radius size-M" name="sMajor" id="sMajor"
										datatype="*" nullmsg="">
								</div>
							</div>
							<!--学号-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
								<div class="formControls col-xs-8 col-sm-9 ">
									<input type="text" value="${student.s_id}" placeholder="学号"
										class="input-text radius size-M" name="sId" id="sId"
										datatype="*" nullmsg="">
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
										name="sNativeplace" id="sNativeplace" datatype="*"
										nullmsg="">
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
										name="sPostalCode" id="sPostalCode" datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!-- <div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">上传照片：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<span class="btn-upload form-group"> <input
										class="input-text upload-url radius size-M" type="text"
										name="photo" id="photo" readonly style="width: 263px">
										<a href="javascript:void();"
										class="btn btn-primary upload-btn radius"
										style="background-color: #68838B; border: 0;"><i
											class="Hui-iconfont">&#xe642;</i> 浏览文件</a> <input type="file"
										multiple name="file-2" class="input-file">
									</span>
								</div>
							</div> -->
						</div>
					</div>
				</div>
				<!--调整布局  -->
				<div style="height: 20px;"></div>
				<!--按钮  -->
				<div class="row cl">
					<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
						<input class="btn btn-primary radius" type="submit"
							value="&nbsp;&nbsp;修改&nbsp;&nbsp;"
							style="background-color: #68838B;">
						<input class="btn btn-danger radius" type="button" 
							onClick="delete_check()" value="&nbsp;&nbsp;删除&nbsp;&nbsp;">
					</div>
				</div>
				<!--调整布局  -->
				<div style="height: 150px;"></div>
			</form>
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
						<a class="btn btn-primary radius"
							href="${pageContext.request.contextPath}/student/delete_admin?s_id=${student.s_id}">确定</a>						
						<button class="btn radius" data-dismiss="modal" aria-hidden="true">关闭</button>
					</div>
				</div>
			</div>
		</div>

		<!--表单验证插件-->
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
		<script>
			//表单验证
			$().ready(function() {
		    	$("#demoform-2").validate();
		    	$("#modify_student").click(function(){
				    if($("#demoform-2").valid()){
				    	//alert("提交事件!");
				    	$("#demoform-2").submit();
				 }
				});
			});
			function delete_check() {
				$("#modal-demo-delete").modal("show");
			}
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery-ui/1.9.1/jquery-ui.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/static/h-ui/js/H-ui.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
		<script>
		$(function(){
				//日期插件
				$("#s_birth").datetimepicker({
			    	format: 'yyyy-mm-dd',
					minView: "month",
					todayBtn:  1,
					autoclose: 1,
					endDate : new Date()
				}).on('hide',function(e) {
					//此处可以触发日期校验。
				});
		})
		</script>

		<!--返回顶部  -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
		<script>
			$.Huitotop();
		</script>
</body>
</html>