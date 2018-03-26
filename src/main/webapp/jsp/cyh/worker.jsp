<%@ page language="java" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<script type="text/javascript">
			var person_id = ${person_id};
		</script>

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>    	
	</head>
  
  <body>
	  <style type="text/css">
			a{
				text-decoration: none;
			}		
			#div1{
				width: 1300px;
				height:800px;
				text-align: center;
				background: url(images/ming/2.jpg);
			}
			#div2{
				border:5px solid gray;
				box-shadow: 10px 10px 5px #888888;
				width:90%;
				margin-top:30px;
				margin-left:auto;
				margin-right:auto;	
			}
			#div3{
				border:5px solid gray;
				box-shadow: 10px 10px 5px #888888;
				width:90%;
				height:70%;
				margin-top:30px;
				margin-left:auto;
				margin-right:auto;
				position: relative;
			}
			#div4{				
				width:400px;
				height:400px;
				margin:auto;
				position: absolute;
				top:0;left:0;bottom:0;right:0;
				background-color:white;
			}			
		</style>
		
       <div id="div1">
			<div id="div2">
			    <h2>欢迎工人:<font color="blue" size="6">${person_name}</font></h2>
				<h1 style="color:red">工&nbsp&nbsp作&nbsp&nbsp管&nbsp&nbsp理&nbsp&nbsp页&nbsp&nbsp面</h1>
			</div>
	
			<div id="div3">	
				<div id="div4">
					<a href="jsp/cyh/myinvite.jsp"><h1 style="color:blue">我的邀请</h1></a><br><br>
					<a href="jsp/cyh/myorders.jsp" ><h1 style="color:red">我的订单</h1></a><br><br>
					<a href="jsp/cyh/myteam.jsp" ><h1 style="color:gold">我的队伍</h1></a><br><br>
					<a href="/ssmdemo/jsp/commonJsp/update.jsp" ><h1 style="color:gold">修改资料</h1></a><br><br>
					<a href="index.jsp" ><h1 style="color:gold">退出</h1></a><br><br>
				</div>
			</div>
			
	   </div>
  </body>
</html>
