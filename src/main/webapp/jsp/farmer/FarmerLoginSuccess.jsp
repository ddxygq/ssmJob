<%@ page pageEncoding="UTF-8" %>
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
	<script type="text/javascript"
	src="<%=request.getContextPath()%>/jquery-easyui-1.5.4/jquery.min.js"></script>
	<title>欢迎登录</title>
	<style type="text/css">
		@import url("<%=request.getContextPath()%>/css/farmer.css");
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
						<a
							href="<%=request.getContextPath()%>/jsp/farmer/FarmerLoginSuccess.jsp">首页</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a
							href="<%=request.getContextPath()%>/jsp/farmer/FarmerUpdate.jsp">信息修改</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/farmerLookAllProjects.do">查看项目</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a
							href="<%=request.getContextPath()%>/jsp/farmer/FarmerPlaceOrder.jsp">发布订单</a>
					</div>
				</div>
				<div class="link">
					<div class="text">
						<a href="<%=request.getContextPath()%>/farmerLookOrders.do">我的订单</a>
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
			<h2>用户信息：</h2>
			<div style="margin:30px 20px">
				账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp; <input
					type="text" id="farmeraccount" name="farmeraccount"
					style="background-color:white;" required="required"
					readonly="readonly">
			</div>
			<div style="margin:30px 20px">
				姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp; <input
					type="text" id="farmername" name="farmername"
					style="background-color:white;" required="required"
					readonly="readonly">
			</div>
			<div style="margin:30px 20px">
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp; <input
					type="password" id="farmerpasswd" name="farmerpasswd"
					style="background-color:white;" required="required"
					readonly="readonly">
			</div>
			<div style="margin:30px 20px">
				<span id="repasswdSpan" hidden="hidden"> 确认密码:&nbsp;&nbsp;<input
					type="password" id="repasswd" name="repasswd"
					style="background-color:white;" required="required"></span>
			</div>
			<div style="margin:30px 20px">
				手&nbsp;机&nbsp;号:&nbsp;&nbsp; <input type="text" id="farmerphone"
					name="farmerphone" style="background-color:white;"
					required="required"
					readonly="readonly">
			</div>

			<div style="margin:30px 20px">
				地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp; <input type="text"
					id="farmeraddress" name="farmeraddress"
					style="background-color:white;"
					value="${data.person_name}" required="required"
					readonly="readonly">
			</div>
		</div>
	</div>

	<script type="text/javascript">
		var links = document.getElementsByClassName('link')
		for (var i = 0; i <= links.length; i++)
			addClass(i);
		function addClass(id) {
			setTimeout(function() {
				if (id > 0) links[id - 1].classList.remove('hover');
				// links[id].classList.add('hover');
			}, id * 750)
		}
		
	</script>
	
	<script type="text/javascript">
		var data = '${param.data}';
		data = '{' + data + '}';
		data = $.parseJSON(data);
		var person_name = data.person_name;
		var html = [];
		html.push("<h2>" + "欢迎农户  ： " + person_name + "</h2>");
		var head_center = document.getElementById("head-center");
		head_center.innerHTML = html.join("");
		
		$('#farmername').val(person_name);
		$('#farmerphone').val(data.person_account);
		$('#farmeraccount').val(data.person_account);
		$('#farmerpasswd').val(data.person_pwd);
		
		
	</script>
</body>
</html>