<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>管理员端添加贷款申请</title>
		<meta name="keywords" content="管理员添加贷款申请">
		<meta name="description" content="request_add_admin 管理员端添加贷款申请">
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
							<a href="${pageContext.request.contextPath}/request_add_admin"  class="active">添加申请</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest">查询申请</a>
						</div>
					</li>
					<li class="item">
						<h4>用户<b>+</b></h4>
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
						<h4>部门<b>+</b></h4>
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
				<nav class="breadcrumb">贷款<span class="c-666 en">&gt;</span><span class="c-666">添加申请</span></nav>
				<!--贷款申请表  -->
				<!--基本资料：提交到数据库   -->
				
				<form action="${pageContext.request.contextPath}/admin/addRequestInfos" method="post" class="form form-horizontal" id="demoform-2">
					<div class="panel panel-default mt-20">
						<div class="panel-header">贷款申请表-基本资料</div>

						<div class="panel-body" style="height: 450px;">
							<!--左半边   -->
							<div class="col-sm-12 col-md-6">
								<!--姓名   -->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" class="input-text radius size-M" name="s.sName" placeholder="姓名" id="s_name" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--出生日期-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" class="input-text radius size-M" id="s_birth" name="s.sBirth" placehoder="xxxx/xx/xx" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--身份证号 -->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">身份证号：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="身份证号" name="s.sIdcard" class="input-text radius size-M" id="s_idcard" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--学校     -->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="学校" name="s.sSchool" class="input-text radius size-M"  id="s_school" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--班级-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="班级" name="s.sClass" class="input-text radius size-M" id="s_class" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--政治面貌-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">政治面貌：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" name="s.sPoliticalstatus" placeholder="群众/共青团员/预备党员/党员" class="input-text radius size-M" id="s_politicalStatus" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--家庭住址-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">家庭住址：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="家庭住址" name="s.sAddress" class="input-text radius size-M" id="s_address" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--电话号码-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">电话号码：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="电话号码" name="s.sPhone" class="input-text radius size-M" id="s_phone" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--QQ号码-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">Q&nbsp;Q号码：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="QQ号码：" name="s.sQq" class="input-text radius size-M" id="s_qq" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
							</div>
							<!--右半边  -->
							<div class="col-sm-12 col-md-6">
								<!--性别    -->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别：</label>
									<div class="formControls skin-minimal col-xs-8 col-sm-9">
										<div class="radio-box">
											<input type="radio" id="s_gender_1" name="s.sGender"  required>
											<label for="sex-1">男</label>
										</div>
										<div class="radio-box">
											<input type="radio" id="s_gender_2"  name="s.sGender">
											<label for="sex-2">女</label>
										</div>
									</div>
								</div>
								<div style="height: 8px;"></div>
								<!--年龄-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="年龄" name="s.sAge" class="input-text radius size-M"  id="s_age" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--民族-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="民族" name="s.sNation" class="input-text radius size-M"  id="s_nation" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--专业-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="专业" name="s.sMajor" class="input-text radius size-M"  id="s_major" required>
									</div>
								</div>
								<!--学号-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
									<div class="formControls col-xs-8 col-sm-9 ">
										<input type="text" placeholder="学号" name="s.sId" class="input-text radius size-M"  id="s_id" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--籍贯-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="籍贯" name="s.sNativeplace" class="input-text radius size-M"  id="s_nativeplace" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--邮政编码-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">邮政编码：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="邮政编码" name="s.sPostalcode" class="input-text radius size-M"  id="s_postalcode" required>
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
								<!--邮箱-->
								<div class="row cl">
									<label class="form-label col-xs-4 col-sm-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
									<div class="formControls col-xs-8 col-sm-9">
										<input type="text" placeholder="@" name="s.sEmail" class="input-text radius size-M"  id="s_email" email="true" required >
									</div>
									<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
								</div>
							</div>
						</div>

					</div>

					<!--家庭资料  -->
					<div class="panel panel-default mt-20">
						<div class="panel-header">贷款申请表-家庭资料</div>
						<div class="panel-body" style="height: 320px;">
							<!--称谓   -->
							<div class="col-lg-2">
								<label>称谓：</label>
								<br />
								<br />
								<input  id="f_nickname0" name="f1.fNickname" type="text" placeholder="称谓" class="input-text radius size-M" style="width: 150px;" required>
								<br />
								<br />
								<input type="text" placeholder="称谓"  name="f2.fNickname" class="input-text radius size-M" style="width: 150px;">
								<br />
								<br />
								<input type="text" placeholder="称谓"  name="f3.fNickname" class="input-text radius size-M" style="width: 150px;">
								<br />
								<br />
								<input type="text" placeholder="称谓"  name="f4.fNickname" class="input-text radius size-M" style="width: 150px;">
								<br />
								<br />
								<input type="text" placeholder="称谓"  name="f5.fNickname"  class="input-text radius size-M" style="width: 150px;">
								<br />
								<br />
								<label>家&nbsp;庭&nbsp;年&nbsp;人&nbsp;均&nbsp;收&nbsp;入：</label>
							</div>
							<!--姓名  -->
							<div class="col-lg-3">
								<label>姓名：</label>
								<br />
								<br />
								<input  id="f_name0"  name="f1.fName" type="text" placeholder="姓名" class="input-text radius size-M" style="width: 250px;" required>
								<br />
								<br />
								<input type="text" name="f2.fName" placeholder="姓名" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text" name="f3.fName" placeholder="姓名" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text" name="f4.fName" placeholder="姓名" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text"  name="f5.fName" placeholder="姓名" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<!-- 年收入 -->
								<input type="text" name="c.annualincome" placeholder="人民币（元）" class="input-text radius size-M" style="width: 250px;">
							</div>
							<!--工作单位  -->
							<div class="col-lg-4">
								<label>工作单位：</label>
								<br />
								<br />
								<input id="f_company0" name="f1.fCompany" type="text" placeholder="工作单位" class="input-text radius size-M" style="width: 340px;" required>
								<br />
								<br />
								<input type="text" name="f2.fCompany" placeholder="工作单位" class="input-text radius size-M" style="width: 340px;">
								<br />
								<br />
								<input type="text" name="f3.fCompany" placeholder="工作单位" class="input-text radius size-M" style="width: 340px;">
								<br />
								<br />
								<input type="text" name="f4.fCompany" placeholder="工作单位" class="input-text radius size-M" style="width: 340px;">
								<br />
								<br />
								<input type="text" name="f5.fCompany" placeholder="工作单位" class="input-text radius size-M" style="width: 340px;">
								<br />
								<br />
							</div>
							<!--联系电话  -->
							<div class="col-lg-3">
								<label>联系电话：</label>
								<br />
								<br />
								<input id="f_phone0" name="f1.fPhone" type="text" placeholder="联系电话" class="input-text radius size-M" style="width: 250px;" required>
								<br />
								<br />
								<input type="text" name="f2.fPhone" placeholder="联系电话" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text" name="f3.fPhone" placeholder="联系电话" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text" name="f4.fPhone" placeholder="联系电话" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
								<input type="text"  name="f5.fPhone" placeholder="联系电话" class="input-text radius size-M" style="width: 250px;">
								<br />
								<br />
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
									<input type="text" placeholder="人民币（元）" class="input-text radius size-M" name="c.money" id="money" required>
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<!--开始日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">开始日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input  class="input-text radius size-M" name="c.starttime" id="starttime" >
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<!--结束日期-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">结束日期：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<input  class="input-text radius size-M" name="c.deadline" id="deadline" >
								</div>
								<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
							</div>
							<!--贷款用途-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">贷款用途：</label>
								<div class="formControls  skin-minimal col-xs-8 col-sm-9">
									<div class="check-box">
										<input type="radio" id="use-1" name="c.useType" required minlength="1" value="学费">
										<label for="use-1">学费</label>
									</div>
									<div class="check-box">
										<input type="radio" id="use-2" name="c.useType" value="创业">
										<label for="use-2">创业</label>
									</div>
									<br/>
									<div class="check-box">
										<input type="radio" id="use-3" name="c.useType" value="生活">
										<label for="use-3">生活</label>
									</div>
									<div class="check-box">
										<input type="radio" id="use-4" name="c.useType" value="其它">
										<label for="use-4">其它</label>
									</div>
								</div>
							</div>
							<!--申请原因-->
							<div class="row cl">
								<label class="form-label col-xs-4 col-sm-3">申请原因：</label>
								<div class="formControls col-xs-8 col-sm-9">
									<textarea class="textarea"  placeholder="说点什么...最少输入10个字符" name="c.reason" id="reason" onKeyUp="Huitextarealength(this)" minlength="10" maxlength="500" required></textarea>
									<p class="textarea-numberbar"><em class="textarea-length">0</em>
									<am>500</am></p>
								</div>
							</div>
						</div>
					</div>
					<!--调整布局  -->
					<div style="height: 20px;"></div>
					<!--按钮  -->
					<div class="row cl">
						<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
							<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;添加&nbsp;&nbsp;">
						</div>
					</div>
					<!--调整布局  -->
					<div style="height: 150px;"></div>
				</form>
			</div>
		</div>

		<!--返回顶部  -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
		<script>
			$.Huitotop();
		</script>

		<!--表单验证插件-->
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
		<script>
			$.validator.setDefaults({
				//submit提交事件
			    submitHandler: function() {
			      alert("提交事件!");
			    }
			});
			//表单验证
			$().ready(function() {
			    $("#demoform-2").validate();
			});
		</script>
		<!-- <script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/jquery.validate.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/validate-methods.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/jquery.validation/1.14.0/messages_zh.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/Validform/5.3.2/Validform.min.js"></script>
		<script type="text/javascript" src="http://lib.h-ui.net/Validform/5.3.2/passwordStrength-min.js"></script> -->
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
			    	format: 'yyyy/mm/dd',
					minView: "month",
					todayBtn:  1,
					autoclose: 1,
					endDate : new Date()
				}).on('hide',function(e) {
					//此处可以触发日期校验。
				});
				$("#starttime").datetimepicker({
			    	format: 'yyyy/mm/dd',
					minView: "month",
					todayBtn:  1,
					autoclose: 1,
					startDate : new Date()
				}).on('hide',function(e) {
					//此处可以触发日期校验。
				});
				$("#deadline").datetimepicker({
			    	format: 'yyyy/mm/dd',
					minView: "month",
					todayBtn:  1,
					autoclose: 1,
					startDate : new Date()
				}).on('hide',function(e) {
					//此处可以触发日期校验。
				}); 
		})
		</script>
		
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
		<!-- <script type="text/javascript">
			$("#menu_3 dt").addClass("selected");
			$("#menu_3 dd").show();
			$(function() {
				$('.skin-minimal input').iCheck({
					checkboxClass: 'icheckbox-blue',
					radioClass: 'iradio-blue',
					increaseArea: '20%'
				});
				$("#tab-form").Huitab();
				$("#demoform-2").validate({
					rules: {
						email: {
							required: true,
							email: true,
						},
						name: {
							required: true,
							minlength: 2,
						},
						birth: {
							required: true,
						},
						IDcard: {
							required: true,
							minlength: 18,
							maxlength: 18,
						},
						school: {
							required: true,
						},
						studentclass:{
							required:true,
						},
						politicalStatus:{
							required:true,
						},
						address:{
							required:true,
						},
						phone:{
							required:true,
							minlength: 11,
							maxlength: 12,
						},
						qq:{
							required:true,
						},
						age:{
							required:true,
							digits:true,
						},
						nation:{
							required:true,
						},
						major:{
							required:true,
						},
						SID:{
							required:true,
						},
						nativePlace:{
							required:true,
						},
						postalCode:{
							required:true,
							minlength: 6,
							maxlength: 6,
						},
						photo:{
							required:true,
						},
						money:{
							required:true,
						},
						starttime:{
							required:true,
						},
						deadline:{
							required:true,
						},
						use:{
							required:true,
						},
						reason:{
							required:true,
							minlength:10,
						},
						f_nickname1:{
							required:true,
						},
						f_name1:{
							required:true,
						},
						f_company1:{
							required:true,
						},
						f_phone1:{
							required:true,
						}
					},
					onkeyup: false,
					focusCleanup: true,
					success: "valid",
					submitHandler: function(form) {
						$("#modal-shenqing-success").modal("show");
						$(form).ajaxSubmit()
					}
				});
				$("#demoform-3").Validform({
					tiptype: 2,
					usePlugin: {
						datepicker: {}, //日期控件校验;
						passwordstrength: {
							minLen: 6, //设置密码长度最小值，默认为0;
							maxLen: 18, //设置密码长度最大值，默认为30;
							trigger: function(obj, error) {
								//该表单元素的keyup和blur事件会触发该函数的执行;
								//obj:当前表单元素jquery对象;
								//error:所设密码是否符合验证要求，验证不能通过error为true，验证通过则为false;					
								//console.log(error);
								if (error) {
									obj.parent().find(".Validform_checktip").show();
									obj.parent().find(".passwordStrength").hide()
								} else {
									obj.parent().find(".passwordStrength").show()
								}
							}
						}
					}
				})
			});
		</script> -->
</body>
</html>