<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
		<title>大学生贷款申请系统-学生端</title>
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
							<a href="${pageContext.request.contextPath}/notice/showBankNotice_student">银行公告</a>
							<br>
							<a href="${pageContext.request.contextPath}/notice/showSchoolNotice_student?s_id=<%=session.getAttribute("s_id")%>">学校公告</a>
						</div>
					</li>
					<li class="item">
						<h4>贷款<b>+</b></h4>
						<div class="info">
							<a href="${pageContext.request.contextPath}/student/student_credit_request">申请贷款</a>
							<br>
							<a href="${pageContext.request.contextPath}/creditrequest/showAllRequest_student?s_id=<%=session.getAttribute("s_id")%>">查询申请</a>
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
				欢迎<%=session.getAttribute("s_name")%>登录！
				<div id="datetime"></div>
				<span id='img' style='position:absolute;' onmouseover='mystop()' onmouseout= 'start()'>
					<div id="pp" style="border:1px solid #c0c0c0;margin:0 auto;padding:5px;background:#f0f0f0;font-size:10px">
						<a style="CURSOR:hand;color:red;font-weight:bold;font-size:12px;display: inline-block" onclick="closeIt()">关闭</a>
						<h4>贷款通则节选</h4>
						<p>贷款程序</p>
						<p>借款人需要贷款，应当向主办银行或者其他银行的经办机构直接申请。 借款人应当填写包括借款金额、借款用途、偿还能力及还款方式等主要内容的《惜款申请书｝）并提供以下资料：</p>
						<p>一、借款人及保证人基本情况；</p>
						<p>二、财政部门或会计（审计）事务所核准的上年度财务报告，以及申请借款前一期的财务报告；</p>
						<p>三、原有不合理占用的贷款的纠正情况；</p>
						<p>四、抵押物、质物清单和有处分权人的同意抵押、质押的证明及保证人拟同意保证的有关证明文件；</p>
						<p>五、项目建议书和可行性报告；</p>
						<p>六、贷款人认为需要提供的其他有关资料。</p>
					</div>
				</span>
			</div>
			
			<!--返回顶部  -->
			<script type="text/javascript" src="${pageContext.request.contextPath}/H-ui/lib/jquery/1.9.1/jquery.min.js"></script>
			<script type="text/javascript" src="${pageContext.request.contextPath}/js/H-ui.js"></script>
			<script>
				$.Huitotop();
			</script>
		</div>
<script type="text/javascript">

    var xPos = 0;var yPos = 0; var step = 1;var delay = 10;var height = 0;
    var Hoffset = 0;var Woffset = 0; var yon = 0;var xon = 0; var xon = 0; var interval;
    var img = document.getElementById('img');
    img.style.top = 0;
    function changePos(){
        width =  document.documentElement.clientWidth||document.body.clientWidth;
        height = document.documentElement.clientHeight||document.body.clientHeight;
        Hoffset = img.offsetHeight;
        Woffset = img.offsetWidth;
        if (yon) {
            yPos = yPos + step;
        }else {
            yPos = yPos - step;
        }
        if (yPos < 0) {
            yon = 1;
            yPos = 0;
        }
        if (yPos >= (height - Hoffset)) {
            yon = 0;
            yPos = (height - Hoffset);
        }
        if (xon) {
            xPos = xPos + step;
        }else {
            xPos = xPos - step;
        }
        if (xPos < 0) {
            xon = 1;
            xPos = 0;
        }
        if (xPos >= (width - Woffset)) {
            xon = 0;
            xPos = (width - Woffset);
        }
        img.style.left = xPos + document.body.scrollLeft+"px";
        img.style.top = yPos + document.body.scrollTop +"px";
    }
    function start() {
        img.visibility = 'visible';
        interval = setInterval('changePos()', delay);
    }
    function mystop(){
        clearInterval(interval)
    }
    function closeIt() {
        clearInterval(interval);
        $("#img").hide();
	}
    start()
</script>
</body>
</html>