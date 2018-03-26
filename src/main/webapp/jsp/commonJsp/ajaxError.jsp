<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<link rel="stylesheet" href="/ssmdemo/jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="/ssmdemo/jquery-easyui-1.5.4/themes/icon.css">
		<script src="/ssmdemo/jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="/ssmdemo/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="/ssmdemo/jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
		<style type="text/css">
			body{margin : 0 0;}
			img{
				float : left;
				width : 25%;
			}
			div{text-align : center;}
		</style>
	</head>
	<body>
		<br>
		<div><h1>服务器妹子走丢了...</h1></div>
		<img alt="只能找到这个妹子" src="<%=request.getContextPath()%>/images/girls/1.jpg">
		<img alt="只能找到这个妹子" src="<%=request.getContextPath()%>/images/girls/2.jpg">
		<img alt="只能找到这个妹子" src="<%=request.getContextPath()%>/images/girls/3.jpg">
		<img alt="只能找到这个妹子" src="<%=request.getContextPath()%>/images/girls/4.jpg">
	</body>
	
</html>