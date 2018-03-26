package com.ddxygq.ssmdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddxygq.ssmdemo.pojo.Person;
import com.ddxygq.ssmdemo.pojo.Role;
import com.ddxygq.ssmdemo.service.PersonService;


@Controller
public class TheController {

	@Resource
	PersonService personService;
	
	/**
	 * 登录，根据账号和密码查询用户
	 * @param person_account
	 * @param person_pwd
	 * @return
	 */
	@RequestMapping("/queryPersonByPwd.do")	
	@ResponseBody
	public Map<String, String> queryPersonByPwd(HttpServletRequest req,HttpServletResponse res) {
		String person_account = req.getParameter("person_account");
		String person_pwd = req.getParameter("person_pwd");
		Map<String, String> map = new HashMap<String, String>();
		map.put("person_account", person_account);
		map.put("person_pwd", person_pwd);
		System.out.println(map);
		Map<String, String> result = personService.queryPersonByPwd(map);
		System.out.println("result : " + result);
		if(result != null){
			req.getSession().setAttribute("person_id",result.get("person_id"));
			req.getSession().setAttribute("role_id",result.get("role_id"));
			req.getSession().setAttribute("person_name",result.get("person_name"));
			req.getSession().setAttribute("person_account",result.get("person_account"));
			req.getSession().setAttribute("person_pwd",result.get("person_pwd"));
			if(result.get("person_address") != null){
				req.getSession().setAttribute("person_address",result.get("person_address"));
			}
			return result;
		}
		
		return null;
	}
	
	/**
	 * 添加一名用户
	 * @param person
	 * @return
	 */
	@RequestMapping("/insertPerson.do")	
	@ResponseBody
	public String insertPerson(Person person) {
		boolean flag = personService.insertPerson(person);
		return "{\"result\" : " + flag + "}";
	}
	
	/**
	 * 列出用户类型的select选项
	 * @return
	 */
	@RequestMapping("/queryRole.do")
	@ResponseBody
	public List<Role> queryRole() {
		return personService.queryRole();
	}
}
