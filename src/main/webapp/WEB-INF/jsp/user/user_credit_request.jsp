<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt"
		   uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
	<title>管理员端添加预约</title>
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
			<a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/login">社区医养中心管理系统</a>
			<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="${pageContext.request.contextPath}/index">预约</a>
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
					<a href="${pageContext.request.contextPath}/notice/showBankNotice_student">银行公告</a>
					<br>
					<a href="${pageContext.request.contextPath}/notice/showSchoolNotice_student?s_id=<%=session.getAttribute("s_id")%>">学校公告</a>
				</div>
			</li>
			<li class="item">
				<h4>预约挂号<b>+</b></h4>
				<div class="info">
					<a href="${pageContext.request.contextPath}/student/student_credit_request" class="active">预约</a>
					<br>
					<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest_student?s_id=<%=session.getAttribute("s_id")%>">查询预约</a>
				</div>
			</li>
			<li class="item">
				<h4>个人资料<b>+</b></h4>
				<div class="info">
					<a href="${pageContext.request.contextPath}/student/showStudent_student?s_id=<%=session.getAttribute("s_id")%>">基本资料</a>
					<br>
					<a href="${pageContext.request.contextPath}/score/showScore_student?s_id=<%=session.getAttribute("s_id")%>">成绩查询</a>
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
		<nav class="breadcrumb">预约<span class="c-666 en">&gt;</span><span class="c-666">添加预约</span></nav>
		<!--贷款申请表  -->
		<!--基本资料：提交到数据库   -->

		<form action="${pageContext.request.contextPath}/student/addRequestInfos" method="post" class="form form-horizontal" id="demoform-2">
			<div class="panel panel-default mt-20">
				<div class="panel-header">预约-基本资料</div>

				<div class="panel-body" style="height: 450px;">
					<!--左半边   -->
					<div class="col-sm-12 col-md-6">
						<!--姓名   -->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly type="text" class="input-text radius size-M" name="s.sName" placeholder="姓名" value="${s.SName}" id="s_name" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--出生日期-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">出生日期：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" class="input-text radius size-M" id="s_birth" name="s.sBirth" value="<fmt:formatDate pattern="yyyy/MM/dd" value="${s.SBirth}" />" placehoder="xxxx/xx/xx" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--身份证号 -->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">身份证号：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="身份证号" name="s.sIdcard" class="input-text radius size-M" value="${s.SIdcard}" id="s_idcard" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--学校     -->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;校：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="学校" name="s.sSchool" class="input-text radius size-M" value="${s.SSchool}"  id="s_school" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--班级-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;级：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="班级" name="s.sClass" class="input-text radius size-M" value="${s.SClass}" id="s_class" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--政治面貌-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">政治面貌：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" name="s.sPoliticalstatus" placeholder="群众/共青团员/预备党员/党员" class="input-text radius size-M" id="s_politicalStatus" value="${s.SPoliticalstatus}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--家庭住址-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">家庭住址：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="家庭住址" name="s.sAddress" class="input-text radius size-M" id="s_address" value="${s.SAddress}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--电话号码-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">电话号码：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="电话号码" name="s.sPhone" class="input-text radius size-M" id="s_phone" value="${s.SPhone}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--QQ号码-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">Q&nbsp;Q号码：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="QQ号码：" name="s.sQq" class="input-text radius size-M" id="s_qq" value="${s.SQq}" required>
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
								<c:if test="${s.SGender == '男'}">
									<div class="radio-box">
										<input readonly  type="radio" id="s_gender_1" name="s.sGender" checked  required>
										<label for="sex-1">男</label>
									</div>
									<div class="radio-box">
										<input readonly  type="radio" id="s_gender_2"  name="s.sGender">
										<label for="sex-2">女</label>
									</div>
								</c:if>

								<c:if test="${s.SGender == '女'}">
									<div class="radio-box">
										<input readonly  type="radio" id="s_gender_1" name="s.sGender"   required>
										<label for="sex-1">男</label>
									</div>
									<div class="radio-box">
										<input readonly  type="radio" id="s_gender_2"  checked name="s.sGender">
										<label for="sex-2">女</label>
									</div>
								</c:if>

							</div>
						</div>
						<div style="height: 8px;"></div>
						<!--年龄-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="年龄" name="s.sAge" class="input-text radius size-M"  id="s_age" value="${s.SAge}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--民族-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">民&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;族：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="民族" name="s.sNation" class="input-text radius size-M"  id="s_nation"  value="${s.SNation}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--专业-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">专&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;业：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="专业" name="s.sMajor" class="input-text radius size-M"  id="s_major" value="${s.SMajor}" required>
							</div>
						</div>
						<!--学号-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">学&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
							<div class="formControls col-xs-8 col-sm-9 ">
								<input readonly  type="text" placeholder="学号" name="s.sId" class="input-text radius size-M"  id="s_id"  value="${s.SId}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--籍贯-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">籍&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;贯：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="籍贯" name="s.sNativeplace" class="input-text radius size-M"  id="s_nativeplace"  value="${s.SNativeplace}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--邮政编码-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">邮政编码：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="邮政编码" name="s.sPostalcode" class="input-text radius size-M"  id="s_postalcode"  value="${s.SPostalcode}" required>
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
						<!--邮箱-->
						<div class="row cl">
							<label class="form-label col-xs-4 col-sm-3">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱：</label>
							<div class="formControls col-xs-8 col-sm-9">
								<input readonly  type="text" placeholder="@" name="s.sEmail" class="input-text radius size-M"  id="s_email" email="true"  value="${s.SEmail}" required >
							</div>
							<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3"> </div>
						</div>
					</div>
				</div>

			</div>







			<!--调整布局  -->
			<div style="height: 20px;"></div>
			<!--按钮  -->
			<div class="row cl">
				<div class="col-xs-8 col-sm-6 col-xs-offset-4 col-sm-offset-3">
					<input class="btn btn-primary radius" type="submit" value="&nbsp;&nbsp;预约&nbsp;&nbsp;">
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