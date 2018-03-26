package com.ddxygq.ssmdemo.dao;

import java.util.List;
import java.util.Map;

public interface FarmerDao {

	/**
	 * 获取所有项目信息
	 * @param map
	 * @return
	 */
	List<Map<String, Object>> getAllProject();
	
	/**
	 * 农户根据自己的账户查询自己已发布的订单
	 * @param farmeraccount  农户账户
	 * @return 
	 */
	List<Map<String, Object>> lookFarmerOrders();
	
	/**
	 * 发布订单
	 * @param map
	 * @return
	 */
	void addOrder(Map<String, String> map);
	
	// 更新农户信息
	void updatePerson(Map<String, String> map);
	
	// 查看农户发布订单
	List<Map<String, Object>> showMyOrders(Map<String, String> map);
	
}
