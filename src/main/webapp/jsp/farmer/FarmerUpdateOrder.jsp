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
<title>修改订单</title>
	 <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css"/>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/js/jqPaginator.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/jstime/WdatePicker.js"></script>
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
	height: 85%;
	border: solid;
}

#head {
	height: 15%;
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
	border: solid 1px;
	float: left;
	height: 100%
}

#head-center {
	width: 60%;
	text-align: center;
	background-color: red;
	margin: auto auto;
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
						<a href="<%=request.getContextPath()%>/jsp/farmer/FarmerPlaceOrder.jsp">发布订单</a>
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
			<h2>请填写修改订单信息</h2>
			<h1>${errormessage}</h1>
				<form action="<%=request.getContextPath()%>/farmer/saveFarmerOrder.do">
					<div style="margin:30px 20px">
					订单编号:<input type="text" id="orderid" name="orderid" value="${order.getOrderid() }"
					 readonly="readonly"/>	
					</div>
					<div style="margin:30px 20px">
					所属项目:<select id=projectid name="projectid">
							<option value="-1">--请选择--</option>
							<c:forEach items="${projects }" var="oneProject">
								<option value="${oneProject.getProjectid() }">${oneProject.getProjectname() }</option>
							</c:forEach>
						</select>*
					</div>
					<div style="margin:30px 20px">
					订单名称:<input type="text" id="ordertype" name="ordertype" value="${order.getOrdertype()}" 
						maxlength="20"  required="required" />*
					</div>
					<div style="margin:30px 20px">
					创建时间:<input type="text" id="starttime" name="starttime" value="${order.getSatrttime()}" 
					 required="required"/>*	
					</div>
					<div style="margin:30px 20px">
					结束时间:<input type="text" id="endtime" name="endtime" value="${order.getEndtime()}" onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					 required="required"/>*
					</div>
					<div style="margin:30px 20px">
					工人数目:<input type="text" id="peoplenum" name="peoplenum" maxlength="10"  value="${order.getPeoplenum()}"
						required="required"/>*
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="确认修改" onclick="true"/>&nbsp;
					<input type="reset" value="重置"/><br/>
				</form>
		</div>
	</div>

	<script>
		var links = document.getElementsByClassName('link')
		for (var i = 0; i <= links.length; i++)
			addClass(i)
	
	
		function addClass(id) {
			setTimeout(function() {
				if (id > 0) links[id - 1].classList.remove('hover')
				links[id].classList.add('hover')
			}, id * 750)
		}
	</script>
</body>
</html>