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
<title>我的订单</title>
	 <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/js/bootstrap.min.css"/>
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
		  <input type="hidden" id="allpage" value="${allpage }" />
		  <input type="hidden" id="page" value="${page }"/>
		    <h2>我的订单列表：</h2>
		    <table width="95%" border="2px">
		    <tr>
		    	<th>序号</th>
		        <th>订单所属的项目</th>
		  		<th>订单名称</th>
		   	 	<th>创建时间</th>
		   		<th>结束时间</th>
		   	   	<th>实际结束时间</th>
		   	   	<th>创建者</th>
		   	   	<th>工人人数</th>
		    </tr>
		    <c:forEach items="${orders }" var="ones" >
		   	  <tr>
		    	<td>${ones.count }</td>
		    	<td>${ones.project_id }</td>
		    	<td>${ones.order_name}</td>
		    	<td><fmt:formatDate value="${ones.starttime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    	<td><fmt:formatDate value="${ones.endtime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    	<td><fmt:formatDate value="${ones.trueendtime }" pattern="yyyy-MM-dd hh:mm:ss"/></td>
		    	<td>${ones.createid }</td>
		    	<td>${ones.personnumber}</td>
		     </tr>
		    </c:forEach>
		    </table>
		</div>
	</div>

	<script>
		
	</script>
</body>
</html>

