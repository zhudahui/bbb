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
							<a href="${pageContext.request.contextPath}/notice_add_schoolmanage">发布公告</a>
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
				
				<!--返回按钮-->
				<br /> <a href="#" class="btn btn-default radius"
				onClick="javascript :history.back(-1);"><i class="Hui-iconfont">&#xe6d4;</i>&nbsp;返回</a>

			<!--贷款申请表  -->
			<!--基本资料   -->
				<form action="${pageContext.request.contextPath}/admin/updateCreditRequest" method="post" class="form form-horizontal"
					  id="demoform-2">
					<input name="rId" value="${request.r_id}" style="display:none;" id="r_id"/>
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
											   placeholder="姓名"  id="s_name" datatype="*"
											   nullmsg="请输入姓名" value="${student.s_name}">
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
									</div>
								</div>
								<!--出生日期-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" value="${student.s_birth}"
											   class="input-text radius size-M" id="s_birth"
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
											   id="s_IDcard" datatype="*18-18"
											   nullmsg="请输入18位身份证号">
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
									</div>
								</div>
								<!--学校     -->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" value="${student.s_school}" placeholder="学校"
											   class="input-text radius size-M"  id="s_school"
											   datatype="*" nullmsg="请输入学校">
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
									</div>
								</div>
								<!--班级-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" value="${student.s_class}" placeholder="班级"
											   class="input-text radius size-M"  id="s_class"
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
											   id="s_politicalStatus" datatype="*"
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
											   id="s_address" datatype="*" nullmsg="">
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
											   id="s_phone" datatype="*" nullmsg="">
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
									</div>
								</div>
								<!--QQ号码-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">Q&nbsp;Q号码：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" value="${student.s_qq}" placeholder="QQ号码："
											   class="input-text radius size-M" id="s_qq"
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
											   class="input-text radius size-M" id="s_email"
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
													class="select" size="1"  id="s_gender">
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
											   class="input-text radius size-M" id="s_age"
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
											   class="input-text radius size-M"  id="s_nation"
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
											   class="input-text radius size-M"  id="s_major"
											   datatype="*" nullmsg="">
									</div>
								</div>
								<!--学号-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
									<div class="formControls col-xs-8 col-sm-9 ">
										<input type="text" value="${student.s_id}" placeholder="学号"
											   class="input-text radius size-M" name="sId" id="s_id"
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
											   id="s_nativePlace" datatype="*"
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
											   id="s_postalCode" datatype="*" nullmsg="">
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

					<!--家庭资料  -->
					<div class="panel panel-default mt-20">
						<div class="panel-header">贷款申请表-家庭资料</div>
						<div class="panel-body" style="height: 320px;">
							<!--称谓   -->
							<div class="col-lg-2">
								<label>称谓：</label> <br /> <br />
								<c:forEach items="${fNickname}" var="fnn">
									<input type="text"
										   placeholder="称谓" value="${fnn}" id="f_nickname0"
										   class="input-text radius size-M" style="width: 150px;">
									<br /> <br />
								</c:forEach>
								<%-- <input type="text"
                                    placeholder="称谓" value="" id="f_nickname0"
                                    class="input-text radius size-M" style="width: 150px;">
                                <br /> <br />
                                <input type="text" placeholder="称谓"
                                    value="${f1.f_nickname}" class="input-text radius size-M"
                                    style="width: 150px;" > <br /> <br /> <input
                                    type="text" placeholder="称谓" value="${f2.f_nickname}"
                                    class="input-text radius size-M" style="width: 150px;">
                                <br /> <br /> <input type="text" placeholder="称谓"
                                    value="${f3.f_nickname}" class="input-text radius size-M"
                                    style="width: 150px;"> <br /> <br /> <input
                                    type="text" placeholder="称谓" value="${f4.f_nickname}"
                                    class="input-text radius size-M" style="width: 150px;">
                                <br /> <br />  --%>
								<label>家&nbsp;庭&nbsp;年&nbsp;人&nbsp;均&nbsp;收&nbsp;入：</label>
							</div>
							<!--姓名  -->
							<div class="col-lg-3">
								<label>姓名：</label> <br /> <br />
								<c:forEach items="${fName}" var="fn">
									<input type="text"
										   placeholder="姓名" value="${fn}" id="f_name0"
										   class="input-text radius size-M" style="width: 250px;">
									<br /> <br />
								</c:forEach>
								<%-- <input type="text"
                                   placeholder="姓名" value="${f0.f_name}" id="f_name0"
                                   class="input-text radius size-M" style="width: 250px;">
                               <br /> <br /> <input type="text" placeholder="姓名"
                                   value="${f1.f_name}" class="input-text radius size-M"
                                   style="width: 250px;"> <br /> <br /> <input
                                   type="text" placeholder="姓名" value="${f2.f_name}"
                                   class="input-text radius size-M" style="width: 250px;">
                               <br /> <br /> <input type="text" placeholder="姓名"
                                   value="${f3.f_name}" class="input-text radius size-M"
                                   style="width: 250px;"> <br /> <br /> <input
                                   type="text" placeholder="姓名" value="${f4.f_name}"
                                   class="input-text radius size-M" style="width: 250px;">
                               <br /> <br /> --%>

								<input type="text" placeholder="人民币（元）"
									   value="${request.annualincome}" class="input-text radius size-M" name="annualincome" style="width: 250px;">
							</div>
							<!--工作单位  -->
							<div class="col-lg-4">
								<label>工作单位：</label> <br /> <br />
								<c:forEach items="${fCompany}" var="fc">
									<input type="text"
										   placeholder="工作单位" value="${fc}" id="f_company0"
										   class="input-text radius size-M" style="width: 340px;">
									<br /> <br />
								</c:forEach>
								<%-- <input type="text"
                                    placeholder="工作单位" value="${f0.f_company}" id="f_company0"
                                    class="input-text radius size-M" style="width: 340px;">
                                <br /> <br /> <input type="text" placeholder="工作单位"
                                    value="${f1.f_company}" class="input-text radius size-M"
                                    style="width: 340px;"> <br /> <br /> <input
                                    type="text" placeholder="工作单位" value="${f2.f_company}"
                                    class="input-text radius size-M" style="width: 340px;">
                                <br /> <br /> <input type="text" placeholder="工作单位"
                                    value="${f3.f_company}" class="input-text radius size-M"
                                    style="width: 340px;"> <br /> <br /> <input
                                    type="text" placeholder="工作单位" value="${f4.f_company}"
                                    class="input-text radius size-M" style="width: 340px;">
                                <br /> <br /> --%>
							</div>
							<!--联系电话  -->
							<div class="col-lg-3">
								<label>联系电话：</label> <br /> <br />
								<c:forEach items="${fPhone}" var="fp" >
									<input type="text"
										   placeholder="联系电话" value="${fp}" id="f_phone0"
										   class="input-text radius size-M" style="width: 250px;">
									<br /> <br />
								</c:forEach>
								<%-- <input type="text"
                                    placeholder="联系电话" value="${f0.f_phone}" id="f_phone0"
                                    class="input-text radius size-M" style="width: 250px;">
                                <br /> <br /> <input type="text" placeholder="联系电话"
                                    value="${f1.f_phone}" class="input-text radius size-M"
                                    style="width: 250px;"> <br /> <br /> <input
                                    type="text" placeholder="联系电话" value="${f2.f_phone}"
                                    class="input-text radius size-M" style="width: 250px;">
                                <br /> <br /> <input type="text" placeholder="联系电话"
                                    value="${f3.f_phone}" class="input-text radius size-M"
                                    style="width: 250px;"> <br /> <br /> <input
                                    type="text" placeholder="联系电话" value="${f4.f_phone}"
                                    class="input-text radius size-M" style="width: 250px;">
                                <br /> <br /> --%>
							</div>
						</div>
					</div>




					<!--申请信息  -->
					<div class="panel panel-default mt-20">
						<div class="panel-header">贷款申请表-申请信息</div>
						<div class="panel-body">
							<!--贷款金额-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">贷款金额：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${request.money}" placeholder="人民币（元）"
										   class="input-text radius size-M" name="money" id="money"
										   datatype="*" nullmsg="">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--开始日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">开始日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${request.starttime}"
										   class="input-text radius size-M" name="starttime"
										   id="starttime" datatype="*" nullmsg="请输入出生日期">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--结束日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">结束日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input type="text" value="${request.deadline}"
										   class="input-text radius size-M" name="deadline" id="deadline"
										   datatype="*" nullmsg="请输入出生日期">
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								</div>
							</div>
							<!--贷款用途-->
							<div class="row clearfix">
								<label class="form-label col-xs-3">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
								<div class="formControls col-xs-8">
									<div class="row clearfix" style="margin-top: 0">
										<div class="col-xs-6">
										<span class="select-box radius"> <select class="select"
																				 size="1" name="useType" id="use_type">
												<c:choose>
													<c:when test="${request.use_type eq '创业'}">
														<option value="创业" selected>创业</option>
														<option value="学费">学费</option>
														<option value="生活">生活</option>
														<option value="其它">其它</option>
													</c:when>
													<c:otherwise>
														<c:if test="${request.use_type eq '学费'}">
															<option value="创业">创业</option>
															<option value="学费" selected>学费</option>
															<option value="生活">生活</option>
															<option value="其它">其它</option>
														</c:if>
														<c:if test="${request.use_type eq '生活'}">
															<option value="创业">创业</option>
															<option value="学费">学费</option>
															<option value="生活" selected>生活</option>
															<option value="其它">其它</option>
														</c:if>
														<c:if test="${request.use_type eq '其它'}">
															<option value="创业">创业</option>
															<option value="学费">学费</option>
															<option value="生活">生活</option>
															<option value="其它" selected>其它</option>
														</c:if>
													</c:otherwise>
												</c:choose>
										</select>
										</span>
										</div>
									</div>
								</div>
							</div>
							<!--申请原因-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">申请原因：</label>
								<div class="formControls col-xs-8 col-sm-9">
								<textarea class="textarea" placeholder="说点什么...最少输入10个字符"
										  name="reason" onKeyUp="Huitextarealength(this)">${request.reason}</textarea>
									<p class="textarea-numberbar">
										<em class="textarea-length">0</em>/
										<am>300</am>
									</p>
								</div>
							</div>
						</div>
					</div>
					<!--审批信息 -->
					<div class="panel panel-default mt-20">
						<div class="panel-header">贷款申请表-审批信息</div>
						<div class="panel-body">
							<!--学校意见：-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">学校意见：</label>
								<div class="formControls col-xs-8 col-sm-9">
								<textarea value="text" class="textarea radius" name="schoolidea"
										  id="schoolidea" maxlength="300"
										  onKeyUp="Huitextarealength(this)">${request.schoolidea}</textarea>
									<p class="textarea-numberbar">
										<em class="textarea-length">0</em>/
										<am>300</am>
									</p>
								</div>
							</div>
							<!--银行意见：-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">银行意见：</label>
								<div class="formControls col-xs-8 col-sm-9">
								<textarea value="text" class="textarea radius" name="bankidea"
										  id="bankidea" maxlength="300" onKeyUp="Huitextarealength(this)">${request.bankidea}</textarea>
									<p class="textarea-numberbar">
										<em class="textarea-length">0</em>/
										<am>300</am>
									</p>
								</div>
							</div>
						</div>
					</div>
					<!--调整布局  -->
					<div style="height: 20px;"></div>
					<!--按钮  -->
					<c:if test="${schoolmanage.flag == 1}">
						<div class="row cl">
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
								<input class="btn btn-primary radius" type="button"
									   value="&nbsp;&nbsp;通过&nbsp;&nbsp;"
									   style="background-color: #68838B;" onclick="audit(2)">
								<input class="btn btn-danger radius" type="button"
									   value="&nbsp;&nbsp;拒绝&nbsp;&nbsp;" onclick="audit(3)">
							</div>
						</div>
					</c:if>

					<!--调整布局  -->
					<div style="height: 150px;"></div>
				</form>
			</div>
			
			<!--普通弹出层-PASS-->
			<div id="modal-demo-pass" class="modal fade middle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content radius">
						<div class="modal-header">
							<h3 class="modal-title">Pass</h3>
							<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
						</div>
						<div class="modal-body">
							<p>确定通过该申请吗</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary radius" onClick="pass()">确定</button>
							<%-- <a class="btn btn-primary radius" href="${pageContext.request.contextPath}/creditrequest/pass_schoolmanage?r_id=${request.r_id}">确定</a> --%>
							<button class="btn radius" data-dismiss="modal" aria-hidden="true">关闭</button>
						</div>
					</div>
				</div>
			</div>
			<!--普通弹出层-FAIL-->
			<div id="modal-demo-fail" class="modal fade middle" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content radius">
						<div class="modal-header">
							<h3 class="modal-title">Fail</h3>
							<a class="close" data-dismiss="modal" aria-hidden="true" href="javascript:void();">×</a>
						</div>
						<div class="modal-body">
							<p>确定拒绝通过该申请吗</p>
						</div>
						<div class="modal-footer">
							<button class="btn btn-primary radius" onClick="fail()">确定</button>
							<button class="btn radius" data-dismiss="modal" aria-hidden="true">关闭</button>
						</div>
					</div>
				</div>
			</div>
			
			<!--字数监测-->
			<script >
			var Huitextarealength = function(obj) {
				var html = $(obj).parent();
				var tatal = html.find('am').html();
				var sets = $(obj).val().length;
				if (sets * 1 > tatal * 1) {
					var str = '<div style="width: auto;position: absolute; right: 4%;color: red;">内容超出限制</div>';
					$(obj).after(str);
					html.find('em').css({
						color : 'red'
					});
				} else {
					$(obj).parent().find('div').remove();
					html.find('em').css({
						color : 'black'
					});
				}
				//设置已输入数量
				html.find('em').html(sets);
			}
			</script>
			
			<!--弹出窗口-->
			<script type="text/javascript" src="H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="H-ui/lib/jquery-ui/1.9.1/jquery-ui.min.js"></script>
			<script type="text/javascript" src="H-ui/static/h-ui/js/H-ui.js"></script>
			<script type="text/javascript" src="H-ui/lib/jquery.SuperSlide/2.1.1/jquery.SuperSlide.min.js"></script>
			<script type="text/javascript" src="H-ui/lib/jquery.validation/1.14.0/jquery.validate.min.js"></script>
			<script type="text/javascript" src="H-ui/lib/jquery.validation/1.14.0/validate-methods.js"></script>
			<script type="text/javascript" src="H-ui/lib/jquery.validation/1.14.0/messages_zh.min.js"></script>
			<script>
				//表单验证
				function pass_check(){  
					var schoolidea = document.getElementById("schoolidea").value;
					//alert(schoolidea);
    				if(schoolidea == null || schoolidea == ("")){  
    					modalalertdemo();  
    				} else{
    					modaldemo_pass();
    				}
				}  
				function fail_check(){  
					var schoolidea = document.getElementById("schoolidea").value;
    				if(schoolidea == null || schoolidea == ("")){  
    					modalalertdemo();  
    				} else{
    					modaldemo_fail();
    				}
				}  
				//消息框
				function modalalertdemo(){
					$.Huimodalalert('学校意见不能为空',2000);
				}
				//弹窗
				function modaldemo_pass() {
					$("#modal-demo-pass").modal("show");
				}
				function modaldemo_fail() {
					$("#modal-demo-fail").modal("show");
				}
				//确定
				function pass(){
					var r_id = document.getElementById("r_id").value;
					var schoolidea = document.getElementById("schoolidea").value;
					window.location.href = "${pageContext.request.contextPath}/creditrequest/pass_schoolmanage?r_id="+r_id+"&schoolidea="+schoolidea;
				}
				function fail(){
					var r_id = document.getElementById("r_id").value;
					var schoolidea = document.getElementById("schoolidea").value;
					window.location.href = "${pageContext.request.contextPath}/creditrequest/fail_schoolmanage?r_id="+r_id+"&schoolidea="+schoolidea;
				}
			</script>
			
			<!--返回顶部  -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script>
				$.Huitotop();
                function audit(s) {
                    $.post("${pageContext.request.contextPath}/creditrequest/audit", {
                        r_id: $('[name="rId"]').val(),
                        msg: $('[name="schoolidea"]').val(),
                        bankOrSchool:"S",
                        status: s
                    }, function (data) {
                        window.top.location.href = '${pageContext.request.contextPath}/creditrequest/showAllRequest_schoolmanage?sm_id=<%=session.getAttribute("sm_id")%>';
                    }, 'json')
                }
			</script>
			
		</div>
</body>
</html>