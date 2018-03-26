package com.ddxygq.ssmdemo.service;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ddxygq.ssmdemo.dao.OrdersMapper;
import com.ddxygq.ssmdemo.pojo.OrderHeader;

@Service
@Transactional
public class OrdersService {
	
	@Resource OrdersMapper ordersMapper;
	
	// 所有订单
	public List<Map<String, Object>> queryOrders(Map<String, Object> map){
		return ordersMapper.queryOrders(map);
	}
	
	// 查询某个订单下的我的工人
	public List<Map<String, Object>> orderWorker(Map<String, String> map){
		return ordersMapper.orderWorker(map);
	}
	
	public List<Map<String, Object>> canorder(Map<String, Object> map){
		return ordersMapper.canorder(map);
	}
	public int canorderCount(String person_id){
		return ordersMapper.canorderCount(person_id);
	}
	
	public Map<String, Object> sureOrder(Map<String, String> map){
		return ordersMapper.sureOrder(map);
	}
	public void askOrder(Map<String, String> map){
		map.put("orderheader_id",UUID.randomUUID().toString());
		ordersMapper.askOrder(map);
	}
	
	public int myOrdersCount(String person_id){
		return ordersMapper.myOrdersCount(person_id);
	}
}
