<%@ page pageEncoding="UTF-8" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		
		<title>工人管理</title>

    	<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/default/easyui.css">
		<link rel="stylesheet" href="jquery-easyui-1.5.4/themes/icon.css">
		<script src="jquery-easyui-1.5.4/jquery.min.js"></script>
		<script src="jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
		<script src="jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
    	
    	<style type="text/css">
    		body{
				margin : 0 0;
				font-size : 20px;
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
    		
    		div{
    			float:left;
    		}
    		
    		li{
    			line-height:20px;
    		}
    		.but{
    			background: #222 url(/images/alert-overlay.png) repeat-x;
				display: inline-block;
				padding: 5px 10px 6px;
				color: #fff;
				line-height: 1;
				-moz-border-radius: 5px;
				-webkit-border-radius: 5px;
			}
    	</style>
    	
    	<script type="text/javascript">
    		// 工头用户id
    		var person_head = '${param.person_head}';
    	</script>
    	
    	<script src="js/personManager.js"></script>
    	
	</head>
		
	<body>
 		<h2>工人管理</h2>
 		<div class="easyui-panel" data-options="title:'功能区',width:fixWidth(0.15),height:300">
 			<ul>
 				<li><input class="but" type="button" id="init" value=" 所有工人 " size='50'></li><br>
 				<li><input class="but" type="button" id="filter" value=" 待邀工人 " size='50'><br></li><br>
 				<li><input class="but" type="button" id="myWorker" value=" 我的工人 " size='50'></li>
 			</ul>
 		</div>
 		
 		<div class="easyui-panel" data-options="title:'信息区域',width:fixWidth(0.83),height:300">
 			<div  style="float:none;"id="personDiv" class="easyui-data" data-options="title:'数据区域'"></div>
			<div style="float:none;">
				<input class="but" type="button" id="lastPage" value="上一页">&nbsp;&nbsp;
  				第&nbsp;<input type="text" id="curPage" size='3'>&nbsp;页
  				<input class="but" type="button" id="nPage" value="确定">
  				<input class="but" type="button" id="nextPage" value="下一页">&nbsp;&nbsp;
  				共&nbsp;<input type="text" id="page" readonly="readonly" size="3">&nbsp;页
			</div>
 		</div>
 		
 		<h2>订单管理</h2>
 		<div class="easyui-panel" data-options="title:'功能区',width:fixWidth(0.15),height:300">
 			<ul>
 				<li><input class="but" type="button" onclick="myOrders()" value=" 我的订单 " size='50'></li><br>
 				<li><input class="but" type="button" onclick="canorders()" value=" 可接订单 " size='50'></li>
 				
 			</ul>
 		</div>
 		
 		<div class="easyui-panel" data-options="title:'信息区域',width:fixWidth(0.84),height:300">
 			<div id="ordersDiv" class="easyui-data" data-options="title:'数据区域'"></div>
			<div>
				<input class="but" type="button" id="lastPage2" onclick='lastPage2()' value="上一页">&nbsp;&nbsp;
  				第&nbsp;<input type="text" id="curPage2" size='3'>&nbsp;页
  				<input class="but" type="button" id="nPage2" onclick='nPage2()' value="确定">
  				<input class="but" type="button" id="nextPage2" onclick='nextPage2()' value="下一页">&nbsp;&nbsp;
  				共&nbsp;<input type="text" id="page2" readonly="readonly" size="3">&nbsp;页
			</div>
 		</div>
 		<a href="/ssmdemo/index.jsp">退出</a>
	</body>
</html>