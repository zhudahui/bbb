<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		
		<style type="text/css">
		#allmap{border-radius:10px 10px 10px 10px;}
		body, html {width: 100%;height: 100%;margin:0;font-family:"微软雅黑";}
		#allmap{width:800px;height:500px;}
		p{margin-left:5px; font-size:14px;}
	</style>
		<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=Eo1hU6eiGUTRy9Mx2R8caW0VKNYskum0"></script>
		<title>社区医养中心管理系统-登录</title>
		<meta name="keywords" content="登录">
		<meta name="description" content="login 登录">
		<link rel="Bookmark" href="favicon.ico">
		<link rel="Shortcut Icon" href="favicon.ico" />

		<!--CSS文件引用 -->
		<link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/static/h-ui/css/H-ui.css" rel="stylesheet" type="text/css" />
		<link href="${pageContext.request.contextPath}/H-ui/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/student.css" type="text/css" />

		<style>
			#content {
				background-image: url(${pageContext.request.contextPath}/img/background_login.jpg);
				background-repeat: no-repeat;
				background-position-y: 0;
				width: 100%;
				height: 666px;
			}
			
			.iframe_footer {
				width: 100%;
				height: 130px;
				border: 0;
				margin: 0 auto;
				margin-top: 0px;
			}
			
			.loginpage {
				background-color: white;
				margin-top: 0;
				border: 0;
			}
			
			#logo{
				float: left;
				margin-top: 100px;
				margin-left: 220px;
				font-size:30px;
				color: white;
			}
			
			#title {
				float: right;
				text-align: center;
				background-color: white;
				margin-right: 100px;
				margin-top: 20px;
				height: 500px;
				box-shadow: 0 10px 20px white;
				transform: translate3d(0, -3px, 0);
			}
			
			#title a{
				font-size:15px;
				color: #AAAAAA;
			}
			
			#title a:hover {
				color: #6699CC;
			}
			
			.login {
				text-align: center;
			}
			
			.login_input {
				height: 40px;
				width: 80%;
			}
			
			.login_button {
				width: 80%;
				height: 40px;
				color: white;
				background: #68838B;
				border: 0px;
			}
			
			.login a:link {
				color: #AAAAAA;
			}
			
			.login a:hover {
				color: #68838B;
			}
		</style>
</head>
<body>
<!--头部导航栏 -->
		<header class="navbar-wrapper navbar-fixed-top">
			<div class="navbar navbar-black">
				<div class="container cl">
					<a class="logo navbar-logo f-l mr-10 hidden-xs" href="${pageContext.request.contextPath}/login">社区医养中心管理系统</a>
					<a class="logo navbar-logo-m f-l mr-10 visible-xs" href="${pageContext.request.contextPath}/index">预约申请</a>
					<a aria-hidden="false" class="nav-toggle Hui-iconfont visible-xs" href="javascript:;">&#xe667;</a>
					<nav class="nav navbar-nav nav-collapse" role="navigation" id="Hui-navbar">
						<ul class="cl">
							<li class="current"><a href="javascript:">登录</a></li>
							<li><a href="${pageContext.request.contextPath}/contact">联系我们</a></li>
							<!--<li>
							<iframe allowtransparency="true" frameborder="0" width="480" height="96" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=0&v=0&d=4&bd=0&k=&f=ffffff&ltf=009944&htf=cc0000&q=1&e=1&a=1&c=54511&w=480&h=96&align=center"></iframe>
							
							</li> -->
						</ul>
					</nav>
					<nav class="navbar-userbar hidden-xs">
					</nav>
				</div>
			</div>
		</header>

		<!-- -->
		<div id="content">
			<article class="article">
				<div id="logo">
					 预约挂号！
					<div id="allmap"></div>
				</div>
				<div id="title">
					<br /><br />
					<div id="tab_demo" class="HuiTab">
			<div class="tabBar clearfix">
				<span>用户登录</span>
				<span>医师登录</span>
				<!--<span>银行登录</span>!-->
				<span>管理员登录</span>
			</div>
			<!--用户登录-->
			<div class="tabCon">
				<br />
				<br />
				<div class="login">
				<form id="form1" class="mui-input-group" action="" method="post">
					<input name="s_id" id="s_id" type="text" class="input-text login_input" placeholder="手机号" />
					<br />
					<br />
					<input name="s_pwd" id="s_pwd" type="password" class="input-text login_input" placeholder="密码" />
					<br />
					<br />
					<input id="login_student" name="login_student" class="login_button" type="button" value=" 立即登录 " onclick="studentLogin()" />
					<br />
					<div>${message }</div>
					</form>
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
			<!--医生登录-->
			<div class="tabCon">
				<br />
				<br />
				<div class="login">
				<form id="form2" class="mui-input-group" action="" method="post">
					<input name="sm_id" id="sm_id" type="text" class="input-text login_input" placeholder="医生工号" />
					<br />
					<br />
					<input name="sm_pwd" id="sm_pwd" type="password" class="input-text login_input" placeholder="密码" />
					<br />
					<br />
					<input id="login_schoolmanage" name="login_schoolmanage" class="login_button" type="button" value=" 立即登录 " onclick="schoolLogin()" />
					<br />
					<div>${message }</div>
					</form>
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
			<!--学校登录
			<div class="tabCon">
				<br />
				<br />
				<div class="login">
				<form id="form3" class="mui-input-group" action="" method="post">
					<input name="bm_id" id="bm_id" type="text" class="input-text login_input" placeholder="银行员工工号" />
					<br />
					<br />
					<input name="bm_pwd" id="bm_pwd" type="password" class="input-text login_input" placeholder="密码" />
					<br />
					<br />
					<input id="login_bankmanage" name="login_bankmanage" class="login_button" type="button" value=" 立即登录 " onclick="bankLogin()" />
					<br />
					<div>${message }</div>
					</form>
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
			-->
			<!--管理员登录-->
			<div class="tabCon">
				<br />
				<br />
				<div class="login">
				<form id="form4" class="mui-input-group" action="" method="post">
					<input name="a_id" id="a_id" type="text" class="input-text login_input" placeholder="管理员账号" />
					<br />
					<br />
					<input name="a_pwd" id="a_pwd" type="password" class="input-text login_input" placeholder="密码" />
					<br />
					<br />
					<input id="login_admin" name="login_admin" class="login_button" type="button" value=" 立即登录 " onclick="adminLogin()" />
					<br />
					<div>${message }</div>
					</form>
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
				</div>
			</div>
					<br />
					<%-- <iframe class="loginpage" name="frame1" src="${pageContext.request.contextPath}/login_student" height="450" width="350"></iframe> --%>
				</div>
				</div>
			</article>
		</div>

		<!--页脚  -->
		<div id="footer">
			<iframe class="iframe_footer" src="${pageContext.request.contextPath}/footer"></iframe>
		</div>
		
		<!-- 选项卡 -->
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>

<script type="text/javascript">
    $(document).on("pagebeforehide","#register",function(){
        sessionStorage.setItem("key_id",re_id.value);
        sessionStorage.setItem("key_pwd",re_pwd.value);
    })
    /* $(document).on("pageshow","#login_student",function(){
        var key_id=sessionStorage.getItem("key_id");
        $("#s_id").val(key_id);
        var key_pwd=sessionStorage.getItem("key_pwd");
        $("#s_pwd").val(key_pwd);
    }) */
    /* 验证学生登录 */
    function studentLogin() {
        var flag = 1;
        //获取显示提示信息span document.getElementById
        var name_msg = document.getElementById("s_id");
        var pwd_msg = document.getElementById("s_pwd");
        var name = document.getElementById("s_id").value;
        var pwd = document.getElementById("s_pwd").value;
        if (name == null || name == "") {
            flag = 0;
            mui.alert("请输入学号");
        }
        else if (pwd == null || pwd == "") {
            if (pwd == null || pwd == "") {
                flag = 0;
                mui.alert("请输入密码");
            }
        }
        if (flag == 1) {
            var form1 = document.getElementById("form1");
            form1.action = "${pageContext.request.contextPath}/student/login";
            form1.submit();//提交
        }
    }
    /* 验证学校登录 */
    function schoolLogin() {
        var flag = 1;
        //获取显示提示信息span document.getElementById
        var name_msg = document.getElementById("sm_id");
        var pwd_msg = document.getElementById("sm_pwd");
        var name = document.getElementById("sm_id").value;
        var pwd = document.getElementById("sm_pwd").value;
        if (name == null || name == "") {
            flag = 0;
            mui.alert("请输入工号");
        }
        else if (pwd == null || pwd == "") {
            if (pwd == null || pwd == "") {
                flag = 0;
                mui.alert("请输入密码");
            }
        }
        if (flag == 1) {
            var form2 = document.getElementById("form2");
            form2.action = "${pageContext.request.contextPath}/schoolmanage/login";
            form2.submit();//提交
        }
    }
    /* 银行 */
    function bankLogin() {
        var flag = 1;
        //获取显示提示信息span document.getElementById
        var name_msg = document.getElementById("bm_id");
        var pwd_msg = document.getElementById("bm_pwd");
        var name = document.getElementById("bm_id").value;
        var pwd = document.getElementById("bm_pwd").value;
        if (name == null || name == "") {
            flag = 0;
            mui.alert("请输入工号");
        }
        else if (pwd == null || pwd == "") {
            if (pwd == null || pwd == "") {
                flag = 0;
                mui.alert("请输入密码");
            }
        }
        if (flag == 1) {
            var form3 = document.getElementById("form3");
            form3.action = "${pageContext.request.contextPath}/bankmanage/login";
            form3.submit();//提交
        }
    }
    /* 管理员 */
    function adminLogin() {
        var flag = 1;
        //获取显示提示信息span document.getElementById
        var name_msg = document.getElementById("a_id");
        var pwd_msg = document.getElementById("a_pwd");
        var name = document.getElementById("a_id").value;
        var pwd = document.getElementById("a_pwd").value;
        if (name == null || name == "") {
            flag = 0;
            mui.alert("请输入学号");
        }
        else if (pwd == null || pwd == "") {
            if (pwd == null || pwd == "") {
                flag = 0;
                mui.alert("请输入密码");
            }
        }
        if (flag == 1) {
            var form4 = document.getElementById("form4");
            form4.action = "${pageContext.request.contextPath}/admin/login";
            form4.submit();//提交
        }
    }
</script>
<script>
    $("#tab_demo").Huitab({
        tabEvent: "click",
        index: 0
    });
</script>
</body>
</html>
