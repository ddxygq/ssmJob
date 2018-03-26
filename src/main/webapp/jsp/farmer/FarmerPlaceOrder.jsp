<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>农户下单</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery-easyui-1.5.4/themes/default/easyui.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/jquery-easyui-1.5.4/themes/icon.css">
	<script src="<%=request.getContextPath()%>/jquery-easyui-1.5.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/jquery-easyui-1.5.4/jquery.easyui.min.js"></script>
	<script src="<%=request.getContextPath()%>/jquery-easyui-1.5.4/locale/easyui-lang-zh_CN.js"></script>
		
	<script type="text/javascript" src="<%=request.getContextPath()%>/commonjs/jquery-3.2.1.min.js"></script>
	<script type="text/javascript">

		
		function onlogin(){
            var project_id = $("#project_id").val();
            var order_name = $("#order_name").val();
            var endtime = $("#endtime").val();
            var starttime = $("#starttime").val();
            var personnumber = $("#personnumber").val();
            var param = {};
					param.project_id = project_id;
					param.order_name = order_name;
					param.endtime = endtime;
					param.starttime = starttime;
					param.personnumber = personnumber;
					alert(project_id);           
			 $.ajax({
                type:"post",
                url:"<%=request.getContextPath()%>/farmer/farmerPlaceOrder.do",
                data:param,
                success:loginsuccess,
                error:function (data) {
                    alert("提交失败!请重新提交");
                }
            });
		}

        /**
         * 登录成功返回方法
         * @param data
         */
        function loginsuccess(data){
            alert("提交成功");
        }
		
	</script>
</head>
<body>
	<div id="head">
		<div id="head-center">
		</div>
	</div>
	<div id="body">
					<div class="text">
						<a href="<%=request.getContextPath()%>/FarmerLoginSuccess.jsp">首页</a>
					</div>
				
		<div id="content">
			<h2>请填写订单信息</h2>
				<div style="margin:30px 20px">
					项目名称:<input type="text" id="project_id" name="project_id" style="color:black;
						maxlength="20"  required="required" />*
				</div>		
				<div style="margin:30px 20px">
					订单名称:<input type="text" id="order_name" name="order_name" style="color:black;
						maxlength="20"  required="required" />*
				</div>
				<div style="margin:30px 20px">
					开始时间：<input class="easyui-datebox" id="starttime"name="starttime" style="color:black;
					maxlength="20"  required="required" />					
				</div>
				<div style="margin:30px 20px">
					结束时间：<input class="easyui-datebox" id="endtime" name="endtime" style="color:black;
					maxlength="20"  required="required" />					
				</div>
				<div style="margin:30px 20px">
					工人数目:<input type="number" id="personnumber" name="personnumber" style="color:black;
						maxlength="10" required="required" />*
				</div>
				<input type="button" value="提交" onclick="onlogin()" />
				<input type="reset" value="清空" /><br/>
		</div>
</body>
</html>