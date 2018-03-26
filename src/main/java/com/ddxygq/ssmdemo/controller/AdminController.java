package com.ddxygq.ssmdemo.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ddxygq.ssmdemo.service.AdminService;

@Controller
public class AdminController {
	@Resource
	AdminService adminService;

	@RequestMapping("/getAllPerson.do")
	@ResponseBody
	public Map<String, Object> getAllPerson(int page, int rows) {

		return adminService.getAllPerson(page, rows);
	}

	@RequestMapping("/queryForFarmer.do")
	@ResponseBody
	public Map<String, Object> queryForFammer(int page, int rows, String person_role) {

		return adminService.queryForFammer(page, rows, person_role);
	}

	@RequestMapping("/queryForHead.do")
	@ResponseBody
	public Map<String, Object> queryForHead(int page, int rows, String person_role) {

		return adminService.queryForHead(page, rows, person_role);
	}

	@RequestMapping("/queryForWorker.do")
	@ResponseBody
	public Map<String, Object> queryForWorker(int page, int rows, String person_role) {

		return adminService.queryForWorker(page, rows, person_role);
	}

	@RequestMapping("/updatePwd.do")
	@ResponseBody
	public String updatePwd(String person_id) {

		boolean flag = adminService.updatePwd(person_id);

		return "{\"result\" : " + flag + "}";
	}

	@RequestMapping("/queryForFlag.do")
	@ResponseBody
	public Map<String, Object> queryForFlag(int page, int rows) {

		return adminService.queryForFlag(page, rows);
	}

	@RequestMapping("/queryForFlag2.do")
	@ResponseBody
	public Map<String, Object> queryForFlag2(int page, int rows) {

		return adminService.queryForFlag2(page, rows);
	}

	@RequestMapping("/updateFlag.do")
	@ResponseBody
	public String updateFlag(String person_id) {

		boolean flag = adminService.updateFlag(person_id);

		return "{\"result\" : " + flag + "}";
	}

	@RequestMapping("/queryForLike.do")
	@ResponseBody
	public Map<String, Object> queryForLike(int page, int rows, String person_account) {

		return adminService.queryForFammer(page, rows, person_account);
	}
}
