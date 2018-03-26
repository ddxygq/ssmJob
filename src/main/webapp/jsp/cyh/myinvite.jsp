<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	
    	<script src="js/cyh/myinvite.js" type="text/javascript"></script>
    	
    	<script type="text/javascript">
    		var person_id=${person_id};
    	</script>   	
	</head>
  
	<body>
		<table id="dg"></table>
	</body>
</html>