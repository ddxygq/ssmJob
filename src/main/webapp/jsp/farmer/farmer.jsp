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
			@import url("<%=request.getContextPath()%>/css/farmer2.css");
			.but{
    			background: #222 url(/images/alert-overlay.png) repeat-x;
				display: inline-block;
				padding: 5px 10px 6px;
				color: #fff;
				line-height: 1;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
				width : 85px;
			}
			table{
				margin-top : 30px;
			}
			table, td {
				border: 1px solid pink;
				text-align : center;
			}
			
			td{width:200px;font-size : 13px;}
    		
    		th{
    			background-color : #000;
    			color:#fff;
    			font-size : 17px;
    		}
		</style>
		<script src="js/farmer/farmer.js"></script>
		<script type="text/javascript">
			var person_id;
			$(function() {
				var data = '${param.data}';
				data = '{' + data + '}';
				data = $.parseJSON(data);
				person_id = data.person_id;
				var person_name = data.person_name;
				var html = [];
				html.push("<h2>" + "欢迎农户  ： " + person_name + "</h2>");
				var head_center = document.getElementById("farmer_head");
				head_center.innerHTML = html.join("");
				$('#farmername').val(person_name);
				$('#farmerphone').val(data.person_account);
				$('#farmeraccount').val(data.person_account);
				$('#farmerpasswd').val(data.person_pwd);
				
				// 隐藏保存按钮
				$('#saveBut').hide();
				
				// 隐藏错误信息
				$('#errorInfo').hide();
			});
		</script>
	</head>
  
	<body>
		<div id="farmer_head"></div>
		<div>
			<div id="f_list" class="easyui-panel" data-options="title:'功能区',width:fixWidth(0.15),height:500">
				<ul>
					<li style='margin-top:30px;'><input class="but" onclick='myInfo()' type="button" value='我的信息'></li>
					<li><input class="but" onclick='modifyInfo()' type="button" value='修改信息'></li>
					<li><input class="but" onclick='allProject()' type="button" value='所有项目'></li>
					<li><input class="but" onclick='showMyOrders()' type="button" value='查看订单'></li>
					<li><input class="but" onclick='exit()' type="button" value='退出'></li>
				</ul>
			</div>
			<div id="info" class="easyui-panel" data-options="title:'数据区域',width:fixWidth(0.85),height:500">
				<div id='projectInfo'></div>
				<div class="message">
					账&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;号:&nbsp;&nbsp; <input
						type="text" id="farmeraccount" name="farmeraccount"
						style="background-color:white;" required="required"
						readonly="readonly">
				</div>
				<div class="message">
					姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:&nbsp;&nbsp; <input
						type="text" id="farmername" name="farmername"
						style="background-color:white;" required="required"
						readonly="readonly">
				</div>
				<div class="message">
					密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp; <input
						type="text" id="farmerpasswd" name="farmerpasswd"
						style="background-color:white;" required="required"
						readonly="readonly">
				</div>
				<div class="message">
					手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp; <input type="text" id="farmerphone"
						name="farmerphone" style="background-color:white;"
						required="required"
						readonly="readonly">
				</div>
	
				<div class="message">
					地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:&nbsp;&nbsp; <input type="text"
						id="farmeraddress" name="farmeraddress"
						style="background-color:white;"
						value="${data.person_name}" required="required"
						readonly="readonly">
				</div>
				
				<div style="margin:30 60;float:left;">
					<input class="but" type="button" style="width:90px;" value='保存修改' onclick='saveBut()' id='saveBut'>
				</div>
				<div style="float:left;margin:30 -30;"><input type="text" id="errorInfo" style="width:250px;height:30px;;background-color:#fff;"></div>
				<div id="myOrders"></div>
			</div>
		</div>
	</body>
</html>