<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户注册</title>
		<base href="<%=basePath%>">

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	
    	<script src="/ssmdemo/js/register.js"></script>
    	
	</head>
  
	<body>
		<div style="width:30%;margin : 30 auto;">
			<div style="width:100%;"><h1>用户注册</h1></div>
			<form id="register" method="post">
				电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话&nbsp;:&nbsp;<input class="easyui-numberbox" id="person_account" name="person_account" data-options="required:true"/><br/><br/>
				姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名&nbsp;:&nbsp;<input class="easyui-textbox" id="person_name" name="person_name" data-options="required:true"/><br/><br/>
				密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;:&nbsp;<input class="easyui-passwordbox" id="person_pwd" name="person_pwd" data-options="required:true,showEye:false"/><br/><br/>
				确认密码&nbsp;:&nbsp;<input class="easyui-passwordbox" validType="equalTo['person_pwd']" data-options="required:true,showEye:false"/><br/><br/>
				身&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;份&nbsp;&nbsp;:&nbsp;<select id="person_role" name="person_role"></select><br/><br/>
				<div style="width:50%;margin : 0 auto;"><input type="button" value="注册" onclick="subRegister()" /></div>
				
			</form>
		</div>
	</body>
</html>