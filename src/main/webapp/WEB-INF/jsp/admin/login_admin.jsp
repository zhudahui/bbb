<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>管理员登录</title>
		<style>
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
			
			a:link {
				color: #AAAAAA;
			}
			
			a:hover {
				color: #68838B;
			}
		</style>
		
		<script type="text/javascript">
    	$(document).on("pagebeforehide","#register",function(){
    		sessionStorage.setItem("key_id",re_id.value);
    		sessionStorage.setItem("key_pwd",re_pwd.value);
    	})
    	$(document).on("pageshow","#login_admin",function(){
    		var key_id=sessionStorage.getItem("key_id");
    		$("#a_id").val(key_id);
    		var key_pwd=sessionStorage.getItem("key_pwd");
    		$("#a_pwd").val(key_pwd);
    	})
    	function checkLogin() {
		var flag = 1;
		//获取显示提示信息span document.getElementById
		var name_msg = document.getElementById("a_id");
		var pwd_msg = document.getElementById("a_pwd");
		var name = document.getElementById("a_id").value;
		var pwd = document.getElementById("a_pwd").value;
		if (name == null || name == "") {
			flag = 0;
			mui.alert("请输入管理员ID");
		}
		else if (pwd == null || pwd == "") {
			if (pwd == null || pwd == "") {
				flag = 0;
				mui.alert("请输入管理员密码");
			}
		}
		if (flag == 1) {
			var form1 = document.getElementById("form1");
			/* myWindow=window.open('${pageContext.request.contextPath}/admin/login');
			myWindow.focus(); */
			form1.action = "${pageContext.request.contextPath}/admin/login";
			form1.submit();//提交
		}
		}
    	</script>
</head>
<body>
<br />
		<br />
		<div class="login">
		<form id="form1" class="mui-input-group" action="" method="post">
			<input name="a_id" id="a_id" type="text" class="login_input" placeholder="管理员账号" />
			<br />
			<br />
			<input name="a_pwd" id="a_pwd" type="password" class="login_input" placeholder="密码" />
			<br />
			<br />
			<input id="login_admin" name="login_admin" class="login_button" target="_blank" type="button" value=" 立即登录 " onclick="checkLogin()" />
			<%-- <a href="${pageContext.request.contextPath}/home_admin" target="_top">
				<input class="login_button radius" type="button" value=" 立即登录 " />
			</a>  --%>
			<span>${message }</span>
			</form>
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
		</div>
</body>
</html>