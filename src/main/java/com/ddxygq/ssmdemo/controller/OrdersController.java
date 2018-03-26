package com.ddxygq.ssmdemo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.ddxygq.ssmdemo.bean.CommonParam;
import com.ddxygq.ssmdemo.service.OrdersService;

@Controller
public class OrdersController {
	@Resource
	OrdersService ordersService;
	
	@RequestMapping("/queryOrders.do")
	@ResponseBody
	public List<Map<String, Object>> queryOrders(HttpServletRequest req){
		String flag = req.getParameter("flag");
		int startData = (Integer.valueOf(req.getParameter("curPage2")) - 1) * CommonParam.pageSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("person_id", req.getParameter("person_id"));
		map.put("startData", startData);
		map.put("pageSize", CommonParam.pageSize);
		List<Map<String, Object>> result = ordersService.queryOrders(map);
		System.out.println(result);
		return result;
	}
	// 订单总数
	@RequestMapping("/OrdersCount.do")
	@ResponseBody
	public int myOrdersCount(HttpServletRequest req) {
		String flag = req.getParameter("flag");
		// 我的订单总数
		if("1".equals(flag)){
			int len = ordersService.myOrdersCount(req.getParameter("person_id"));
			return len % CommonParam.pageSize == 0 ? len / CommonParam.pageSize : len / CommonParam.pageSize + 1;
		}else{ // 可接订单
			int len = ordersService.canorderCount(req.getParameter("person_id"));
			return len % CommonParam.pageSize == 0 ? len / CommonParam.pageSize : len / CommonParam.pageSize + 1;
		}
		
	}
	
	@RequestMapping("/myWorker.do")
	@ResponseBody
	public ModelAndView orderWorker(@RequestParam Map<String, String> map){
		ModelAndView mav = new ModelAndView("jsp/header/showMyWorker");
		 mav.addObject("result", JSON.toJSON(ordersService.orderWorker(map)));
		return mav;
		
	}
	
	// 可接订单
	@RequestMapping("/canorder.do")
	@ResponseBody
	public List<Map<String, Object>> canorder(HttpServletRequest req){
		int startData = (Integer.valueOf(req.getParameter("curPage2")) - 1) * CommonParam.pageSize;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("person_id", req.getParameter("person_id"));
		map.put("startData", startData);
		map.put("pageSize", CommonParam.pageSize);
		return ordersService.canorder(map);
	}
	
	@RequestMapping("/askOrder.do")
	@ResponseBody
	public String askOrder(@RequestBody Map<String, String> map){
		Map<String, Object> result = ordersService.sureOrder(map);
		if(result != null){
			return "{\"result\":" + false + "}";
		}else{
			ordersService.askOrder(map);
			return "{\"result\":" + true + "}";
		}
		
	}
	
	
	
}
