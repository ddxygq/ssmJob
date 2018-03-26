<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<title>信息修改</title>
<style type="text/css">
html, body {
	padding: 0px;
	margin: 0px;
	font-family: 'Raleway', sans-serif;
	color: #FFF;
	height: 100%;
}

body {
	background: rgba(0, 0, 0, 0.5);
}

.container {
	max-width: 150px;
	background: rgba(0, 0, 0, 0.75);
	margin-left: 50px;
	padding: 10px 0px 20px 0px;
	border: 1px solid #111;
	border-radius: 4px;
	box-shadow: 0px 4px 5px rgba(0, 0, 0, 0.75);
}

.link {
	font-size: 16px;
	font-weight: 300;
	text-align: center;
	position: relative;
	height: 40px;
	line-height: 40px;
	margin-top: 10px;
	overflow: hidden;
	width: 90%;
	margin-left: 5%;
	cursor: pointer;
}


.link:after {
	content: '';
	position: absolute;
	width: 80%;
	border-bottom: 1px solid rgba(255, 255, 255, 0.5);
	bottom: 50%;
	left: -100%;
	transition-delay: all 0.5s;
	transition: all 0.5s;
}

.link:hover:after, .link.hover:after {
	left: 100%;
}

.link .text {
	text-shadow: 0px -40px 0px rgba(255, 255, 255, 1);
	transition: all 0.75s;
	transform: translateY(100%) translateZ(0);
	transition-delay: all 0.25s;
}

.link:hover .text, .link.hover .text {
	text-shadow: 0px -40px 0px rgba(255, 255, 255, 0);
	transform: translateY(0%) translateZ(0) scale(1.1);
	font-weight: 600;
}

#body {
	height: 75%;
}

#head {
	height: 25%;
	text-align: center;
	vertical-align: middle;
}

#menu {
	width: 20%;
	float: left;
	inline: 100%;
	height: 100%;
}

#content {
	width: 79%;
	float: left;
	height: 75%
}
#head-center {
	width: 60%;
	height: 100;
	text-align: center;
	display: inline-block;
}
</style>

</head>
<body>
	<div id="head">
		<div id="head-center">
		</div>
	</div>
	<div id="body">
		<div id="menu">
			<div class="container">
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/jsp/farmer/FarmerLoginSuccess.jsp">首页</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/jsp/farmer/FarmerUpdate.jsp">信息修改</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/farmerLookAllProjects.do">查看项目</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/farmerLookOrders.do">我的订单</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/jsp/farmer/FarmerPlaceOrder.jsp">发布订单</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="/ssmdemo/index.jsp">退出登录</a>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<h2>请填写修改信息：</h2>
			<form method="post" action="<%=request.getContextPath()%>/farmer/updateFarmer.do">
				 
				<div style="margin:30px 20px">
					账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp;
					<input type="text" id="farmeraccount" name="farmeraccount" style="background-color:white;" 
					value="${loginedfarmer.getFarmeraccount()}" required="required" readonly="readonly">
				</div>
				<div style="margin:30px 20px">
					姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp;
					<input type="text" id="farmername" name="farmername" style="background-color:white;"
					value="${loginedfarmer.getFarmername()}" required="required" readonly="readonly">
				</div>
				<div style="margin:30px 20px">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;
					<input type="password" id="farmerpasswd" name="farmerpasswd" style="background-color:white;"
					value="${loginedfarmer.getFarmerpasswd() }" required="required" readonly="readonly">
				</div>
				<div style="margin:30px 20px">
					<span id="repasswdSpan" hidden="hidden">
					确认密码:&nbsp;&nbsp;<input type="password" id="repasswd" name="repasswd" 
					style="background-color:white;" required="required" ></span>
				</div>
				<div style="margin:30px 20px">
					手&nbsp;机&nbsp;号:&nbsp;&nbsp;
					<input type="text" id="farmerphone" name="farmerphone" style="background-color:white;"
					value="${loginedfarmer.getFarmerphone()}" required="required" readonly="readonly">
				</div>
				<div style="margin:30px 20px">
					地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp;
					<input type="text" id="farmeraddress" name="farmeraddress" style="background-color:white;"
					value="${loginedfarmer.getFarmeraddress()}" required="required" readonly="readonly">
				</div>
				
				&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="点我修改个人信息" onclick="editButton();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<input type="submit" id="submitButton" value="确认" onclick="return checkfun()" hidden="hidden">
				
			 </form>
		</div>
	</div>

	<script type="text/javascript">
		var links = document.getElementsByClassName('link')
		for (var i = 0; i <= links.length; i++)
			addClass(i)
	
	
		function addClass(id) {
			setTimeout(function() {
				if (id > 0) links[id - 1].classList.remove('hover')
				links[id].classList.add('hover')
			}, id * 750)
		}
		
		function editButton(){
			$("#submitButton").show();
			$("#repasswd").show();
			$("#repasswdSpan").show();
			removeReadonly();
		}
		
		function removeReadonly(){
			$("#farmername").removeAttr("readonly");
			$("#farmerpasswd").removeAttr("readonly");
			$("#farmerphone").removeAttr("readonly");
			$("#farmerqq").removeAttr("readonly");
			$("#farmeraddress").removeAttr("readonly");
		}
		
		function checkfun(){
			var farmerpasswd = document.getElementById("farmerpasswd").value;
			var repasswd = document.getElementById("repasswd").value;
			if(farmerpasswd!=repasswd){
				alert("两次密码输入不一致，请重新输入");
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
