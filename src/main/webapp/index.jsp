<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>欢迎来到短工包宝</title>
    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	<style type="text/css">
    		.but{
    			background: #222 url(/images/alert-overlay.png) repeat-x;
				display: inline-block;
				padding: 5px 10px 6px;
				color: #fff;
				line-height: 1;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
			}
			
			a{
				text-decoration: none;
			}
			
			a:hover{
				color : #666;
				text-decoration: line;
			}
    	</style>
    	<script type="text/javascript">
    		// 角色 id
    		// var role_id = '${param.role_id}';
    		function login() {
				var param = {};
				var person_account = $('#person_account').val();
				var person_pwd = $('#person_pwd').val();
				if(person_account == '' || person_pwd == ''){
					alert("账号密码不能为空");
					return;
				}
				param.person_account = person_account
				param.person_pwd = person_pwd
				
				$.ajax({
					url : "queryPersonByPwd.do",
					type : "post",
					data : param,
					success : function(data){
						if(data){
							if(data.person_flag == '1'){
								alert("对不起，你的用户注册还在审核中！");
								location.reload();
							}else if(data.person_flag == '3'){
								alert("对不起，你的审核未通过，请重新修改填写注册资料！");
								location.reload();
							}else{
								alert("登录成功！");
								if(data.role_id == '2'){
									location.href = "jsp/personManager.jsp?person_head=" + data.person_id;
								}else if(data.role_id == '1'){
									location.href = "jsp/cyh/worker.jsp?person_name=" + data.person_name;
								}else if(data.role_id == '3'){
									var str = '"person_id":"' +data.person_id +'","person_name":"' + data.person_name + 
									'","person_flag":"' + data.person_flag + '","role_name":"' + data.role_name +
									'","person_pwd":"' + data.person_pwd +
									 '","person_account":"' + data.person_account + '"';
									location.href = "jsp/farmer/farmer.jsp?data=" + str;
								}else{
									location.href = "/ssmdemo/jsp/admin/adminIndex.jsp";
								}
								
							}
						}else{
							alert("用户名或者密码错误");
						}
					},
					error : function(){
						alert("登录加载出错！");
					}
				});
			}
    	</script>
    	
	</head>
  
	<body>
		<div style="margin:50px auto;width:30%;">
			<div style="width:50%;"><h1>用户登录</h1></div>
			账号：<input id="person_account" class="easyui-textbox" data-options="required:true"><br/><br/>
			密码：<input id="person_pwd" class="easyui-passwordbox" prompt="Password" data-options="required:true,showEye:false"><br/><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;<input class="but" type="button" value=" 登录 " onclick="login()" class="easyui-butOk"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="/ssmdemo/jsp/register.jsp">注册</a>
		</div>
		
	</body>
</html>