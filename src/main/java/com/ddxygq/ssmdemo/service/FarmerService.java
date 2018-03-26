package com.ddxygq.ssmdemo.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

@Service
public interface FarmerService {

/**
 * 查看项目
 */
	public List<Map<String, Object>>  getAllProject();
	//查看订单
	public List<Map<String, Object>>  lookFarmerOrders();
	
	//发布订单
	
	void addOrder(Map<String, String> map);
	
	// 更新农户信息
	void updatePerson(Map<String, String> map);
	
	List<Map<String, Object>> showMyOrders(Map<String, String> map);
	
}
