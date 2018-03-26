package com.ddxygq.ssmdemo.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ddxygq.ssmdemo.service.impl.FarmerServiceImpl;


@Controller
public class FarmerController {
	@Resource
	private FarmerServiceImpl farmerServiceImpl;

	/**
	 * 查询项目
	 * @return
	 */
	@RequestMapping(value = "allProject.do")
	@ResponseBody
	public List<Map<String, Object>> allProject() {
		System.out.println("---------------所有工程-----------");
		List<Map<String, Object>> result = farmerServiceImpl.getAllProject();
		System.out.println(result);
		// 创建页面所需要的项目数据
		return result;
		
	}

	/**
	 * 查看订单
	 * 
	 * @return
	 */
	@RequestMapping(value = "farmerLookOrders.do")
	public ModelAndView ordersList() {
		List<Map<String, Object>> list = farmerServiceImpl.lookFarmerOrders();
		ModelAndView mView = new ModelAndView();
		mView.setViewName("/FarmerLookOrders");
		mView.addObject("orders", list);
		return mView;
	}

	/**
	 * 发布订单
	 * 
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws ServletException
	 */
	@RequestMapping("/addOrder.do")
	@ResponseBody
	public String addOrder(@RequestParam Map<String, String> map) {
		farmerServiceImpl.addOrder(map);
		System.out.println("数据：" + map);
		return "{\"result\":" + true + "}";
	}
	
	@RequestMapping("/farmerUpdatePerson.do")
	@ResponseBody
	public String updatePerson(@RequestParam Map<String, String> map){
		farmerServiceImpl.updatePerson(map);
		return "{\"result\":" + true + "}";
	}
	
	@RequestMapping("/showMyOrders.do")
	@ResponseBody
	public List<Map<String, Object>> showMyOrders(@RequestParam Map<String, String> map){
		return farmerServiceImpl.showMyOrders(map);
	}
		
}
