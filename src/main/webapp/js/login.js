function login() {
	var param = {};
	var person_account = $('#person_account').val();
	var person_pwd = $('#person_pwd').val();
	if (person_account == '' || person_pwd == '') {
		alert("账号密码不能为空");
		return;
	}
	param.person_account = person_account
	param.person_pwd = person_pwd

	$.ajax({
		url : "queryPersonByPwd.do",
		type : "post",
		data : param,
		success : function(data) {
			if (data) {
				alert("登录成功！");
				if (data == '2') {
					location.href = "jsp/personManager.jsp";
				}
			} else {
				alert("用户名或者密码错误");
			}
		},
		error : function() {
			alert("登录加载出错！");
		}
	});
}